/*
 *  Copyright (c) 2026, the thread-rcp-firmware authors.
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. Neither the name of the copyright holder nor the
 *     names of its contributors may be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 *  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 *  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 *  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 *  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 *  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 *  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGE.
 *
 *  SPDX-License-Identifier: BSD-3-Clause
 */

/**
 * @file
 *   OpenThread posix RCP vendor interface: Spinel through a CPC host's Unix socket.
 *
 *   Build: OT_POSIX_RCP_VENDOR_BUS=ON, OT_POSIX_CONFIG_RCP_VENDOR_INTERFACE=<this file>, and
 *   OPENTHREAD_POSIX_CONFIG_SPINEL_VENDOR_INTERFACE_URL_PROTOCOL_NAME="spinel+cpc" to name it.
 *   The HDLC interface stays built in; the radio URL picks one:
 *
 *       spinel+cpc:///path/to/spinel.sock[?connect-timeout=<seconds>]
 *
 *   The dongle runs Silicon Labs' OpenThread RCP with the CPC transport (ot_ncp_cpc, Spinel on
 *   CPC endpoint 12). The CPC host that owns the UART (thread-rcp-firmware
 *   zigbee-ble/host/thread_ble_bridge.py) serves that endpoint on a Unix socket. Each message on
 *   the socket is
 *
 *       type u8 | length u16 big-endian | payload
 *
 *     0x00 HELLO   host -> us, first: version u8 (1) | largest Spinel frame the RCP accepts u16 BE
 *                  (0 = not known yet) | UART bit rate u32 BE
 *     0x01 SPINEL  one Spinel frame, either direction, unchanged
 *     0x02 RESET   us -> host, empty: reboot the chip (HardwareReset());
 *                  host -> us: the chip (re)booted, CPC reset reason u32 BE
 *
 *   Spinel frames pass through untouched, SPINEL_CMD_RESET included: the RCP answers its own
 *   resets. A closed connection ends the process, as the HDLC interface does on a vanished UART.
 */

#include "openthread-posix-config.h"

#if OPENTHREAD_POSIX_CONFIG_SPINEL_VENDOR_INTERFACE_ENABLE

#include "vendor_interface.hpp"

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <sys/select.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <sys/un.h>
#include <unistd.h>

#include <openthread/logging.h>
#include <openthread/platform/time.h>

#include "logger.hpp"
#include "platform-posix.h"
#include "common/code_utils.hpp"
#include "common/new.hpp"
#include "lib/spinel/spinel.h"

namespace ot {
namespace Posix {

using ot::Spinel::SpinelInterface;

class CpcSocketInterface : public Logger<CpcSocketInterface>
{
public:
    static const char kLogModuleName[];

    CpcSocketInterface(const Url::Url &aRadioUrl, uint8_t aInterfaceType)
        : mRadioUrl(aRadioUrl)
        , mReceiveFrameCallback(nullptr)
        , mReceiveFrameContext(nullptr)
        , mReceiveFrameBuffer(nullptr)
        , mSockFd(-1)
        , mMaxFrame(0)
        , mBusSpeed(kDefaultBusSpeed)
        , mRxLength(0)
        , mHelloReceived(false)
        , mChipRebooted(false)
    {
        memset(&mInterfaceMetrics, 0, sizeof(mInterfaceMetrics));
        mInterfaceMetrics.mRcpInterfaceType = aInterfaceType;
    }

    otError Init(SpinelInterface::ReceiveFrameCallback aCallback,
                 void                                 *aCallbackContext,
                 SpinelInterface::RxFrameBuffer       &aFrameBuffer)
    {
        otError  error          = OT_ERROR_NONE;
        uint16_t connectTimeout = kDefaultConnectTimeoutSec;
        uint64_t deadline;

        VerifyOrExit(mSockFd == -1, error = OT_ERROR_ALREADY);

        mReceiveFrameCallback = aCallback;
        mReceiveFrameContext  = aCallbackContext;
        mReceiveFrameBuffer   = &aFrameBuffer;

        if (mRadioUrl.HasParam("connect-timeout"))
        {
            VerifyOrDie(mRadioUrl.ParseUint16("connect-timeout", connectTimeout) == OT_ERROR_NONE,
                        OT_EXIT_INVALID_ARGUMENTS);
        }

        mSockFd = Connect(connectTimeout);
        VerifyOrExit(mSockFd != -1, error = OT_ERROR_FAILED);

        // The CPC host speaks first: protocol version, the RCP's frame limit, the bus speed.
        deadline = otPlatTimeGet() + kHelloWaitMs * OT_US_PER_MS;

        while (!mHelloReceived)
        {
            uint64_t now = otPlatTimeGet();

            if (now >= deadline || WaitReadable(deadline - now) != OT_ERROR_NONE)
            {
                LogCrit("CPC host at %s sent no HELLO", mRadioUrl.GetPath());
                ExitNow(error = OT_ERROR_FAILED);
            }

            Read();
        }

    exit:
        if (error != OT_ERROR_NONE)
        {
            CloseSocket();
        }

        return error;
    }

