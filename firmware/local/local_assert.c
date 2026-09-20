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

typedef struct
{
    uint32_t magic;
    uint32_t line;
    uint32_t count; // asserts since power-up
    char     file[64];
} local_assert_record_t;

static local_assert_record_t sRecord __attribute__((section(".noinit")));
static local_assert_record_t sBootCopy; // what we found at boot, for reporting
static uint8_t               sReportsLeft = 0;
static uint32_t              sNextReportMs;

static void localRecordAndReset(const char *aWhat, uint32_t aLine) __attribute__((noreturn));
static void localRecordAndReset(const char *aWhat, uint32_t aLine)
{
    size_t length = strlen(aWhat);
    size_t keep   = sizeof(sRecord.file) - 1;

    __disable_irq();
    sRecord.count = (sRecord.magic == LOCAL_ASSERT_MAGIC) ? sRecord.count + 1 : 1;
    sRecord.magic = LOCAL_ASSERT_MAGIC;
    sRecord.line  = aLine;
    // The end of a path is the informative part.
    strncpy(sRecord.file, (length > keep) ? aWhat + (length - keep) : aWhat, keep);
    sRecord.file[keep] = '\0';
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
    uint32_t stuck; // times the stuck-transmit check fired
    uint32_t stuckFlags;
    uint32_t stuckRailState;
    uint32_t stuckTriggered, stuckStarted, stuckStartFailed, stuckSent, stuckDoneCb;
} local_crumbs_t;

static local_crumbs_t sCrumbs __attribute__((section(".noinit")));
static local_crumbs_t sCrumbsBoot;
static uint8_t        sCrumbReportsLeft = 0;

void localCrumbTxRequest(void)
{
    sCrumbs.txReq++;
    sCrumbs.lastTxReqMs = otPlatAlarmMilliGetNow();
}

void localCrumbTxDone(void)
{
    sCrumbs.txDone++;
    sCrumbs.lastTxDoneMs = otPlatAlarmMilliGetNow();
}

void localCrumbStuck(uint32_t aFlags, uint32_t aRailState, uint32_t aTriggered, uint32_t aStarted,
                     uint32_t aStartFailed, uint32_t aSent, uint32_t aDoneCb)
{
    sCrumbs.stuck++;
    sCrumbs.stuckFlags       = aFlags;
    sCrumbs.stuckRailState   = aRailState;
    sCrumbs.stuckTriggered   = aTriggered;
    sCrumbs.stuckStarted     = aStarted;
    sCrumbs.stuckStartFailed = aStartFailed;
    sCrumbs.stuckSent        = aSent;
    sCrumbs.stuckDoneCb      = aDoneCb;
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
        if (sCrumbs.magic == LOCAL_CRUMBS_MAGIC)
        {
            sCrumbsBoot       = sCrumbs;
            sCrumbReportsLeft = 2;
        }
        memset(&sCrumbs, 0, sizeof(sCrumbs));
        sCrumbs.magic = LOCAL_CRUMBS_MAGIC;
        if (sReportsLeft == 0)
        {
            sNextReportMs = otPlatAlarmMilliGetNow() + 1000;
        }
        localWatchdogStart();
        if (sRecord.magic == LOCAL_ASSERT_MAGIC)
        {
            sBootCopy     = sRecord;
            sRecord.magic = 0; // keep .count for the next one
            sReportsLeft  = 2;
            sNextReportMs = otPlatAlarmMilliGetNow() + 1000;
        }
        else
        {
            sRecord.count = 0;
        }
    }

    WDOGn_Feed(WDOG0);
    sCrumbs.loops++;
    sCrumbs.lastLoopMs = otPlatAlarmMilliGetNow();

    if (sCrumbReportsLeft > 0 && (int32_t)(otPlatAlarmMilliGetNow() - sNextReportMs) >= 0)
    {
        const local_crumbs_t *c = &sCrumbsBoot;

        otLogCritPlat("LOCAL previous run: loops %lu lastLoop %lu ms | txReq %lu (last %lu ms) txDone %lu (last %lu ms)",
                      (unsigned long)c->loops, (unsigned long)c->lastLoopMs, (unsigned long)c->txReq,
                      (unsigned long)c->lastTxReqMs, (unsigned long)c->txDone, (unsigned long)c->lastTxDoneMs);
        otLogCritPlat("LOCAL previous run: stuck %lu flags 0x%08lx rail 0x%lx | triggered %lu started %lu startFailed %lu "
                      "sent %lu doneCb %lu",
                      (unsigned long)c->stuck, (unsigned long)c->stuckFlags, (unsigned long)c->stuckRailState,
                      (unsigned long)c->stuckTriggered, (unsigned long)c->stuckStarted,
                      (unsigned long)c->stuckStartFailed, (unsigned long)c->stuckSent, (unsigned long)c->stuckDoneCb);
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
