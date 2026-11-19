#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdarg.h>

#include "xparameters.h"
#include "xdevcfg.h"
#include "xdevcfg_hw.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xstatus.h"
#include "xiltimer.h"
#include "sleep.h"
#include "platform.h"
#include "xds_cnn_hw.h"

/* Uart */
#include "xuartps.h"



/* Partial bitstreams generated using xxd -i */
#include "rm1.h"
#include "rm2.h"

/* Suppress text while the host expects binary inference replies. */
static volatile int g_quiet = 0;


#define AP_IDLE_BIT       2U
#define AP_DONE_MASK      (1U << AP_DONE_BIT)
#define AP_IDLE_MASK      (1U << AP_IDLE_BIT)

#define CNN_TIMEOUT_US    2000000ULL



/******************************************************************************
- HARDWARE DEFINITIONS
 ******************************************************************************/
#define MAX_BITSTREAM_SIZE      2213820U

#define PCAP_COMPLETION_MASK \
    (XDCFG_IXR_DMA_DONE_MASK | XDCFG_IXR_D_P_DONE_MASK)


#define DFX_DECOUPLER_BASEADDR  XPAR_DFX_DECOUPLER_0_BASEADDR // 0x43C00000
#define DFX_DECOUPLER_CONTROL   0x00U //DOCUMENTATION

/* Decoupling control */
#define DECOUPLE_ENABLE         1U
#define DECOUPLE_DISABLE        0U

#define PCAP_BASEADDR            XPAR_XDEVCFG_0_BASEADDR
/* PCAP transfer timeout in milliseconds */
#define PCAP_TIMEOUT_MS         20000U

#define SWITCH_DELAY_SECONDS    1U

#define ACCELERATOR_BASEADDR XPAR_XDS_CNN_0_BASEADDR   

#define FEATURE_BRAM_BASE  XPAR_AXI_BRAM_CTRL_0_BASEADDR
/* TODO: Check these against xsnn_mlp_hw.h from the actual DFX RM. */
#define REG_FEATURE_MEM_L  0x10
#define REG_FEATURE_MEM_H  0x14
// ============================================================
// CNN IP CONFIGURATION
// Address confirmed from uploaded xparameters.h
// ============================================================
// HLS AXI-Lite register offsets
#define REG_AP_CTRL       0x00
#define REG_INPUT_IMG_L   0x10
#define REG_INPUT_IMG_H   0x14
#define REG_PRED_OUT      0x1C
#define REG_LOGITS_BASE   0x30

#define AP_START_BIT      0
#define AP_DONE_BIT       1


// ============================================================
// CNN INPUT: 60 x 80
// ============================================================
#define IMG_H     60
#define IMG_W     80
#define N_INPUTS  (IMG_H * IMG_W)
#define RX_BYTES  (N_INPUTS * 2)

// ============================================================
// SNN feature config
// ============================================================
#define T_STEPS     5
#define GRID_H      12
#define GRID_W      16
#define N_FEATURES  (GRID_H * GRID_W * 2)
#define TOTAL_FEATURES (T_STEPS * N_FEATURES)
#define RX_BYTES_SNN    (TOTAL_FEATURES * sizeof(int16_t))
#define FRAME_START_0  0xAA
#define FRAME_START_1  0x55

/******************************************************************************
- GLOBAL DRIVER INSTANCES
 ******************************************************************************/

static XDcfg Dcfg;

/*
- Aligned DMA buffer.
 *
- Static allocation ensures that this does not consume stack memory.
- The linker script must place this buffer in DDR.
 */
static unsigned char DmaBuffer[MAX_BITSTREAM_SIZE]
    __attribute__((aligned(64)));


/******************************************************************************
- TIMING STRUCTURE
 ******************************************************************************/

typedef struct
{
    XTime TotalStart;
    XTime TotalEnd;

    XTime DecoupleStart;
    XTime DecoupleEnd;

    XTime CopyStart;
    XTime CopyEnd;

    XTime FlushStart;
    XTime FlushEnd;

    XTime SetupStart;
    XTime SetupEnd;

    XTime DmaStart;
    XTime DmaSubmitted;
    XTime DmaDone;

    XTime PcapDone;

    XTime RecoupleStart;
    XTime RecoupleEnd;

} DFX_Timing;

/******************************************************************************
- UART CONFIG
 ******************************************************************************/
#ifndef UART_DEVICE_ID
#ifdef XPAR_XUARTPS_0_DEVICE_ID
#define UART_DEVICE_ID XPAR_XUARTPS_0_DEVICE_ID
#else
#define UART_DEVICE_ID 0
#endif
#endif

#ifndef UART_BAUD
#define UART_BAUD 4000000u
#endif


/******************************************************************************
- Helper Functions
 ******************************************************************************/

static void uart_printf(const char *format, ...);
 
/*
- Convert elapsed hardware timer ticks to microseconds.
 *
- Use 64-bit arithmetic to preserve precision.
 */
static uint64_t TimeToUs(XTime Start, XTime End)
{
    uint64_t Ticks;

    if (End < Start) {
        return 0U;
    }

    Ticks = (uint64_t)(End - Start);

    return (Ticks * 1000000ULL) /
           (uint64_t)COUNTS_PER_SECOND;
}


/*
- Print a measured interval in microseconds.
 *
- uart_printf supports 32-bit integer formatting.
- Our measurements are short enough to fit in 32 bits.
 */
static void PrintTime(
    const char *Name,
    XTime Start,
    XTime End
)
{
    uint64_t Us;

    Us = TimeToUs(Start, End);

    uart_printf(
        "%s: %u us\r\n",
        Name,
        (unsigned int)Us
    );
}

/******************************************************************************
- DECOUPLER CONTROL
 ******************************************************************************/

 /*
- Enable or disable DFX isolation.
 *
- 1: Both reconfigurable LED outputs forced LOW.
- 0: Normal RM outputs connected.
 */
static void DFX_SetDecouple(unsigned int Enable)
{
    Xil_Out32(
        DFX_DECOUPLER_BASEADDR + DFX_DECOUPLER_CONTROL,
        Enable ? DECOUPLE_ENABLE : DECOUPLE_DISABLE
    );
}

// ============================================================
// IP ACCESS FUNCTIONS
// ============================================================
static inline void ip_write(uint32_t offset, uint32_t value)
{
    Xil_Out32(ACCELERATOR_BASEADDR + offset, value);
}