    void Deinit(void)
    {
        CloseSocket();
        mReceiveFrameCallback = nullptr;
        mReceiveFrameContext  = nullptr;
        mReceiveFrameBuffer   = nullptr;
    }

    otError SendFrame(const uint8_t *aFrame, uint16_t aLength)
    {
        otError error = OT_ERROR_NONE;

        if (mMaxFrame != 0 && aLength > mMaxFrame)
        {
            LogWarn("Spinel frame of %u bytes exceeds the RCP's limit of %u bytes", aLength, mMaxFrame);
            ExitNow(error = OT_ERROR_NO_BUFS);
        }

        error = WriteMessage(kTypeSpinel, aFrame, aLength);

        mInterfaceMetrics.mTransferredFrameCount++;

        if (error == OT_ERROR_NONE)
        {
            mInterfaceMetrics.mTxFrameCount++;
            mInterfaceMetrics.mTxFrameByteCount += aLength;
            mInterfaceMetrics.mTransferredValidFrameCount++;
        }
        else
        {
            mInterfaceMetrics.mTransferredGarbageFrameCount++;
        }

    exit:
        return error;
    }

    otError WaitForFrame(uint64_t aTimeoutUs)
    {
        otError error = WaitReadable(aTimeoutUs);

        if (error == OT_ERROR_NONE)
        {
            Read();
        }

        return error;
    }

    void UpdateFdSet(void *aMainloopContext)
    {
        otSysMainloopContext *context = reinterpret_cast<otSysMainloopContext *>(aMainloopContext);

        assert(context != nullptr);

        FD_SET(mSockFd, &context->mReadFdSet);

        if (context->mMaxFd < mSockFd)
        {
            context->mMaxFd = mSockFd;
        }
    }

    void Process(const void *aMainloopContext)
    {
        const otSysMainloopContext *context = reinterpret_cast<const otSysMainloopContext *>(aMainloopContext);

        assert(context != nullptr);

        if (FD_ISSET(mSockFd, &context->mReadFdSet))
        {
            Read();
        }
    }

    uint32_t GetBusSpeed(void) const { return mBusSpeed; }

    /**
     * Reboots the chip through the CPC host and waits until it is back.
     *
     * Note: an RCP on the CPC transport sends its boot notification only after the host's first
     * frame (ncp_cpc.cpp mIsReady), so OpenThread's wait for that notification after a hardware
     * reset times out and it exits; it then restarts on a freshly booted chip.
     */
    otError HardwareReset(void)
    {
        otError  error = OT_ERROR_NONE;
        uint64_t deadline;

        LogNote("Asking the CPC host to reboot the chip");
        mChipRebooted = false;
        SuccessOrExit(error = WriteMessage(kTypeReset, nullptr, 0));

        deadline = otPlatTimeGet() + kResetWaitMs * OT_US_PER_MS;

        while (!mChipRebooted)
        {
            uint64_t now = otPlatTimeGet();

            if (now >= deadline || WaitReadable(deadline - now) != OT_ERROR_NONE)
            {
                LogWarn("The CPC host did not report the chip back within %u ms", kResetWaitMs);
                ExitNow(error = OT_ERROR_FAILED);
            }

            Read();
        }

    exit:
        return error;
    }

    const otRcpInterfaceMetrics *GetRcpInterfaceMetrics(void) const { return &mInterfaceMetrics; }

private:
    static constexpr uint8_t  kTypeHello                = 0x00;
    static constexpr uint8_t  kTypeSpinel               = 0x01;
    static constexpr uint8_t  kTypeReset                = 0x02;
    static constexpr uint8_t  kProtocolVersion          = 1;
    static constexpr uint16_t kHeaderSize               = 3;
    static constexpr uint16_t kMaxPayload               = SpinelInterface::kMaxFrameSize;
    static constexpr uint16_t kDefaultConnectTimeoutSec = 10;
    static constexpr uint32_t kHelloWaitMs              = 2000;
    static constexpr uint32_t kResetWaitMs              = 10000;
    static constexpr uint32_t kWriteWaitMs              = 2000;
    static constexpr uint32_t kDefaultBusSpeed          = 460800;

