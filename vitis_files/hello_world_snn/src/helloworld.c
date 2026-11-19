
#include <stdio.h>
#include <stdint.h>

#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"
#include "xiltimer.h"
#include "xuartps.h"
#include "xsnn_mlp_hw.h"

extern char inbyte(void);
extern void outbyte(char c);

// ============================================================
// UART CONFIG
// ============================================================
#ifndef UART_BASEADDR
#define UART_BASEADDR   XPAR_XUARTPS_0_BASEADDR
#endif

#ifndef UART_BAUD
#define UART_BAUD       4000000u
#endif

// ============================================================
// SNN feature config
// ============================================================
#define T_STEPS     5
#define GRID_H      12
#define GRID_W      16
#define N_FEATURES  (GRID_H * GRID_W * 2)
#define RX_BYTES    (N_FEATURES * sizeof(int16_t))
#define TOTAL_FEATURES (T_STEPS * N_FEATURES)
#define FRAME_START_0  0xAA
#define FRAME_START_1  0x55

// ============================================================
// SNN AXI-Lite base + registers
// ============================================================
#define IP_BASE_ADDR  XPAR_SNN_MLP_0_BASEADDR

#define REG_AP_CTRL        XSNN_MLP_CTRL_ADDR_AP_CTRL
#define REG_FEATURE_MEM_L  XSNN_MLP_CTRL_ADDR_FEATURE_MEM_DATA
#define REG_FEATURE_MEM_H  (XSNN_MLP_CTRL_ADDR_FEATURE_MEM_DATA + 0x04)

#define REG_PRED_OUT       XSNN_MLP_CTRL_ADDR_PREDICTION_DATA
#define REG_LOGITS_BASE    XSNN_MLP_CTRL_ADDR_LOGITS_OUT_BASE

#define AP_DONE_BIT        1

// ============================================================
// AXI BRAM Controller base
// ============================================================
#define FEATURE_BRAM_BASE  XPAR_AXI_BRAM_CTRL_0_BASEADDR

// ============================================================
// SNN register access
// ============================================================
static inline void ip_write(uint32_t off, uint32_t val)
{
    Xil_Out32(IP_BASE_ADDR + off, val);
}

static inline uint32_t ip_read(uint32_t off)
{
    return Xil_In32(IP_BASE_ADDR + off);
}

// ============================================================
// UART helpers
// ============================================================
static void uart_set_baudrate(u32 baud)
{
    XUartPs Uart;

    XUartPs_Config *Cfg = XUartPs_LookupConfig(UART_BASEADDR);

    if (!Cfg) {
        xil_printf("UART configuration not found\r\n");
        return;
    }

    if (XUartPs_CfgInitialize(
            &Uart, Cfg, Cfg->BaseAddress) != XST_SUCCESS) {
        xil_printf("UART initialization failed\r\n");
        return;
    }

    XUartPs_SetOperMode(&Uart, XUARTPS_OPER_MODE_NORMAL);
    (void)XUartPs_SetBaudRate(&Uart, baud);
}

static uint8_t read_byte_blocking(void)
{
    return (uint8_t)inbyte();
}

static void wait_for_frame_header(void)
{
    while (1) {
        uint8_t b0 = read_byte_blocking();

        if (b0 == FRAME_START_0) {
            uint8_t b1 = read_byte_blocking();

            if (b1 == FRAME_START_1) {
                return;
            }
        }
    }
}

// ============================================================
// Feature buffer
// ============================================================
static int16_t feature_mem[TOTAL_FEATURES];

// ============================================================
// Receive 384 int16 features from Python
// ============================================================
static void receive_features_from_uart(void)
{
    for (int i = 0; i < TOTAL_FEATURES; i++) {
        uint8_t lo = read_byte_blocking();
        uint8_t hi = read_byte_blocking();

        uint16_t u = ((uint16_t)lo) | ((uint16_t)hi << 8);

        feature_mem[i] = (int16_t)u;
    }
}

// ============================================================
// Write features into AXI BRAM Controller memory
// ============================================================
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
// Reply:
// 0xA5 <pred> <time_us u32 LE> <4 logits i32 LE> 0x5A
// Total = 23 bytes
// ============================================================
static void uart_send_pred_time_logits_frame(
    uint8_t pred,
    uint32_t time_us,
    int32_t logit0,
    int32_t logit1,
    int32_t logit2,
    int32_t logit3
)
{
    outbyte((char)0xA5);
    outbyte((char)pred);

    outbyte((char)((time_us >> 0) & 0xFF));
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

// ============================================================
// MAIN
// ============================================================
int main(void)
{
    init_platform();

    uart_set_baudrate(UART_BAUD);

    xil_printf("\r\nSNN MLP accelerator started\r\n");

    xil_printf("UART_BASEADDR=0x%08lx UART_BAUD=%lu\r\n",
               (unsigned long)UART_BASEADDR,
               (unsigned long)UART_BAUD);

    xil_printf("IP_BASE_ADDR=0x%08lx\r\n",
               (unsigned long)IP_BASE_ADDR);

    xil_printf("FEATURE_BRAM_BASE=0x%08lx\r\n",
               (unsigned long)FEATURE_BRAM_BASE);

    xil_printf("N_FEATURES=%d\r\n", N_FEATURES);
    xil_printf("RX_BYTES=%d\r\n", RX_BYTES);

    xil_printf("Framed UART(int16 features) -> SNN MLP\r\n");

    xil_printf("Reply: 0xA5 <pred> <time_us u32 LE> "
               "<4 logits i32 LE> 0x5A\r\n");

    while (1) {

        // Wait for Python packet header
        wait_for_frame_header();

        // Receive features
        receive_features_from_uart();

        // Store features in BRAM
        write_features_to_bram();

        // Tell SNN accelerator where feature memory starts
        ip_write(REG_FEATURE_MEM_L, FEATURE_BRAM_BASE);
        ip_write(REG_FEATURE_MEM_H, 0u);

        // Timer
        XTime t0;
        XTime t1;

        XTime_GetTime(&t0);

        // Start accelerator
        ip_write(REG_AP_CTRL, 0x01);

        // Wait for accelerator completion
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

    cleanup_platform();
    return 0;
}