static inline uint32_t ip_read(uint32_t offset)
{
    return Xil_In32(ACCELERATOR_BASEADDR + offset);
}

static int CNN_WaitForDone(uint32_t *FinalStatus)
{
    XTime Start, Now;
    uint32_t Status;

    XTime_GetTime(&Start);

    while (1)
    {
        /*
- IMPORTANT:
- ap_done is clear-on-read (COR).
- Preserve the status value that detects ap_done.
         */
        Status = ip_read(REG_AP_CTRL);

        if (Status & AP_DONE_MASK)
        {
            *FinalStatus = Status;
            return XST_SUCCESS;
        }

        XTime_GetTime(&Now);

        if (TimeToUs(Start, Now) >= CNN_TIMEOUT_US)
        {
            *FinalStatus = Status;
            return XST_FAILURE;
        }
    }
}


/******************************************************************************
- INITIALIZE PCAP
 ******************************************************************************/

static int DFX_InitPCAP(void)
{
    int Status;
    XDcfg_Config *ConfigPtr;

    uart_printf("Initializing PCAP...\r\n");

    /*
- SDT-based Vitis platform:
- Lookup configuration using the base address.
     */
    ConfigPtr = XDcfg_LookupConfig(
        PCAP_BASEADDR
    );

    if (ConfigPtr == NULL) {
        uart_printf("ERROR: DevCfg configuration not found\r\n");
        return XST_FAILURE;
    }

    Status = XDcfg_CfgInitialize(
        &Dcfg,
        ConfigPtr,
        ConfigPtr->BaseAddr
    );

    if (Status != XST_SUCCESS) {
        uart_printf("ERROR: DevCfg initialization failed\r\n");
        return XST_FAILURE;
    }

    /*
- Enable PCAP and select it for partial reconfiguration.
     */
    XDcfg_EnablePCAP(&Dcfg);

    XDcfg_SelectPcapInterface(&Dcfg);

    /*
- Clear old interrupt status.
     */
    XDcfg_IntrClear(
        &Dcfg,
        PCAP_COMPLETION_MASK |
        XDCFG_IXR_ERROR_FLAGS_MASK
    );

    uart_printf("PCAP initialized\r\n");

    return XST_SUCCESS;
}


/******************************************************************************
- LOAD PARTIAL BITSTREAM WITH TIMING
 ******************************************************************************/

static int DFX_LoadPartial(
    const unsigned char *Bitstream,
    unsigned int SizeBytes,
    DFX_Timing *Timing
)
{
    int Status;
    u32 IntrStatus;
    u32 SizeWords;

    XTime CurrentTime;
    XTime TimeoutStart;

    uint64_t TimeoutUs;

    uintptr_t SourceAddress;

    int DmaFinished = 0;
    int PcapFinished = 0;

    /*
- Validate bitstream size.
     */
    if ((SizeBytes == 0U) ||
        (SizeBytes > MAX_BITSTREAM_SIZE) ||
        ((SizeBytes % 4U) != 0U)) {

        uart_printf("ERROR: Invalid bitstream size\r\n");
        return XST_FAILURE;
    }

    SizeWords = SizeBytes / 4U;

    /*
- -----------------------------------------------------
- MEASUREMENT 1: Copy bitstream to aligned DMA buffer
- -----------------------------------------------------
     */

    XTime_GetTime(&Timing->CopyStart);

    memcpy(
        DmaBuffer,
        Bitstream,
        SizeBytes
    );

    XTime_GetTime(&Timing->CopyEnd);


    /*
- -----------------------------------------------------
- MEASUREMENT 2: Flush data cache
- -----------------------------------------------------
     */

    XTime_GetTime(&Timing->FlushStart);

    Xil_DCacheFlushRange(
        (INTPTR)DmaBuffer,
        SizeBytes
    );

    XTime_GetTime(&Timing->FlushEnd);


    /*
- -----------------------------------------------------
- MEASUREMENT 3: Prepare PCAP controller
- -----------------------------------------------------
     */

    XTime_GetTime(&Timing->SetupStart);

    /*
- Ensure DMA command queue is available.
     */
    if (XDcfg_IsDmaBusy(&Dcfg) == XST_SUCCESS) {
        uart_printf("ERROR: PCAP DMA busy\r\n");
        return XST_FAILURE;
    }

    XDcfg_EnablePCAP(&Dcfg);

    XDcfg_SelectPcapInterface(&Dcfg);

    XDcfg_IntrClear(
        &Dcfg,
        PCAP_COMPLETION_MASK |
        XDCFG_IXR_ERROR_FLAGS_MASK
    );

    XTime_GetTime(&Timing->SetupEnd);


    /*
- -----------------------------------------------------
- MEASUREMENT 4: Start DMA transfer
- -----------------------------------------------------
     */

    SourceAddress =
        ((uintptr_t)DmaBuffer) | (uintptr_t)1U;

    XTime_GetTime(&Timing->DmaStart);

    Status = XDcfg_Transfer(
        &Dcfg,
        (void *)SourceAddress,
        SizeWords,
        (void *)(uintptr_t)XDCFG_DMA_INVALID_ADDRESS,
        0U,
        XDCFG_NON_SECURE_PCAP_WRITE
    );

    XTime_GetTime(&Timing->DmaSubmitted);

    if (Status != XST_SUCCESS) {
        uart_printf(
            "ERROR: XDcfg_Transfer failed: %d\r\n",
            Status
        );

        return XST_FAILURE;
    }


    /*
- -----------------------------------------------------
- MEASUREMENT 5: Wait for DMA and PCAP completion
- -----------------------------------------------------
     *
- DMA_DONE:
-   Configuration data has been transferred by DMA.
     *
- D_P_DONE:
-   PCAP transfer has completed.
     *
- Both conditions must be observed.
     */

    XTime_GetTime(&TimeoutStart);

    while (1) {

        IntrStatus = XDcfg_IntrGetStatus(&Dcfg);

        /*
- Check for errors.
         */
        if ((IntrStatus &
             XDCFG_IXR_ERROR_FLAGS_MASK) != 0U) {

            uart_printf(
                "ERROR: PCAP status = 0x%08x\r\n",
                IntrStatus
            );

            return XST_FAILURE;
        }

        /*
- Record DMA completion time.
         */
        if (!DmaFinished &&
            ((IntrStatus & XDCFG_IXR_DMA_DONE_MASK) != 0U)) {

            XTime_GetTime(&Timing->DmaDone);

            DmaFinished = 1;
        }

        /*
- Record PCAP completion time.
         */
        if (!PcapFinished &&
            ((IntrStatus & XDCFG_IXR_D_P_DONE_MASK) != 0U)) {

            XTime_GetTime(&Timing->PcapDone);

            PcapFinished = 1;
        }

        /*
- Both stages finished successfully.
         */
        if (DmaFinished && PcapFinished) {
            break;
        }

        /*
- Time-based timeout.
         */
        XTime_GetTime(&CurrentTime);

        TimeoutUs = TimeToUs(
            TimeoutStart,
            CurrentTime
        );

        if (TimeoutUs >=
            ((uint64_t)PCAP_TIMEOUT_MS * 1000ULL)) {

            uart_printf("ERROR: PCAP timeout\r\n");
            return XST_FAILURE;
        }
    }

    return XST_SUCCESS;
}