    static uint16_t ReadUint16BigEndian(const uint8_t *aBuffer)
    {
        return static_cast<uint16_t>((aBuffer[0] << 8) | aBuffer[1]);
    }

    static uint32_t ReadUint32BigEndian(const uint8_t *aBuffer)
    {
        return (static_cast<uint32_t>(aBuffer[0]) << 24) | (static_cast<uint32_t>(aBuffer[1]) << 16) |
               (static_cast<uint32_t>(aBuffer[2]) << 8) | aBuffer[3];
    }

    int Connect(uint16_t aTimeoutSec)
    {
        const char        *path = mRadioUrl.GetPath();
        struct sockaddr_un addr;
        uint64_t           deadline = otPlatTimeGet() + static_cast<uint64_t>(aTimeoutSec) * OT_US_PER_S;
        int                fd       = -1;
        bool               logged   = false;

        VerifyOrDie(path != nullptr && strlen(path) < sizeof(addr.sun_path), OT_EXIT_INVALID_ARGUMENTS);
        memset(&addr, 0, sizeof(addr));
        addr.sun_family = AF_UNIX;
        memcpy(addr.sun_path, path, strlen(path));

        // The CPC host may still be starting (or rebooting the chip): retry for a while.
        while (true)
        {
            fd = socket(AF_UNIX, SOCK_STREAM, 0);
            VerifyOrDie(fd != -1, OT_EXIT_ERROR_ERRNO);

            if (connect(fd, reinterpret_cast<const struct sockaddr *>(&addr), sizeof(addr)) == 0)
            {
                break;
            }

            close(fd);
            fd = -1;

            if ((errno != ENOENT && errno != ECONNREFUSED) || otPlatTimeGet() >= deadline)
            {
                LogCrit("Cannot connect to the CPC host at %s: %s", path, strerror(errno));
                ExitNow();
            }

            if (!logged)
            {
                LogNote("Waiting up to %u s for the CPC host at %s", aTimeoutSec, path);
                logged = true;
            }

            usleep(100000);
        }

        VerifyOrDie(fcntl(fd, F_SETFD, FD_CLOEXEC) != -1, OT_EXIT_ERROR_ERRNO);
        VerifyOrDie(fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) | O_NONBLOCK) != -1, OT_EXIT_ERROR_ERRNO);
#ifdef SO_NOSIGPIPE
        {
            // A write after the host went away must fail with EPIPE, not kill the process.
            int on = 1;

            VerifyOrDie(setsockopt(fd, SOL_SOCKET, SO_NOSIGPIPE, &on, sizeof(on)) == 0, OT_EXIT_ERROR_ERRNO);
        }
#endif
        LogNote("Connected to the CPC host at %s", path);

    exit:
        return fd;
    }

    void CloseSocket(void)
    {
        if (mSockFd != -1)
        {
            close(mSockFd);
            mSockFd = -1;
        }

        mRxLength      = 0;
        mHelloReceived = false;
    }

    otError WaitReadable(uint64_t aTimeoutUs)
    {
        otError        error = OT_ERROR_NONE;
        struct timeval timeout;
        fd_set         readFds;
        fd_set         errorFds;
        int            rval;

        timeout.tv_sec  = static_cast<time_t>(aTimeoutUs / OT_US_PER_S);
        timeout.tv_usec = static_cast<suseconds_t>(aTimeoutUs % OT_US_PER_S);

        FD_ZERO(&readFds);
        FD_ZERO(&errorFds);
        FD_SET(mSockFd, &readFds);
        FD_SET(mSockFd, &errorFds);

        rval = select(mSockFd + 1, &readFds, nullptr, &errorFds, &timeout);

        if (rval > 0)
        {
            VerifyOrDie(FD_ISSET(mSockFd, &readFds), OT_EXIT_FAILURE);
        }
        else if (rval == 0)
        {
            error = OT_ERROR_RESPONSE_TIMEOUT;
        }
        else if (errno == EINTR)
        {
            // As the HDLC interface: not a timeout; the caller reads (nothing) and waits again.
        }
        else
        {
            DieNowWithMessage("select on the CPC host socket", OT_EXIT_ERROR_ERRNO);
        }

        return error;
    }

