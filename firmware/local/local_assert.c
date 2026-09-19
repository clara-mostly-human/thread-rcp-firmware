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
#include "em_device.h"

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

// Call from the application loop. Reports twice (at 1 s and 6 s after boot) because the host may
// not be listening to the log stream yet right after a reset.
void localAssertProcess(void)
{
    static uint8_t sInitialised = 0;

    if (!sInitialised)
    {
        sInitialised = 1;
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

    if (sReportsLeft > 0 && (int32_t)(otPlatAlarmMilliGetNow() - sNextReportMs) >= 0)
    {
        otLogCritPlat("LOCAL halt before this boot: %s:%lu (#%lu since power-up)", sBootCopy.file,
                      (unsigned long)sBootCopy.line, (unsigned long)sBootCopy.count);
        sReportsLeft--;
        sNextReportMs = otPlatAlarmMilliGetNow() + 5000;
    }
}