/******************************************************************************
- PRINT DFX TIMING REPORT
 ******************************************************************************/

static void DFX_PrintTiming(
    const char *RMName,
    const DFX_Timing *Timing,
    unsigned int SizeBytes
)
{
    uart_printf("\r\n");
    uart_printf("========================================\r\n");
    uart_printf(" DFX TIMING REPORT: %s\r\n", RMName);
    uart_printf("========================================\r\n");

    uart_printf(
        "Bitstream size: %u bytes\r\n",
        SizeBytes
    );

    PrintTime(
        "1. Decoupling       ",
        Timing->DecoupleStart,
        Timing->DecoupleEnd
    );

    PrintTime(
        "2. Memory copy      ",
        Timing->CopyStart,
        Timing->CopyEnd
    );

    PrintTime(
        "3. Cache flush      ",
        Timing->FlushStart,
        Timing->FlushEnd
    );

    PrintTime(
        "4. PCAP setup       ",
        Timing->SetupStart,
        Timing->SetupEnd
    );

    PrintTime(
        "5. DMA submission   ",
        Timing->DmaStart,
        Timing->DmaSubmitted
    );

    PrintTime(
        "6. DMA completion   ",
        Timing->DmaStart,
        Timing->DmaDone
    );

    PrintTime(
        "7. PCAP completion  ",
        Timing->DmaStart,
        Timing->PcapDone
    );

    PrintTime(
        "8. Recoupling       ",
        Timing->RecoupleStart,
        Timing->RecoupleEnd
    );

    uart_printf("----------------------------------------\r\n");

    PrintTime(
        "TOTAL DFX TIME     ",
        Timing->TotalStart,
        Timing->TotalEnd
    );

    uart_printf("========================================\r\n");
}

/******************************************************************************
- SWITCH RECONFIGURABLE MODULE
 ******************************************************************************/

static int DFX_SwitchRM(
    const unsigned char *Bitstream,
    unsigned int SizeBytes,
    const char *RMName
)
{
    int Status;

    DFX_Timing Timing;

    memset(&Timing, 0, sizeof(Timing));

    uart_printf("\r\nSwitching to %s...\r\n", RMName);

    /*
- Start total DFX measurement.
     */
    XTime_GetTime(&Timing.TotalStart);

    //Step 1: stop traffic
    // Status = DFX_StopTraffic();

    /*if (Status != XST_SUCCESS)
    {
        uart_printf("Traffic stop failed!\r\n");
        return XST_FAILURE;
    }*/

    /*
- -----------------------------------------------------
- Step 2: Decouple RP
- -----------------------------------------------------
     */

    XTime_GetTime(&Timing.DecoupleStart);

    DFX_SetDecouple(1U);

    XTime_GetTime(&Timing.DecoupleEnd);


    /*
- -----------------------------------------------------
- Step 3: Load partial bitstream
- -----------------------------------------------------
     */

    Status = DFX_LoadPartial(
        Bitstream,
        SizeBytes,
        &Timing
    );

    if (Status != XST_SUCCESS) {

        uart_printf(
            "ERROR: Failed to load %s\r\n",
            RMName
        );

        /*
- Keep the RP isolated after failure.
         */
        return XST_FAILURE;
    }


    /*
- -----------------------------------------------------
- Step 4: Reconnect RP
- -----------------------------------------------------
     */

    XTime_GetTime(&Timing.RecoupleStart);

    DFX_SetDecouple(0U);

    XTime_GetTime(&Timing.RecoupleEnd);


    /*
- Stop total DFX measurement.
     */
    XTime_GetTime(&Timing.TotalEnd);


    /*
- Print results after reconfiguration.
     */
    DFX_PrintTiming(
        RMName,
        &Timing,
        SizeBytes
    );

    uart_printf("%s active\r\n", RMName);

    return XST_SUCCESS;
}


#define AP_CTRL_OFFSET  0x00U
//#define AP_IDLE_MASK    0x04U

static int DFX_WaitForIdle(void)
{
    XTime Start, Now;

    XTime_GetTime(&Start);

    while (1)
    {
        u32 Status = Xil_In32(
            ACCELERATOR_BASEADDR + AP_CTRL_OFFSET
        );

        if (Status & AP_IDLE_MASK)
        {
            uart_printf("Accelerator is idle\r\n");
            return XST_SUCCESS;
        }

        XTime_GetTime(&Now);

        if (TimeToUs(Start, Now) > 2000000ULL)
        {
            uart_printf("ERROR: Accelerator timeout\r\n");
            return XST_FAILURE;
        }
    }
}

// ============================================================
// UART CONFIGURATION
// ============================================================
static void uart_set_baudrate(u32 baud)
{
    XUartPs Uart;

    XUartPs_Config *Cfg =
        XUartPs_LookupConfig(XPAR_XUARTPS_0_BASEADDR);

    if (Cfg == NULL)
        return;

    if (XUartPs_CfgInitialize(
            &Uart, Cfg, Cfg->BaseAddress) != XST_SUCCESS)
        return;

    XUartPs_SetOperMode(
        &Uart, XUARTPS_OPER_MODE_NORMAL);

    (void)XUartPs_SetBaudRate(&Uart, baud);
}

static uint8_t read_byte_blocking(void)
{
    return (uint8_t)inbyte();
}

static void wait_for_frame_header(void)
{
    while (1)
    {
        uint8_t b0 = read_byte_blocking();

        if (b0 == FRAME_START_0)
        {
            uint8_t b1 = read_byte_blocking();

            if (b1 == FRAME_START_1)
                return;
        }
    }
}