    otError WriteMessage(uint8_t aType, const uint8_t *aPayload, uint16_t aLength)
    {
        otError  error = OT_ERROR_NONE;
        uint8_t  header[kHeaderSize];
        uint64_t deadline = otPlatTimeGet() + kWriteWaitMs * OT_US_PER_MS;
        size_t   offset   = 0;
        size_t   total    = kHeaderSize + aLength;

        header[0] = aType;
        header[1] = static_cast<uint8_t>(aLength >> 8);
        header[2] = static_cast<uint8_t>(aLength & 0xff);

        while (offset < total)
        {
            const uint8_t *data;
            size_t         length;
            ssize_t        rval;

            if (offset < kHeaderSize)
            {
                data   = header + offset;
                length = kHeaderSize - offset;
            }
            else
            {
                data   = aPayload + (offset - kHeaderSize);
                length = total - offset;
            }

#ifdef MSG_NOSIGNAL
            rval = send(mSockFd, data, length, MSG_NOSIGNAL);
#else
            rval = send(mSockFd, data, length, 0);
#endif

            if (rval > 0)
            {
                offset += static_cast<size_t>(rval);
                continue;
            }

            if (rval < 0 && (errno == EPIPE || errno == ECONNRESET))
            {
                DieNowWithMessage("CPC host closed the Spinel connection", OT_EXIT_FAILURE);
            }

            VerifyOrDie(rval < 0 && (errno == EAGAIN || errno == EWOULDBLOCK || errno == EINTR),
                        OT_EXIT_ERROR_ERRNO);

            {
                uint64_t       now = otPlatTimeGet();
                struct timeval timeout;
                fd_set         writeFds;

                VerifyOrExit(now < deadline, error = OT_ERROR_FAILED);
                timeout.tv_sec  = static_cast<time_t>((deadline - now) / OT_US_PER_S);
                timeout.tv_usec = static_cast<suseconds_t>((deadline - now) % OT_US_PER_S);
                FD_ZERO(&writeFds);
                FD_SET(mSockFd, &writeFds);
                VerifyOrExit(select(mSockFd + 1, nullptr, &writeFds, nullptr, &timeout) > 0 || errno == EINTR,
                             error = OT_ERROR_FAILED);
            }
        }

    exit:
        if (error != OT_ERROR_NONE)
        {
            LogWarn("Writing to the CPC host timed out");
        }

        return error;
    }

    void Read(void)
    {
        ssize_t rval = read(mSockFd, mRxBuffer + mRxLength, sizeof(mRxBuffer) - mRxLength);

        if (rval == 0)
        {
            DieNowWithMessage("CPC host closed the Spinel connection", OT_EXIT_FAILURE);
        }

        if (rval < 0)
        {
            VerifyOrDie(errno == EAGAIN || errno == EWOULDBLOCK || errno == EINTR, OT_EXIT_ERROR_ERRNO);
            ExitNow();
        }

        mRxLength += static_cast<size_t>(rval);

        while (mRxLength >= kHeaderSize)
        {
            uint8_t  type   = mRxBuffer[0];
            uint16_t length = ReadUint16BigEndian(&mRxBuffer[1]);

            if (length > kMaxPayload)
            {
                LogCrit("CPC host sent a %u-byte message (type %u), more than %u", length, type, kMaxPayload);
                DieNow(OT_EXIT_FAILURE);
            }

            VerifyOrExit(mRxLength >= kHeaderSize + length);
            HandleMessage(type, &mRxBuffer[kHeaderSize], length);
            mRxLength -= kHeaderSize + length;
            memmove(mRxBuffer, mRxBuffer + kHeaderSize + length, mRxLength);
        }

    exit:
        return;
    }

    void HandleMessage(uint8_t aType, const uint8_t *aPayload, uint16_t aLength)
    {
        switch (aType)
        {
        case kTypeHello:
            if (aLength < 7 || aPayload[0] != kProtocolVersion)
            {
                LogCrit("CPC host speaks protocol %u (%u bytes of HELLO); this interface speaks %u",
                        aLength > 0 ? aPayload[0] : 0, aLength, kProtocolVersion);
                DieNow(OT_EXIT_FAILURE);
            }

            mMaxFrame      = ReadUint16BigEndian(&aPayload[1]);
            mBusSpeed      = ReadUint32BigEndian(&aPayload[3]);
            mHelloReceived = true;
            LogNote("CPC host: protocol %u, RCP frames up to %u bytes, bus %lu bit/s", aPayload[0], mMaxFrame,
                    static_cast<unsigned long>(mBusSpeed));
            break;

        case kTypeSpinel:
            HandleSpinelFrame(aPayload, aLength);
            break;

        case kTypeReset:
            mChipRebooted = true;
            LogNote("CPC host: the chip rebooted (CPC reset reason 0x%08lx)",
                    static_cast<unsigned long>(aLength >= 4 ? ReadUint32BigEndian(aPayload) : 0xffffffffUL));
            break;

        default:
            LogWarn("Ignoring a message of unknown type %u from the CPC host", aType);
            break;
        }
    }

