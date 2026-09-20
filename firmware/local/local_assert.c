// LOCAL (thread-rcp-firmware): make a failed OT_ASSERT visible and recoverable.
//
// In the stock build a failed OT_ASSERT is `while (1) {}`: no log, no reset, the RCP just goes
// silent and the host eventually reports "radio tx timeout". With
// OPENTHREAD_CONFIG_PLATFORM_ASSERT_MANAGEMENT=1 the macro calls otPlatAssertFail() first. We record
// where it happened in RAM the startup code does not clear, reset the chip (the host sees an RCP
// reset at once instead of a dead radio), and log the location after the next boot.

#include <stdint.h>
#include <string.h>

#include <openthread/platform/alarm-milli.h>
#include <openthread/platform/logging.h>
#include <openthread/platform/misc.h>

#include "common/logging.hpp"
#include "em_cmu.h"
#include "em_device.h"
#include "em_wdog.h"
#include "sl_sleeptimer.h"

#define LOCAL_ASSERT_MAGIC 0xA55E7F41UL

// Both records live in the backup-domain retention registers (BURAM->RET[], 32 x 32 bit). Tested
// on this board: .noinit RAM does NOT survive a pin reset (the Gecko bootloader runs first), BURAM
// does. RET[0..7] are left alone for the SDK/bootloader. Whole-word access only.
#define LOCAL_BURAM_WORD(n) ((void *)&BURAM->RET[(n)])

typedef struct
{
    uint32_t magic;
    uint32_t line;
    uint32_t count; // halts since power-up
    char     file[16];
} local_assert_record_t;

#define sRecord (*(local_assert_record_t *)LOCAL_BURAM_WORD(24)) // 7 words: RET[24..30]
static local_assert_record_t sBootCopy; // what we found at boot, for reporting
static uint8_t               sReportsLeft = 0;
static uint32_t              sNextReportMs;

static void localRecordAndReset(const char *aWhat, uint32_t aLine) __attribute__((noreturn));
static void localRecordAndReset(const char *aWhat, uint32_t aLine)
{
    size_t length = strlen(aWhat);
    size_t keep   = sizeof(sRecord.file) - 1;

    __disable_irq();
    CMU_ClockEnable(cmuClock_BURAM, true);
    sRecord.count = (sRecord.magic == LOCAL_ASSERT_MAGIC) ? sRecord.count + 1 : 1;
    sRecord.magic = LOCAL_ASSERT_MAGIC;
    sRecord.line  = aLine;
    // The end of a path is the informative part. The retention registers take whole-word writes
    // only, so assemble the text in RAM first.
    {
        char     text[sizeof(sRecord.file)];
        uint32_t word;

        memset(text, 0, sizeof(text));
        strncpy(text, (length > keep) ? aWhat + (length - keep) : aWhat, keep);
        for (size_t i = 0; i < sizeof(text); i += 4)
        {
            memcpy(&word, text + i, 4);
            *(volatile uint32_t *)((uintptr_t)sRecord.file + i) = word;
        }
    }
    NVIC_SystemReset();
    while (1) {}
}

// OpenThread: OT_ASSERT with OPENTHREAD_CONFIG_PLATFORM_ASSERT_MANAGEMENT=1.
void otPlatAssertFail(const char *aFilename, int aLineNumber) { localRecordAndReset(aFilename, (uint32_t)aLineNumber); }

// RAIL (the radio library): both generations of its assert callback are weak symbols whose default
// is an endless loop. "RAIL#<code>" + the library's auxiliary line; codes are listed in
// platform/radio/rail_lib/common/sl_rail_assert_error_codes.h.
static void localRailAssert(uint32_t aCode, uint32_t aLine)
{
    char  what[16] = "RAIL#";
    char *p        = what + 5;
    char  digits[10];
    int   n = 0;

    do
    {
        digits[n++] = (char)('0' + (aCode % 10));
        aCode /= 10;
    } while (aCode > 0 && n < (int)sizeof(digits));
    while (n > 0)
    {
        *p++ = digits[--n];
    }
    *p = '\0';
    localRecordAndReset(what, aLine);
}

void sl_railcb_assert_failed(void *aRailHandle, uint32_t aErrorCode, int aLine)
{
    (void)aRailHandle;
    localRailAssert(aErrorCode, (uint32_t)aLine);
}

void RAILCb_AssertFailed(void *aRailHandle, uint32_t aErrorCode)
{
    (void)aRailHandle;
    localRailAssert(aErrorCode, 0);
}