// ============================================================
// UART OUTPUT FRAME (SNN Version: 4 int32 logits)
// ============================================================
static void uart_send_pred_time_logits_frame(
    uint8_t pred,
    uint32_t time_us,
    int32_t logit0,
    int32_t logit1,
    int32_t logit2,
    int32_t logit3)
{
    outbyte((char)0xA5);
    outbyte((char)pred);

    // Execution time
    outbyte((char)(time_us & 0xFF));
    outbyte((char)((time_us >> 8) & 0xFF));
    outbyte((char)((time_us >> 16) & 0xFF));
    outbyte((char)((time_us >> 24) & 0xFF));

    int32_t logits[4] = {
        logit0,
        logit1,
        logit2,
        logit3
    };

    for (int i = 0; i < 4; i++) {
        uint32_t v = (uint32_t)logits[i];
        outbyte((char)((v >> 0) & 0xFF));
        outbyte((char)((v >> 8) & 0xFF));
        outbyte((char)((v >> 16) & 0xFF));
        outbyte((char)((v >> 24) & 0xFF));
    }

    outbyte((char)0x5A);
}

/* CNN result frame: 0xA5, prediction, time_u32_LE,
   four int16 logits, 0x5A. Total = 15 bytes.
   Keep the original 23-byte int32 sender for SNN. */
static void uart_send_cnn_result_frame(
    uint8_t pred,
    uint32_t time_us,
    int16_t logit0,
    int16_t logit1,
    int16_t logit2,
    int16_t logit3)
{
    outbyte((char)0xA5);
    outbyte((char)pred);
    for (int i = 0; i < 4; ++i) {
        outbyte((char)((time_us >> (8 * i)) & 0xFFU));
    }
    int16_t logits[4] = { logit0, logit1, logit2, logit3 };
    for (int i = 0; i < 4; ++i) {
        uint16_t value = (uint16_t)logits[i];
        outbyte((char)(value & 0xFFU));
        outbyte((char)((value >> 8) & 0xFFU));
    }
    outbyte((char)0x5A);
}

static void uart_printf(const char *format, ...)
{
    if (g_quiet) {
        return;   /* No ASCII debug messages during binary exchanges. */
    }

    char buffer[256];

    va_list args;
    va_start(args, format);

    vsnprintf(buffer, sizeof(buffer), format, args);

    va_end(args);

    for (int i = 0; buffer[i] != '\0'; i++)
    {
        outbyte(buffer[i]);
    }
}


static int16_t feature_mem[TOTAL_FEATURES];

static void receive_features_from_uart(void)
{
    for (int i = 0; i < TOTAL_FEATURES; i++) {
        uint8_t lo = read_byte_blocking();
        uint8_t hi = read_byte_blocking();

        uint16_t u = ((uint16_t)lo) | ((uint16_t)hi << 8);

        feature_mem[i] = (int16_t)u;
    }
}


static void write_features_to_bram(void)
{
    for (int i = 0; i < TOTAL_FEATURES; i++) {
        Xil_Out16(
            FEATURE_BRAM_BASE + (i * sizeof(int16_t)),
            (uint16_t)feature_mem[i]
        );
    }
}

// ============================================================
// INPUT BUFFERS
// ============================================================
static uint8_t rx_buf[RX_BYTES];

static int16_t ddr_input[N_INPUTS]
    __attribute__((aligned(64)));




typedef enum {
    MODEL_TYPE_CNN = 1,
    MODEL_TYPE_SNN = 2
} ModelType;

#define CNN_HEADER_0  0xA6
#define CNN_HEADER_1  0x6A

#define SNN_HEADER_0  0xAA
#define SNN_HEADER_1  0x55






static ModelType wait_for_either_frame_header(void)
{
    while (1)
    {
        uint8_t b0 = read_byte_blocking();

        if (b0 == CNN_HEADER_0)
        {
            uint8_t b1 = read_byte_blocking();
            if (b1 == CNN_HEADER_1)
            {
                return MODEL_TYPE_CNN;
            }
        }
        else if (b0 == SNN_HEADER_0)
        {
            uint8_t b1 = read_byte_blocking();
            if (b1 == SNN_HEADER_1)
            {
                return MODEL_TYPE_SNN;
            }
        }
    }
}

static uint16_t read_len(void)
{
    uint8_t lo = read_byte_blocking();
    uint8_t hi = read_byte_blocking();
    return (uint16_t)(lo | ((uint16_t)hi << 8));
}

static uint32_t elapsed_us(XTime t0, XTime t1)
{
    return (uint32_t)TimeToUs(t0, t1);
}







static int run_cnn(void)
{
    XTime t0, t1;
    uint32_t ap_final = 0U;

    Xil_DCacheFlushRange((UINTPTR)ddr_input, N_INPUTS * sizeof(int16_t));

    ip_write(REG_INPUT_IMG_L, (uint32_t)(UINTPTR)ddr_input);
    ip_write(REG_INPUT_IMG_H, 0U);

    XTime_GetTime(&t0);
    ip_write(REG_AP_CTRL, (1U << AP_START_BIT));
    int Status = CNN_WaitForDone(&ap_final);
    XTime_GetTime(&t1);

    if (Status != XST_SUCCESS) {
        g_quiet = 0;
        uart_printf("ERROR: CNN timeout, AP_CTRL=0x%08x\r\n", ap_final);
        return XST_FAILURE;
    }

    uint32_t pred = ip_read(REG_PRED_OUT);
    uint32_t w0   = ip_read(REG_LOGITS_BASE + 0x0);
    uint32_t w1   = ip_read(REG_LOGITS_BASE + 0x4);

    int16_t l0 = (int16_t)(w0 & 0xFFFF);
    int16_t l1 = (int16_t)((w0 >> 16) & 0xFFFF);
    int16_t l2 = (int16_t)(w1 & 0xFFFF);
    int16_t l3 = (int16_t)((w1 >> 16) & 0xFFFF);

    uart_send_cnn_result_frame((uint8_t)(pred & 0xFFU),
                               elapsed_us(t0, t1),
                               l0, l1, l2, l3);
    return XST_SUCCESS;
}

