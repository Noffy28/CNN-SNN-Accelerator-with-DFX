
#include <stdio.h>
#include <stdint.h>

#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "xiltimer.h"
#include "xuartps.h"

extern char inbyte(void);
extern void outbyte(char c);

// ============================================================
// UART CONFIGURATION
// ============================================================
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

// ============================================================
// CNN INPUT: 60 x 80
// ============================================================
#define IMG_H     60
#define IMG_W     80
#define N_INPUTS  (IMG_H * IMG_W)
#define RX_BYTES  (N_INPUTS * 2)

// UART input frame
#define FRAME_START_0  0xA6
#define FRAME_START_1  0x6A

// ============================================================
// CNN IP CONFIGURATION
// Address confirmed from uploaded xparameters.h
// ============================================================
#define IP_BASE_ADDR XPAR_DS_CNN_0_BASEADDR

// HLS AXI-Lite register offsets
#define REG_AP_CTRL       0x00
#define REG_INPUT_IMG_L   0x10
#define REG_INPUT_IMG_H   0x14
#define REG_PRED_OUT      0x1C
#define REG_LOGITS_BASE   0x30

#define AP_START_BIT      0
#define AP_DONE_BIT       1

// ============================================================
// IP ACCESS FUNCTIONS
// ============================================================
static inline void ip_write(uint32_t offset, uint32_t value)
{
    Xil_Out32(IP_BASE_ADDR + offset, value);
}

static inline uint32_t ip_read(uint32_t offset)
{
    return Xil_In32(IP_BASE_ADDR + offset);
}

// ============================================================
// UART CONFIGURATION
// ============================================================
static void uart_set_baudrate(u32 baud)
{
    XUartPs Uart;

    XUartPs_Config *Cfg =
        XUartPs_LookupConfig(UART_DEVICE_ID);

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
// INPUT BUFFERS
// ============================================================
static uint8_t rx_buf[RX_BYTES];

static int16_t ddr_input[N_INPUTS]
    __attribute__((aligned(64)));

// ============================================================
// UART OUTPUT FRAME
//
// Format:
// 0xA5
// prediction
// execution time (uint32, little endian)
// 4 logits (int16, little endian)
// 0x5A
// ============================================================
static void uart_send_pred_time_logits_frame(
    uint8_t pred,
    uint32_t time_us,
    int16_t logit0,
    int16_t logit1,
    int16_t logit2,
    int16_t logit3)
{
    outbyte((char)0xA5);
    outbyte((char)pred);

    // Execution time
    outbyte((char)(time_us & 0xFF));
    outbyte((char)((time_us >> 8) & 0xFF));
    outbyte((char)((time_us >> 16) & 0xFF));
    outbyte((char)((time_us >> 24) & 0xFF));

    // Logit 0
    outbyte((char)(logit0 & 0xFF));
    outbyte((char)((logit0 >> 8) & 0xFF));

    // Logit 1
    outbyte((char)(logit1 & 0xFF));
    outbyte((char)((logit1 >> 8) & 0xFF));

    // Logit 2
    outbyte((char)(logit2 & 0xFF));
    outbyte((char)((logit2 >> 8) & 0xFF));

    // Logit 3
    outbyte((char)(logit3 & 0xFF));
    outbyte((char)((logit3 >> 8) & 0xFF));

    outbyte((char)0x5A);
}

// ============================================================
// MAIN
// ============================================================
int main(void)
{
    init_platform();

    uart_set_baudrate(UART_BAUD);

    while (1)
    {
        // ----------------------------------------------------
        // 1. Receive input frame
        // ----------------------------------------------------
        wait_for_frame_header();

        uint16_t len =
            (uint16_t)read_byte_blocking() |
            ((uint16_t)read_byte_blocking() << 8);

        if (len != RX_BYTES)
        {
            // Invalid frame length: discard and resynchronize
            continue;
        }

        for (int i = 0; i < RX_BYTES; i++)
        {
            rx_buf[i] = read_byte_blocking();
        }

        // ----------------------------------------------------
        // 2. Convert input to signed int16 Q8.8
        // ----------------------------------------------------
        for (int i = 0; i < N_INPUTS; i++)
        {
            uint16_t u =
                ((uint16_t)rx_buf[i * 2 + 1] << 8) |
                ((uint16_t)rx_buf[i * 2]);

            ddr_input[i] = (int16_t)u;
        }

        // ----------------------------------------------------
        // 3. Flush cache before PL accesses DDR
        // ----------------------------------------------------
        Xil_DCacheFlushRange(
            (UINTPTR)ddr_input,
            N_INPUTS * sizeof(int16_t));

        // ----------------------------------------------------
        // 4. Configure CNN input pointer
        // ----------------------------------------------------
        UINTPTR addr = (UINTPTR)ddr_input;

        ip_write(REG_INPUT_IMG_L, (uint32_t)addr);

        // Zynq-7020 uses a 32-bit ARM processor
        ip_write(REG_INPUT_IMG_H, 0u);

        // ----------------------------------------------------
        // 5. Measure CNN execution time
        // ----------------------------------------------------
        XTime t0, t1;

        XTime_GetTime(&t0);

        // Start CNN
        ip_write(REG_AP_CTRL, (1u << AP_START_BIT));

        // Wait for CNN completion
        while (((ip_read(REG_AP_CTRL) >> AP_DONE_BIT) & 1u) == 0u)
        {
            // Waiting for ap_done
        }

        XTime_GetTime(&t1);

        uint64_t dt_ticks = (uint64_t)(t1 - t0);

        uint32_t time_us =
            (uint32_t)(
                (dt_ticks * 1000000ULL) /
                (uint64_t)COUNTS_PER_SECOND);

        // ----------------------------------------------------
        // 6. Read CNN prediction and logits
        // ----------------------------------------------------
        uint32_t pred = ip_read(REG_PRED_OUT);

        uint32_t w0 = ip_read(REG_LOGITS_BASE + 0x0);
        uint32_t w1 = ip_read(REG_LOGITS_BASE + 0x4);

        int16_t logit0 = (int16_t)(w0 & 0xFFFF);
        int16_t logit1 = (int16_t)((w0 >> 16) & 0xFFFF);

        int16_t logit2 = (int16_t)(w1 & 0xFFFF);
        int16_t logit3 = (int16_t)((w1 >> 16) & 0xFFFF);

        // ----------------------------------------------------
        // 7. Send result to Python over UART
        // ----------------------------------------------------
        uart_send_pred_time_logits_frame(
            (uint8_t)(pred & 0xFFu),
            time_us,
            logit0,
            logit1,
            logit2,
            logit3);
    }

    cleanup_platform();

    return 0;
}