// newlib: the C assert() macro (used by app.c and third-party code) ends in abort(), which spins.
void __assert_func(const char *aFile, int aLine, const char *aFunction, const char *aExpression)
{
    (void)aFunction;
    (void)aExpression;
    localRecordAndReset(aFile, (uint32_t)aLine);
}

// ---- breadcrumbs: state that survives a reset, because every log line leaves through the UART
// and the UART may be what is broken. Reported after the next boot.
#define LOCAL_CRUMBS_MAGIC 0xC0FFEE42UL
typedef struct
{
    uint32_t magic;
    uint32_t loops;      // main loop iterations
    uint32_t lastLoopMs; // time of the last main loop iteration
    uint32_t txReq;      // transmit requests that reached radio.c
    uint32_t txDone;     // completions handed to the stack
    uint32_t lastTxReqMs;
    uint32_t lastTxDoneMs;
    uint32_t stuck;      // times the stuck-transmit check fired
    uint32_t stuckFlags; // radio.c internal flags at that moment
    uint32_t uartRxBytes; // bytes read from the host
    uint32_t uartRxLastMs;
    uint32_t uartTxCalls; // otPlatUartSend() calls (chunks handed to the UART)
    uint32_t uartTxDones; // send-done callbacks given back to the NCP layer
    uint32_t uartTxLastMs;
    uint32_t radioRx; // received frames handed to the stack
    uint32_t radioRxLastMs;
} local_crumbs_t; // 16 words: RET[8..23]

#define sCrumbs (*(local_crumbs_t *)LOCAL_BURAM_WORD(8)) // 16 words: RET[8..23]
static local_crumbs_t sCrumbsBoot;
static uint8_t        sCrumbReportsLeft = 0;

void localCrumbTxRequest(void)
{
    CMU_ClockEnable(cmuClock_BURAM, true);
    sCrumbs.txReq++;
    sCrumbs.lastTxReqMs = otPlatAlarmMilliGetNow();
}

void localCrumbTxDone(void)
{
    CMU_ClockEnable(cmuClock_BURAM, true);
    sCrumbs.txDone++;
    sCrumbs.lastTxDoneMs = otPlatAlarmMilliGetNow();
}

void localCrumbStuck(uint32_t aFlags)
{
    CMU_ClockEnable(cmuClock_BURAM, true);
    sCrumbs.stuck++;
    sCrumbs.stuckFlags = aFlags;
}

void localCrumbUartRx(uint32_t aBytes)
{
    sCrumbs.uartRxBytes += aBytes;
    sCrumbs.uartRxLastMs = otPlatAlarmMilliGetNow();
}

void localCrumbUartTx(void)
{
    sCrumbs.uartTxCalls++;
    sCrumbs.uartTxLastMs = otPlatAlarmMilliGetNow();
}

void localCrumbUartTxDone(void) { sCrumbs.uartTxDones++; }

void localCrumbRadioRx(void)
{
    sCrumbs.radioRx++;
    sCrumbs.radioRxLastMs = otPlatAlarmMilliGetNow();
}

// ---- hardware watchdog: a main loop that stops for 2 s becomes a reset with cause "watchdog"
// (Silicon Labs' boot report decodes it), before the host's 5 s transmit timeout. The loop sleeps
// in EM1 between interrupts, so a 500 ms timer wakes it; the timer callback does NOT feed.
static sl_sleeptimer_timer_handle_t sWakeTimer;
static void                         localWake(sl_sleeptimer_timer_handle_t *aHandle, void *aData)
{
    (void)aHandle;
    (void)aData;
}

static void localRetentionInit(void) { CMU_ClockEnable(cmuClock_BURAM, true); }

static void localWatchdogStart(void)
{
    WDOG_Init_TypeDef init = WDOG_INIT_DEFAULT;

    CMU_ClockEnable(cmuClock_WDOG0, true);
    CMU_ClockSelectSet(cmuClock_WDOG0, cmuSelect_ULFRCO); // 1 kHz
    init.perSel   = wdogPeriod_2k;                         // ~2 s
    init.debugRun = false;
    WDOGn_Init(WDOG0, &init);
    sl_sleeptimer_start_periodic_timer_ms(&sWakeTimer, 500, localWake, NULL, 0, 0);
}