static int run_snn(void)
{
    XTime t0, t1;
    uint32_t ap_final = 0U;

    write_features_to_bram();

    ip_write(REG_FEATURE_MEM_L, FEATURE_BRAM_BASE);
    ip_write(REG_FEATURE_MEM_H, 0U);

    XTime_GetTime(&t0);
    ip_write(REG_AP_CTRL, (1U << AP_START_BIT));
    int Status = CNN_WaitForDone(&ap_final);   /* generic ap_done wait + timeout */
    XTime_GetTime(&t1);

    if (Status != XST_SUCCESS) {
        g_quiet = 0;
        uart_printf("ERROR: SNN timeout, AP_CTRL=0x%08x\r\n", ap_final);
        return XST_FAILURE;
    }

    uint32_t pred = ip_read(REG_PRED_OUT);

    int32_t l0 = (int32_t)ip_read(REG_LOGITS_BASE + 0x00);
    int32_t l1 = (int32_t)ip_read(REG_LOGITS_BASE + 0x04);
    int32_t l2 = (int32_t)ip_read(REG_LOGITS_BASE + 0x08);
    int32_t l3 = (int32_t)ip_read(REG_LOGITS_BASE + 0x0C);

    uart_send_pred_time_logits_frame((uint8_t)(pred & 0xFFU),
                                     elapsed_us(t0, t1),
                                     l0, l1, l2, l3);
    return XST_SUCCESS;
}

/******************************************************************************
 * 3) MAIN
 ******************************************************************************/
int main(void)
{
    int Status;

    XTime InitStart, InitEnd;
    XTime PcapStart, PcapEnd;

    ModelType current_loaded_model = MODEL_TYPE_CNN;

    init_platform();
    uart_set_baudrate(UART_BAUD);

    uart_printf("\r\n========================================\r\n");
    uart_printf(" PYNQ-Z2 Dynamic Function eXchange\r\n");
    uart_printf(" Vitis 2026.1 - Standalone\r\n");
    uart_printf("========================================\r\n");
    uart_printf("RM1 size: %u bytes\r\n", rm1_bin_len);
    uart_printf("RM2 size: %u bytes\r\n", rm2_bin_len);

    XTime_GetTime(&InitStart);
    XTime_GetTime(&PcapStart);
    Status = DFX_InitPCAP();
    XTime_GetTime(&PcapEnd);
    if (Status != XST_SUCCESS) goto Error;
    XTime_GetTime(&InitEnd);

    PrintTime("PCAP initialization", PcapStart, PcapEnd);
    PrintTime("Total initialization", InitStart, InitEnd);

    uart_printf("Loading CNN accelerator...\r\n");
    Status = DFX_SwitchRM(rm1_bin, rm1_bin_len, "CNN");
    if (Status != XST_SUCCESS) goto Error;

    uart_printf("CNN loaded. Waiting for input frames...\r\n");

    /* From here on the host reads raw binary replies: no console text
       may appear between a request and its reply frame. */
    g_quiet = 1;

    while (1)
    {
        /* ---- 1. Header, then receive the FULL payload ---- */
        ModelType incoming = wait_for_either_frame_header();

        if (incoming == MODEL_TYPE_CNN) {
            uint16_t len = read_len();
            if (len != RX_BYTES) {
                continue;                       /* bad length: resync on next header */
            }
            for (int i = 0; i < RX_BYTES; i++) {
                rx_buf[i] = read_byte_blocking();
            }
            for (int i = 0; i < N_INPUTS; i++) {
                uint16_t u = ((uint16_t)rx_buf[i * 2 + 1] << 8) |
                             ((uint16_t)rx_buf[i * 2]);
                ddr_input[i] = (int16_t)u;
            }
        } else {
            /* SNN: no length field, fixed TOTAL_FEATURES int16 values */
            receive_features_from_uart();
        }

        /* ---- 2. Switch RM now (UART is quiet, payload already stored) ---- */
        if (incoming != current_loaded_model) {
            if (incoming == MODEL_TYPE_SNN) {
                Status = DFX_SwitchRM(rm2_bin, rm2_bin_len, "SNN");
            } else {
                Status = DFX_SwitchRM(rm1_bin, rm1_bin_len, "CNN");
            }
            if (Status != XST_SUCCESS) {
                g_quiet = 0;
                goto Error;
            }
            current_loaded_model = incoming;

            usleep(10);                         /* let the new RM settle */
            if (DFX_WaitForIdle() != XST_SUCCESS) {
                g_quiet = 0;
                goto Error;
            }
        }

        /* ---- 3. Run and reply ---- */
        if (incoming == MODEL_TYPE_CNN) {
            Status = run_cnn();
        } else {
            Status = run_snn();
        }
        if (Status != XST_SUCCESS) {
            g_quiet = 0;
            goto Error;
        }
    }

Error:
    g_quiet = 0;
    uart_printf("\r\nDFX APPLICATION STOPPED\r\n");
    while (1) {
        sleep(1);
    }

    cleanup_platform();
    return XST_FAILURE;
}


/******************************************************************************
- MAIN APPLICATION (DUAL-MODEL DFX LOOP)
 ******************************************************************************/
