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

void otPlatAssertFail(const char *aFilename, int aLineNumber)
{
    size_t length = strlen(aFilename);
    size_t keep   = sizeof(sRecord.file) - 1;

    __disable_irq();
    sRecord.count = (sRecord.magic == LOCAL_ASSERT_MAGIC) ? sRecord.count + 1 : 1;
    sRecord.magic = LOCAL_ASSERT_MAGIC;
    sRecord.line  = (uint32_t)aLineNumber;
    // The end of the path is the informative part.
    strncpy(sRecord.file, (length > keep) ? aFilename + (length - keep) : aFilename, keep);
    sRecord.file[keep] = '\0';
    NVIC_SystemReset();
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
        otLogCritPlat("LOCAL assert before this boot: %s:%lu (assert #%lu since power-up)", sBootCopy.file,
                      (unsigned long)sBootCopy.line, (unsigned long)sBootCopy.count);
        sReportsLeft--;
        sNextReportMs = otPlatAlarmMilliGetNow() + 5000;
    }
}