// Call from the application loop. Reports twice (at 1 s and 6 s after boot) because the host may
// not be listening to the log stream yet right after a reset.
void localAssertProcess(void)
{
    static uint8_t sInitialised = 0;

    if (!sInitialised)
    {
        sInitialised = 1;
        localRetentionInit();
        if (sCrumbs.magic == LOCAL_CRUMBS_MAGIC)
        {
            sCrumbsBoot       = sCrumbs;
            sCrumbReportsLeft = 6;
        }
        memset(&sCrumbs, 0, sizeof(sCrumbs));
        sCrumbs.magic = LOCAL_CRUMBS_MAGIC;
        if (sReportsLeft == 0)
        {
            sNextReportMs = otPlatAlarmMilliGetNow() + 1000;
        }
        // Watchdog deliberately NOT started while diagnosing: its reset would be followed by the
        // host's own reset, and the report would then describe the idle run in between instead of
        // the wedged one. Halted vs alive-but-cut-off is read from lastLoop - lastTxReq instead.
        (void)localWatchdogStart;
        if (sRecord.magic == LOCAL_ASSERT_MAGIC)
        {
            sBootCopy     = sRecord;
            sRecord.magic = 0; // keep .count for the next one
            sReportsLeft  = 6;
            sNextReportMs = otPlatAlarmMilliGetNow() + 1000;
        }
        else
        {
            sRecord.count = 0;
        }
    }

    // Writes to a clock-gated peripheral are silently dropped; cheap insurance.
    CMU_ClockEnable(cmuClock_BURAM, true);
    sCrumbs.loops++;
    sCrumbs.lastLoopMs = otPlatAlarmMilliGetNow();

    {
        static uint8_t sBootLines = 6; // proves the log path, and whether .noinit survived the reset
        static uint32_t sBootLineMs = 1000;

        if (sBootLines > 0 && otPlatAlarmMilliGetNow() >= sBootLineMs)
        {
            otLogCritPlat("LOCAL boot: crumbs from previous run %s, halt record %s, uptime %lu ms",
                          (sCrumbsBoot.magic == LOCAL_CRUMBS_MAGIC) ? "PRESENT" : "absent",
                          (sBootCopy.magic == LOCAL_ASSERT_MAGIC) ? "PRESENT" : "absent",
                          (unsigned long)otPlatAlarmMilliGetNow());
            sBootLines--;
            sBootLineMs += 5000;
        }
    }

    if (sCrumbReportsLeft > 0 && (int32_t)(otPlatAlarmMilliGetNow() - sNextReportMs) >= 0)
    {
        const local_crumbs_t *c = &sCrumbsBoot;

        otLogCritPlat("LOCAL previous run: loops %lu lastLoop %lu ms | txReq %lu (last %lu ms) txDone %lu (last %lu ms)",
                      (unsigned long)c->loops, (unsigned long)c->lastLoopMs, (unsigned long)c->txReq,
                      (unsigned long)c->lastTxReqMs, (unsigned long)c->txDone, (unsigned long)c->lastTxDoneMs);
        otLogCritPlat("LOCAL previous run: stuck %lu flags 0x%08lx | radioRx %lu (last %lu ms)", (unsigned long)c->stuck,
                      (unsigned long)c->stuckFlags, (unsigned long)c->radioRx, (unsigned long)c->radioRxLastMs);
        otLogCritPlat("LOCAL previous run: uart rx %lu bytes (last %lu ms) | tx calls %lu dones %lu (last %lu ms)",
                      (unsigned long)c->uartRxBytes, (unsigned long)c->uartRxLastMs, (unsigned long)c->uartTxCalls,
                      (unsigned long)c->uartTxDones, (unsigned long)c->uartTxLastMs);
        sCrumbReportsLeft--;
        if (sReportsLeft == 0)
        {
            sNextReportMs = otPlatAlarmMilliGetNow() + 5000;
        }
    }

    if (sReportsLeft > 0 && (int32_t)(otPlatAlarmMilliGetNow() - sNextReportMs) >= 0)
    {
        otLogCritPlat("LOCAL halt before this boot: %s:%lu (#%lu since power-up)", sBootCopy.file,
                      (unsigned long)sBootCopy.line, (unsigned long)sBootCopy.count);
        sReportsLeft--;
        sNextReportMs = otPlatAlarmMilliGetNow() + 5000;
    }
}

// ---- never sleep ---------------------------------------------------------------------------------
// The post-mortem counters showed one direction of the UART dying (bytes from the host stop
// arriving) while the main loop, the radio and the UART transmit side carry on. The iostream USART
// driver re-points its receive DMA at a dummy byte before every sleep and relinks it on every wake
// (sl_iostream_uart_prepare_for_sleep / _wakeup); the MCU naps between all events, so that handoff
// runs thousands of times a minute, with no flow control to hold the host off meanwhile. A
// USB-powered RCP gains nothing from sleeping. The platform layer asks this weak hook first.
bool efr32AllowSleepCallback(void) { return false; }