/*int main(void){
    int Status;
    
    XTime InitStart;
    XTime InitEnd;

    XTime PcapStart;
    XTime PcapEnd;
    
    ModelType current_loaded_model = MODEL_TYPE_CNN;
    init_platform();

    uart_set_baudrate(UART_BAUD);
    
    uart_printf("\r\n");
    uart_printf("========================================\r\n");
    uart_printf(" PYNQ-Z2 Dynamic Function eXchange\r\n");
    uart_printf(" Vitis 2026.1 - Standalone\r\n");
    uart_printf(" Timing Measurement Application\r\n");
    uart_printf("========================================\r\n");

    uart_printf(
        "RM1 size: %u bytes\r\n",
        rm1_bin_len
    );

    uart_printf(
        "RM2 size: %u bytes\r\n",
        rm2_bin_len
    );

    XTime_GetTime(&InitStart);
    XTime_GetTime(&PcapStart);

    Status = DFX_InitPCAP();

    XTime_GetTime(&PcapEnd);

    if (Status != XST_SUCCESS) {
        goto Error;
    }

    XTime_GetTime(&InitEnd);

    uart_printf("\r\n");
    uart_printf("========================================\r\n");
    uart_printf(" INITIALIZATION TIMING\r\n");
    uart_printf("========================================\r\n");

    PrintTime(
        "PCAP initialization",
        PcapStart,
        PcapEnd
    );

    PrintTime(
        "Total initialization",
        InitStart,
        InitEnd
    );

    uart_printf("========================================\r\n");
    uart_printf("Loading CNN accelerator...\r\n");

    Status = DFX_SwitchRM(
        rm1_bin,
        rm1_bin_len,
        "CNN"
    );

    if (Status != XST_SUCCESS) {
        goto Error;
    }
    
    uart_printf("\r\nCNN loaded successfully.\r\n");
    uart_printf("Waiting for input frames...\r\n");

    while(1){
        ModelType incoming_model = wait_for_either_frame_header();

        // If Python sent an SNN frame but CNN is loaded, switch to SNN!
        if (incoming_model == MODEL_TYPE_SNN && current_loaded_model != MODEL_TYPE_SNN) {
            Status = DFX_SwitchRM(rm2_bin, rm2_bin_len, "SNN");
            if (Status != XST_SUCCESS) {
                goto Error;
            }
            current_loaded_model = MODEL_TYPE_SNN;
        }
        // If Python sent a CNN frame but SNN is loaded, switch to CNN!
        else if (incoming_model == MODEL_TYPE_CNN && current_loaded_model != MODEL_TYPE_CNN) {
            Status = DFX_SwitchRM(rm1_bin, rm1_bin_len, "CNN");
            if (Status != XST_SUCCESS) {
                goto Error;
            }
            current_loaded_model = MODEL_TYPE_CNN;
        }

        if (incoming_model == MODEL_TYPE_CNN) {
            // --- CNN Processing Flow ---
            uint16_t len = (uint16_t)read_byte_blocking() | ((uint16_t)read_byte_blocking() << 8);
            if (len != RX_BYTES) {
                uart_printf("Invalid frame length: %u\r\n", len);
                continue;
            }

            for (int i = 0; i < RX_BYTES; i++) {
                rx_buf[i] = read_byte_blocking();
            }

            for (int i = 0; i < N_INPUTS; i++) {
                uint16_t u =
                    ((uint16_t)rx_buf[i * 2 + 1] << 8) |
                    ((uint16_t)rx_buf[i * 2]);

                ddr_input[i] = (int16_t)u;
            }

            UINTPTR addr = (UINTPTR)ddr_input;

            Xil_DCacheFlushRange(
                (UINTPTR)ddr_input,
                N_INPUTS * sizeof(int16_t)
            );

            ip_write(REG_INPUT_IMG_L, (uint32_t)addr);
            ip_write(REG_INPUT_IMG_H, 0U);

            uint32_t ap_before = ip_read(REG_AP_CTRL);
            if ((ap_before & AP_IDLE_MASK) == 0U) {
                uart_printf("WARNING: Accelerator was not idle before start\r\n");
            }

            XTime t0, t1;
            uint32_t ap_final = 0U;

            XTime_GetTime(&t0);
            ip_write(REG_AP_CTRL, (1U << AP_START_BIT));

            Status = CNN_WaitForDone(&ap_final);
            XTime_GetTime(&t1);

            if (Status != XST_SUCCESS) {
                uint64_t elapsed_us = TimeToUs(t0, t1);
                uart_printf("\r\n========================================\r\n");
                uart_printf(" ERROR: CNN EXECUTION TIMEOUT\r\n");
                uart_printf("========================================\r\n");
                uart_printf("Elapsed time: %u us\r\n", (unsigned int)elapsed_us);
                uart_printf("AP_CTRL final: 0x%08x\r\n", ap_final);
                uart_printf("CNN did not assert ap_done.\r\n");
                goto Error;
            }

            uint64_t dt_ticks = (uint64_t)(t1 - t0);
            uint32_t time_us = (uint32_t)((dt_ticks * 1000000ULL) / (uint64_t)COUNTS_PER_SECOND);

            uint32_t pred = ip_read(REG_PRED_OUT);

            uint32_t w0 = ip_read(REG_LOGITS_BASE + 0x0);
            uint32_t w1 = ip_read(REG_LOGITS_BASE + 0x4);

            int16_t logit0 = (int16_t)(w0 & 0xFFFF);
            int16_t logit1 = (int16_t)((w0 >> 16) & 0xFFFF);
            int16_t logit2 = (int16_t)(w1 & 0xFFFF);
            int16_t logit3 = (int16_t)((w1 >> 16) & 0xFFFF);

            uart_send_pred_time_logits_frame(
                (uint8_t)(pred & 0xFFU),
                time_us,
                logit0,
                logit1,
                logit2,
                logit3
            );

        } else {
            // --- SNN Processing Flow ---
            uint16_t len = (uint16_t)read_byte_blocking() | ((uint16_t)read_byte_blocking() << 8);
            if (len != RX_BYTES_SNN) {
                uart_printf("Invalid frame length: %u\r\n", len);
                continue;
            }

            receive_features_from_uart();
            write_features_to_bram();
            
            ip_write(REG_FEATURE_MEM_L, FEATURE_BRAM_BASE);
            ip_write(REG_FEATURE_MEM_H, 0u);

            XTime t0;
            XTime t1;

            XTime_GetTime(&t0);
            
            ip_write(REG_AP_CTRL, 0x01);

            while (((ip_read(REG_AP_CTRL) >> AP_DONE_BIT) & 0x1u) == 0u) {
                // wait for ap_done
            }

            XTime_GetTime(&t1);

            // Calculate execution time
            uint64_t dt_ticks = (uint64_t)(t1 - t0);

            uint32_t time_us =
                (uint32_t)((dt_ticks * 1000000ULL) /
                           (uint64_t)COUNTS_PER_SECOND);

            // Read prediction
            uint32_t pred = ip_read(REG_PRED_OUT);

            // Read logits
            int32_t logit0 = (int32_t)ip_read(REG_LOGITS_BASE + 0x00);
            int32_t logit1 = (int32_t)ip_read(REG_LOGITS_BASE + 0x04);
            int32_t logit2 = (int32_t)ip_read(REG_LOGITS_BASE + 0x08);
            int32_t logit3 = (int32_t)ip_read(REG_LOGITS_BASE + 0x0C);

            // Send result to Python
            uart_send_pred_time_logits_frame(
                (uint8_t)(pred & 0xFFu),
                time_us,
                logit0,
                logit1,
                logit2,
                logit3
            );
        }
    }

Error:
    uart_printf("\r\nDFX APPLICATION STOPPED\r\n");

    while (1) {
        sleep(1);
    }

    cleanup_platform();

    return XST_FAILURE;    
}


/*int main(void){
    int Status;
    
    XTime InitStart;
    XTime InitEnd;

    XTime PcapStart;
    XTime PcapEnd;
    
    
    ModelType current_loaded_model = MODEL_TYPE_CNN;
    init_platform();

    uart_set_baudrate(UART_BAUD);
    
    uart_printf("\r\n");
    uart_printf("========================================\r\n");
    uart_printf(" PYNQ-Z2 Dynamic Function eXchange\r\n");
    uart_printf(" Vitis 2026.1 - Standalone\r\n");
    uart_printf(" Timing Measurement Application\r\n");
    uart_printf("========================================\r\n");

    uart_printf(
        "RM1 size: %u bytes\r\n",
        rm1_bin_len
    );

    uart_printf(
        "RM2 size: %u bytes\r\n",
        rm2_bin_len
    );

    XTime_GetTime(&InitStart);
    XTime_GetTime(&PcapStart);

    Status = DFX_InitPCAP();

    XTime_GetTime(&PcapEnd);

    if (Status != XST_SUCCESS) {
        goto Error;
    }

    XTime_GetTime(&InitEnd);

    uart_printf("\r\n");
    uart_printf("========================================\r\n");
    uart_printf(" INITIALIZATION TIMING\r\n");
    uart_printf("========================================\r\n");

    PrintTime(
        "PCAP initialization",
        PcapStart,
        PcapEnd
    );

    PrintTime(
        "Total initialization",
        InitStart,
        InitEnd
    );

    uart_printf("========================================\r\n");
    uart_printf("Loading CNN accelerator...\r\n");

    Status = DFX_SwitchRM(
        rm1_bin,
        rm1_bin_len,
        "CNN"
    );

    if (Status != XST_SUCCESS) {
        goto Error;
    }
    
    uart_printf("\r\nCNN loaded successfully.\r\n");
    uart_printf("Waiting for input frames...\r\n");

    while(1){
        ModelType incoming_model = wait_for_either_frame_header();

        // If Python sent an SNN frame but CNN is loaded, switch to SNN!
        if (incoming_model == MODEL_TYPE_SNN && current_loaded_model != MODEL_TYPE_SNN) {
            DFX_SwitchRM(rm2_bin, rm2_bin_len, "SNN");
            current_loaded_model = MODEL_TYPE_SNN;
        }
        // If Python sent a CNN frame but SNN is loaded, switch to CNN!
        else if (incoming_model == MODEL_TYPE_CNN && current_loaded_model != MODEL_TYPE_CNN) {
            DFX_SwitchRM(rm1_bin, rm1_bin_len, "CNN");
            current_loaded_model = MODEL_TYPE_CNN;
        }

        if (incoming_model == MODEL_TYPE_CNN) {
            // --- CNN Processing Flow ---
            uint16_t len = (uint16_t)read_byte_blocking() | ((uint16_t)read_byte_blocking() << 8);
            if (len != CNN_RX_BYTES) continue;
    
            for (int i = 0; i < CNN_RX_BYTES; i++) {
                rx_buf[i] = read_byte_blocking();
            }

            


            
            // ... parse, DDR flush, start CNN, send cnn result ...

        } else {
            // --- SNN Processing Flow ---
            uint16_t len = (uint16_t)read_byte_blocking() | ((uint16_t)read_byte_blocking() << 8);
            if (len != SNN_RX_BYTES) continue;
    
            receive_features_from_uart();
            write_features_to_bram();
            
            ip_write(REG_FEATURE_MEM_L, FEATURE_BRAM_BASE);
            ip_write(REG_FEATURE_MEM_H, 0u);
            // ... start SNN, read pred/logits, send snn result ...
            }
    }

Error:
    uart_printf("\r\nDFX APPLICATION STOPPED\r\n");

    while (1) {
        sleep(1);
    }

    cleanup_platform();

    return XST_FAILURE;    
}*/