    void HandleSpinelFrame(const uint8_t *aFrame, uint16_t aLength)
    {
        VerifyOrExit(mReceiveFrameBuffer != nullptr && mReceiveFrameCallback != nullptr);

        if (aLength == 0 || !mReceiveFrameBuffer->CanWrite(aLength))
        {
            LogWarn("Dropping a %u-byte Spinel frame: no room in the receive buffer", aLength);
            mReceiveFrameBuffer->DiscardFrame();
            ExitNow();
        }

        for (uint16_t i = 0; i < aLength; i++)
        {
            if (mReceiveFrameBuffer->WriteByte(aFrame[i]) != OT_ERROR_NONE)
            {
                mReceiveFrameBuffer->DiscardFrame();
                ExitNow();
            }
        }

        mInterfaceMetrics.mRxFrameCount++;
        mInterfaceMetrics.mRxFrameByteCount += aLength;
        mReceiveFrameCallback(mReceiveFrameContext);

    exit:
        return;
    }

    const Url::Url                       &mRadioUrl;
    SpinelInterface::ReceiveFrameCallback mReceiveFrameCallback;
    void                                 *mReceiveFrameContext;
    SpinelInterface::RxFrameBuffer       *mReceiveFrameBuffer;
    int                                   mSockFd;
    uint16_t                              mMaxFrame;
    uint32_t                              mBusSpeed;
    size_t                                mRxLength;
    bool                                  mHelloReceived;
    bool                                  mChipRebooted;
    otRcpInterfaceMetrics                 mInterfaceMetrics;
    uint8_t                               mRxBuffer[kHeaderSize + kMaxPayload];
};

const char CpcSocketInterface::kLogModuleName[] = "CpcSocket";

// ----------------------------------------------------------------------------
// `VendorInterface` API: VendorInterface has no members (SpinelManager reserves only
// sizeof(VendorInterface) or the HDLC interface's size), so the state lives here.
// ----------------------------------------------------------------------------

static OT_DEFINE_ALIGNED_VAR(sCpcSocketInterfaceRaw, sizeof(CpcSocketInterface), uint64_t);

static CpcSocketInterface &Impl(void) { return *reinterpret_cast<CpcSocketInterface *>(&sCpcSocketInterfaceRaw); }

VendorInterface::VendorInterface(const Url::Url &aRadioUrl)
{
    new (&sCpcSocketInterfaceRaw) CpcSocketInterface(aRadioUrl, kSpinelInterfaceTypeVendor);
}

VendorInterface::~VendorInterface(void) { Deinit(); }

otError VendorInterface::Init(ReceiveFrameCallback aCallback, void *aCallbackContext, RxFrameBuffer &aFrameBuffer)
{
    return Impl().Init(aCallback, aCallbackContext, aFrameBuffer);
}

void VendorInterface::Deinit(void) { Impl().Deinit(); }

uint32_t VendorInterface::GetBusSpeed(void) const { return Impl().GetBusSpeed(); }

otError VendorInterface::HardwareReset(void) { return Impl().HardwareReset(); }

void VendorInterface::UpdateFdSet(void *aMainloopContext) { Impl().UpdateFdSet(aMainloopContext); }

void VendorInterface::Process(const void *aMainloopContext) { Impl().Process(aMainloopContext); }

otError VendorInterface::WaitForFrame(uint64_t aTimeoutUs) { return Impl().WaitForFrame(aTimeoutUs); }

otError VendorInterface::SendFrame(const uint8_t *aFrame, uint16_t aLength)
{
    return Impl().SendFrame(aFrame, aLength);
}

const otRcpInterfaceMetrics *VendorInterface::GetRcpInterfaceMetrics(void) const
{
    return Impl().GetRcpInterfaceMetrics();
}

} // namespace Posix
} // namespace ot

#endif // OPENTHREAD_POSIX_CONFIG_SPINEL_VENDOR_INTERFACE_ENABLE