/******************************************************************************
- MAIN APPLICATION SNN
 ******************************************************************************/
/*int main(void){
    int Status;
    
    XTime InitStart;
    XTime InitEnd;

    XTime PcapStart;
    XTime PcapEnd;
    
    init_platform();

    uart_set_baudrate(UART_BAUD);
    
    uart_printf("\r\n");
    uart_printf("========================================\r\n");
    uart_printf(" PYNQ-Z2 Dynamic Function eXchange\r\n");
    uart_printf(" Vitis 2026.1 - Standalone\r\n");
    uart_printf(" Timing Measurement Application\r\n");
    uart_printf("========================================\r\n");

    uart_printf(
        "RM1 size: %u bytes\r\n",
        rm1_bin_len
    );

    uart_printf(
        "RM2 size: %u bytes\r\n",
        rm2_bin_len
    );

    XTime_GetTime(&InitStart);
    XTime_GetTime(&PcapStart);

    Status = DFX_InitPCAP();

    XTime_GetTime(&PcapEnd);

    if (Status != XST_SUCCESS) {
        goto Error;
    }

    XTime_GetTime(&InitEnd);

    uart_printf("\r\n");
    uart_printf("========================================\r\n");
    uart_printf(" INITIALIZATION TIMING\r\n");
    uart_printf("========================================\r\n");

    PrintTime(
        "PCAP initialization",
        PcapStart,
        PcapEnd
    );

    PrintTime(
        "Total initialization",
        InitStart,
        InitEnd
    );

    uart_printf("========================================\r\n");
    uart_printf("Loading SNN accelerator...\r\n");

    Status = DFX_SwitchRM(
        rm2_bin,
        rm2_bin_len,
        "SNN"
    );

    if (Status != XST_SUCCESS) {
        goto Error;
    }
    
    uart_printf("\r\nSNN loaded successfully.\r\n");
    uart_printf("Waiting for input frames...\r\n");

    while(1){
        wait_for_frame_header();
        receive_features_from_uart();
        write_features_to_bram();
        
        ip_write(REG_FEATURE_MEM_L, FEATURE_BRAM_BASE);
        ip_write(REG_FEATURE_MEM_H, 0u);

        XTime t0;
        XTime t1;

        XTime_GetTime(&t0);
        
        ip_write(REG_AP_CTRL, 0x01);

        while (((ip_read(REG_AP_CTRL) >> AP_DONE_BIT) & 0x1u) == 0u) {
            // wait for ap_done
        }

        XTime_GetTime(&t1);

        // Calculate execution time
        uint64_t dt_ticks = (uint64_t)(t1 - t0);

        uint32_t time_us =
            (uint32_t)((dt_ticks * 1000000ULL) /
                       (uint64_t)COUNTS_PER_SECOND);

        // Read prediction
        uint32_t pred = ip_read(REG_PRED_OUT);

        // Read logits
        int32_t logit0 = (int32_t)ip_read(REG_LOGITS_BASE + 0x00);
        int32_t logit1 = (int32_t)ip_read(REG_LOGITS_BASE + 0x04);
        int32_t logit2 = (int32_t)ip_read(REG_LOGITS_BASE + 0x08);
        int32_t logit3 = (int32_t)ip_read(REG_LOGITS_BASE + 0x0C);

        // Send result to Python
        uart_send_pred_time_logits_frame(
            (uint8_t)(pred & 0xFFu),
            time_us,
            logit0,
            logit1,
            logit2,
            logit3
        );
    }

Error:
    uart_printf("\r\nDFX APPLICATION STOPPED\r\n");

    while (1) {
        sleep(1);
    }

    cleanup_platform();

    return XST_FAILURE;    
}*/


/******************************************************************************
- MAIN APPLICATION CNN
 ******************************************************************************/
 /*int main(void){
    int Status;
    
    XTime InitStart;
    XTime InitEnd;

    XTime PcapStart;
    XTime PcapEnd;
    
    init_platform();

    uart_set_baudrate(UART_BAUD);
    
    uart_printf("\r\n");
    uart_printf("========================================\r\n");
    uart_printf(" PYNQ-Z2 Dynamic Function eXchange\r\n");
    uart_printf(" Vitis 2026.1 - Standalone\r\n");
    uart_printf(" Timing Measurement Application\r\n");
    uart_printf("========================================\r\n");

    uart_printf(
        "RM1 size: %u bytes\r\n",
        rm1_bin_len
    );

    uart_printf(
        "RM2 size: %u bytes\r\n",
        rm2_bin_len
    );

    XTime_GetTime(&InitStart);
    XTime_GetTime(&PcapStart);

    Status = DFX_InitPCAP();

    XTime_GetTime(&PcapEnd);

    if (Status != XST_SUCCESS) {
        goto Error;
    }

    XTime_GetTime(&InitEnd);

    uart_printf("\r\n");
    uart_printf("========================================\r\n");
    uart_printf(" INITIALIZATION TIMING\r\n");
    uart_printf("========================================\r\n");

    PrintTime(
        "PCAP initialization",
        PcapStart,
        PcapEnd
    );

    PrintTime(
        "Total initialization",
        InitStart,
        InitEnd
    );

    uart_printf("========================================\r\n");
    uart_printf("Loading CNN accelerator...\r\n");

    Status = DFX_SwitchRM(
        rm1_bin,
        rm1_bin_len,
        "CNN"
    );

    if (Status != XST_SUCCESS) {
        goto Error;
    }
    
    uart_printf("\r\nCNN loaded successfully.\r\n");
    uart_printf("Waiting for input frames...\r\n");

    while(1){
        // 1. Receive input frame
        wait_for_frame_header();

        uint16_t len =
            (uint16_t)read_byte_blocking() |
            ((uint16_t)read_byte_blocking() << 8);

        if (len != RX_BYTES)
        {
            uart_printf("Invalid frame length: %u\r\n", len);
            continue;
        }

        for (int i = 0; i < RX_BYTES; i++)
        {
            rx_buf[i] = read_byte_blocking();
        }

        for (int i = 0; i < N_INPUTS; i++)
        {
            uint16_t u =
                ((uint16_t)rx_buf[i * 2 + 1] << 8) |
                ((uint16_t)rx_buf[i * 2]);

            ddr_input[i] = (int16_t)u;
        }

        Xil_DCacheFlushRange(
            (UINTPTR)ddr_input,
            N_INPUTS * sizeof(int16_t));

        // 4. Prepare CNN input in DDR
        UINTPTR addr = (UINTPTR)ddr_input;

        Xil_DCacheFlushRange(
            (UINTPTR)ddr_input,
            N_INPUTS * sizeof(int16_t)
        );

        ip_write(REG_INPUT_IMG_L, (uint32_t)addr);
        ip_write(REG_INPUT_IMG_H, 0U);

        // 5. Check accelerator status before starting
        uint32_t ap_before = ip_read(REG_AP_CTRL);

        if ((ap_before & AP_IDLE_MASK) == 0U)
        {
            uart_printf(
                "WARNING: Accelerator was not idle before start\r\n"
            );
        }

        // 6. Start CNN and measure execution time
        XTime t0, t1;
        uint32_t ap_final = 0U;

        XTime_GetTime(&t0);
        ip_write(REG_AP_CTRL, (1U << AP_START_BIT));

        Status = CNN_WaitForDone(&ap_final);
        XTime_GetTime(&t1);

        if (Status != XST_SUCCESS)
        {
            uint64_t elapsed_us = TimeToUs(t0, t1);

            uart_printf("\r\n");
            uart_printf("========================================\r\n");
            uart_printf(" ERROR: CNN EXECUTION TIMEOUT\r\n");
            uart_printf("========================================\r\n");
            uart_printf("Elapsed time: %u us\r\n", (unsigned int)elapsed_us);
            uart_printf("AP_CTRL final: 0x%08x\r\n", ap_final);
            uart_printf("CNN did not assert ap_done.\r\n");

            goto Error;
        }

        // 7. Calculate CNN execution time
        uint64_t dt_ticks = (uint64_t)(t1 - t0);
        uint32_t time_us =
            (uint32_t)(
                (dt_ticks * 1000000ULL) /
                (uint64_t)COUNTS_PER_SECOND
            );

        // 8. Read prediction and logits
        uint32_t pred = ip_read(REG_PRED_OUT);

        uint32_t w0 = ip_read(REG_LOGITS_BASE + 0x0);
        uint32_t w1 = ip_read(REG_LOGITS_BASE + 0x4);

        int16_t logit0 = (int16_t)(w0 & 0xFFFF);
        int16_t logit1 = (int16_t)((w0 >> 16) & 0xFFFF);
        int16_t logit2 = (int16_t)(w1 & 0xFFFF);
        int16_t logit3 = (int16_t)((w1 >> 16) & 0xFFFF);

        // 9. Send result to Python over UART
        uart_send_pred_time_logits_frame(
            (uint8_t)(pred & 0xFFU),
            time_us,
            logit0,
            logit1,
            logit2,
            logit3
        );
    }

Error:
    uart_printf("\r\nDFX APPLICATION STOPPED\r\n");

    while (1) {
        sleep(1);
    }

    cleanup_platform();

    return XST_FAILURE;    
}*/