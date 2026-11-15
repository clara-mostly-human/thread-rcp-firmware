"""Asyncio host (primary) for Silicon Labs CPC, protocol version 6, over a byte stream (UART).

Written from the Zlib-licensed chip-side sources of Simplicity SDK 2025.6.3
(platform/service/cpc). File:line references below point into that SDK: a bare sl_cpc*.c name
is in platform/service/cpc/src, inc/ and src/ are under platform/service/cpc, other paths are
from the SDK root. CPC security is NOT implemented: the secondary must be
built without it (see README.md).

Wire format (one frame):

    0x14 | address | length (u16 LE) | control | HCS (u16 LE) | payload | FCS (u16 LE)

    HCS = CRC-16/XMODEM over the first 5 bytes. The payload and FCS are present only when
    length != 0, and length counts the 2 FCS bytes (sl_cpc.c:4500, sl_cpc.c:3624-3637).

Library use:

    reader, writer = await open_serial("/dev/cu.usbserial-XXXX", 460800)
    async with CpcPrimary(reader, writer) as cpc:
        info = await cpc.start()
        ep = await cpc.connect_endpoint(EP_ZIGBEE)
        await ep.write(b"...")
        reply = await ep.read(timeout=2)
"""

from __future__ import annotations

import asyncio
import enum
import logging
import struct
import time
from dataclasses import dataclass, field
from typing import Any, Protocol

_LOG = logging.getLogger("cpc")

# --------------------------------------------------------------------------------------------
# Protocol constants
# --------------------------------------------------------------------------------------------

FLAG = 0x14                    # inc/sli_cpc_hdlc.h:45
HEADER_SIZE = 5                # bytes covered by the HCS, inc/sli_cpc_hdlc.h:42
HEADER_RAW_SIZE = 7            # header + HCS, inc/sli_cpc_hdlc.h:43
FCS_SIZE = 2                   # inc/sli_cpc_hdlc.h:74

FRAME_I = 0                    # information (control bits 7-6 = 0 or 1), inc/sli_cpc_hdlc.h:53,175-184
FRAME_S = 2                    # supervisory, inc/sli_cpc_hdlc.h:54
FRAME_U = 3                    # unnumbered, inc/sli_cpc_hdlc.h:55

S_RR = 0                       # supervisory "ack", inc/sli_cpc_hdlc.h:70
S_REJ = 1                      # supervisory "reject", 1-byte reason payload, inc/sli_cpc_hdlc.h:71-72

U_INFORMATION = 0x00           # inc/sli_cpc_hdlc.h:65
U_POLL_FINAL = 0x04            # inc/sli_cpc_hdlc.h:66
U_RESET_SEQ = 0x31             # inc/sli_cpc_hdlc.h:67
U_ACKNOWLEDGE = 0x0E           # inc/sli_cpc_hdlc.h:68
# The SDK reads the U type with mask 0x37 (inc/sli_cpc_hdlc.h:63), which turns 0x0E into 0x06.
# The secondary never receives an acknowledge, so that does not bite it; the host classifies
# U-frames by the low 6 bits instead, which is exact for all four types.
_U_TYPE_MASK_HOST = 0x3F

PROTOCOL_VERSION = 6           # inc/sli_cpc.h:84

EP_SYSTEM = 0                  # inc/sli_cpc.h:221
EP_ZIGBEE = 5                  # inc/sli_cpc.h:233
EP_BLUETOOTH_RCP = 14          # inc/sli_cpc.h:260

RE_TRANSMIT_MAX = 10           # inc/sli_cpc.h:351
INIT_RE_TRANSMIT_TIMEOUT = 0.100   # inc/sli_cpc.h:352
MAX_RE_TRANSMIT_TIMEOUT = 5.0      # inc/sli_cpc.h:353
SYSTEM_CMD_TIMEOUT = 10.0          # inc/sli_cpc.h:357 (used for the connect request, sl_cpc.c:3019)

# Largest payload the secondary may send unless told otherwise (inc/sl_cpc.h:284). The host
# never sets PROP_TX_CAPABILITY, so it must accept this much.
SECONDARY_TX_PAYLOAD_MAX = 2 * 2048 - 7 - 2

# Version the host reports in PROP_PRIMARY_VERSION_VALUE. The secondary only stores it
# (src/sl_cpc_system_secondary.c:934-949).
HOST_VERSION = (0, 1, 0, 0)


class Reject(enum.IntEnum):
    """S-frame reject reasons, inc/sli_cpc.h:373-379."""

    NO_ERROR = 0
    CHECKSUM_MISMATCH = 1
    SEQUENCE_MISMATCH = 2
    OUT_OF_MEMORY = 3
    SECURITY_ISSUE = 4
    UNREACHABLE_ENDPOINT = 5
    ERROR = 6


class Cmd(enum.IntEnum):
    """System endpoint command ids, inc/sli_cpc_system_common.h:468-476."""

    NOOP = 0x00
    RESET = 0x01
    PROP_VALUE_GET = 0x02
    PROP_VALUE_SET = 0x03
    PROP_VALUE_IS = 0x06


class Prop(enum.IntEnum):
    """System properties (u32 on the wire), inc/sli_cpc_system_common.h:58-335."""

    LAST_STATUS = 0x00
    PROTOCOL_VERSION = 0x01
    CAPABILITIES = 0x02
    SECONDARY_CPC_VERSION = 0x03
    SECONDARY_APP_VERSION = 0x04
    RX_CAPABILITY = 0x20
    TX_CAPABILITY = 0x21
    FC_VALIDATION_VALUE = 0x30
    BUS_BITRATE_VALUE = 0x40
    BUS_MAX_BITRATE_VALUE = 0x50
    PRIMARY_VERSION_VALUE = 0x60
    BOOTLOADER_INFO = 0x200
    BOOTLOADER_REBOOT_MODE = 0x202
    SECURITY_STATE = 0x301
    CORE_DEBUG_COUNTERS = 0x400
    UFRAME_PROCESSING = 0x500
    ENTER_IRQ = 0x600
    ENDPOINT_ENCRYPTION = 0x700
    ENDPOINT_STATE_0 = 0x1000      # + endpoint id, up to 0x10FF
    ENDPOINT_STATES = 0x1100


def prop_endpoint_state(ep_id: int) -> int:
    """PROP_ENDPOINT_STATE_<id>, inc/sli_cpc_system_common.h:340,351."""
    return Prop.ENDPOINT_STATE_0 | (ep_id & 0xFF)


class Status(enum.IntEnum):
    """sl_cpc_system_status_t (u32), inc/sli_cpc_system_common.h:370-409."""

    OK = 0
    FAILURE = 1
    UNIMPLEMENTED = 2
    INVALID_ARGUMENT = 3
    INVALID_STATE = 4
    INVALID_COMMAND = 5
    INVALID_INTERFACE = 6
    INTERNAL_ERROR = 7
    SECURITY_ERROR = 8
    PARSE_ERROR = 9
    IN_PROGRESS = 10
    NOMEM = 11
    BUSY = 12
    PROP_NOT_FOUND = 13
    PACKET_DROPPED = 14
    EMPTY = 15
    CMD_TOO_BIG = 16
    NO_ACK = 17
    CCA_FAILURE = 18
    ALREADY = 19
    ITEM_NOT_FOUND = 20
    INVALID_COMMAND_FOR_PROP = 21
    RESET_POWER_ON = 112
    RESET_EXTERNAL = 113
    RESET_SOFTWARE = 114
    RESET_FAULT = 115
    RESET_CRASH = 116
    RESET_ASSERT = 117
    RESET_OTHER = 118
    RESET_UNKNOWN = 119
    RESET_WATCHDOG = 120


class EpState(enum.IntEnum):
    """sl_cpc_endpoint_state_t, a uint8_t on the wire (inc/sl_cpc.h:92-106,
    platform/common/inc/sl_enum.h:57)."""

    FREED = 0
    OPEN = 1
    CLOSED = 2
    CLOSING = 3
    CONNECTING = 4
    CONNECTED = 5
    SHUTTING_DOWN = 6
    SHUTDOWN = 7
    REMOTE_SHUTDOWN = 8
    DISCONNECTED = 9
    ERROR_DESTINATION_UNREACHABLE = 10
    ERROR_SECURITY_INCIDENT = 11
    ERROR_FAULT = 12


class SecurityState(enum.IntEnum):
    """sl_cpc_security_state_t, inc/sl_cpc_security.h:64-69."""

    NOT_READY = 0
    DISABLED = 1
    INITIALIZING = 2
    RESETTING = 3
    WAITING_ON_TX_COMPLETE = 4
    INITIALIZED = 5


class Capability(enum.IntFlag):
    """PROP_CAPABILITIES bits, inc/sli_cpc_system_common.h:460-463."""

    SECURITY_ENDPOINT = 1 << 0
    PACKED_ENDPOINT = 1 << 1
    GPIO_ENDPOINT = 1 << 2
    UART_FLOW_CONTROL = 1 << 3


REBOOT_APPLICATION = 0         # inc/sli_cpc_system_common.h:414

_SYS_HEADER = struct.Struct("<BBH")   # command_id, seq, length: inc/sli_cpc_system_common.h:483-493


def _name(enum_cls: type[enum.IntEnum], value: int) -> str:
    try:
        return enum_cls(value).name
    except ValueError:
        return f"{value:#x}"


# --------------------------------------------------------------------------------------------
# CRC-16/XMODEM (poly 0x1021, init 0, no reflection, no final xor): src/sl_cpc_crc.c:100-144
# --------------------------------------------------------------------------------------------

def _make_crc_table() -> tuple[int, ...]:
    table = []
    for byte in range(256):
        crc = byte << 8
        for _ in range(8):
            crc = ((crc << 1) ^ 0x1021) if crc & 0x8000 else (crc << 1)
        table.append(crc & 0xFFFF)
    return tuple(table)


_CRC_TABLE = _make_crc_table()


def crc16(data: bytes | bytearray | memoryview, crc: int = 0) -> int:
    """CRC-16/XMODEM, as used for both the HCS and the FCS (src/sl_cpc_hdlc.c:54)."""
    table = _CRC_TABLE
    for byte in data:
        crc = ((crc << 8) & 0xFFFF) ^ table[((crc >> 8) ^ byte) & 0xFF]
    return crc


# --------------------------------------------------------------------------------------------
# Frames
# --------------------------------------------------------------------------------------------

def control_i(seq: int, ack: int, poll_final: bool = False) -> int:
    """I-frame control: seq bits 6-4, P/F bit 3, ack bits 2-0 (inc/sli_cpc_hdlc.h:259-268)."""
    return ((seq & 7) << 4) | (0x08 if poll_final else 0) | (ack & 7)


def control_s(ack: int, function: int) -> int:
    """S-frame control: 0b10, function bits 5-4, ack bits 2-0 (inc/sli_cpc_hdlc.h:278-286)."""
    return (FRAME_S << 6) | ((function & 3) << 4) | (ack & 7)


def control_u(u_type: int) -> int:
    """U-frame control: 0b11 then the type (inc/sli_cpc_hdlc.h:293-300)."""
    return (FRAME_U << 6) | u_type


@dataclass(frozen=True, slots=True)
class Frame:
    address: int
    control: int
    payload: bytes = b""
    fcs_ok: bool = True        # False: header valid, payload checksum wrong

    @property
    def kind(self) -> int:
        top = self.control >> 6
        return FRAME_I if top in (0, 1) else top

    @property
    def seq(self) -> int:
        return (self.control >> 4) & 7

    @property
    def ack(self) -> int:
        return self.control & 7

    @property
    def poll_final(self) -> bool:
        return bool(self.control & 0x08)

    @property
    def s_function(self) -> int:
        return (self.control >> 4) & 3

    @property
    def u_type(self) -> int:
        return self.control & _U_TYPE_MASK_HOST

    def encode(self) -> bytes:
        return encode_frame(self.address, self.control, self.payload)

    def describe(self) -> str:
        n = len(self.payload)
        bad = "" if self.fcs_ok else " BAD-FCS"
        if self.kind == FRAME_I:
            pf = " P/F" if self.poll_final else ""
            return f"I ep={self.address} seq={self.seq} ack={self.ack}{pf} len={n}{bad}"
        if self.kind == FRAME_S:
            if self.s_function == S_RR:
                return f"S ep={self.address} RR ack={self.ack}"
            reason = _name(Reject, self.payload[0]) if self.payload else "?"
            return f"S ep={self.address} REJ({reason}) ack={self.ack}{bad}"
        names = {U_INFORMATION: "INFO", U_POLL_FINAL: "POLL/FINAL", U_RESET_SEQ: "RESET-SEQ",
                 U_ACKNOWLEDGE: "UA"}
        return f"U ep={self.address} {names.get(self.u_type, hex(self.control))} len={n}{bad}"


def encode_frame(address: int, control: int, payload: bytes = b"") -> bytes:
    """Build one CPC frame (src/sl_cpc_hdlc.c:39-59, sl_cpc.c:4500 for the length)."""
    if len(payload) > 0xFFFF - FCS_SIZE:
        raise ValueError("payload too long for a CPC frame")
    length = len(payload) + FCS_SIZE if payload else 0
    head = bytes((FLAG, address & 0xFF, length & 0xFF, length >> 8, control & 0xFF))
    out = bytearray(head)
    out += crc16(head).to_bytes(2, "little")
    if payload:
        out += payload
        out += crc16(payload).to_bytes(2, "little")
    return bytes(out)


class FrameDecoder:
    """Incremental decoder that resynchronises on garbage.

    A header is accepted only if it starts with the flag and its HCS matches; otherwise one
    byte is dropped and the search continues (the secondary's UART driver does the same with a
    sliding window, src/sl_cpc_drv_uart.c:1187-1206). A header with a valid HCS is trusted for
    its length, so a frame whose payload checksum fails is consumed whole and reported with
    fcs_ok=False (the core needs it to send a checksum reject, sl_cpc.c:3647-3651).
    """

    def __init__(self, max_payload: int = SECONDARY_TX_PAYLOAD_MAX) -> None:
        self.max_payload = max_payload
        self._buf = bytearray()
        self.discarded_bytes = 0
        self.header_errors = 0
        self.fcs_errors = 0

    def feed(self, data: bytes) -> list[Frame]:
        buf = self._buf
        buf += data
        frames: list[Frame] = []
        while True:
            start = buf.find(FLAG)
            if start < 0:
                self.discarded_bytes += len(buf)
                buf.clear()
                break
            if start:
                self.discarded_bytes += start
                del buf[:start]
            if len(buf) < HEADER_RAW_SIZE:
                break
            hcs = buf[5] | (buf[6] << 8)
            length = buf[2] | (buf[3] << 8)
            # A payload must be at least 1 byte + FCS (sl_cpc.c:3625-3633).
            if (crc16(memoryview(buf)[:HEADER_SIZE]) != hcs
                    or length in (1, 2) or length > self.max_payload + FCS_SIZE):
                self.header_errors += 1
                self.discarded_bytes += 1
                del buf[:1]
                continue
            total = HEADER_RAW_SIZE + length
            if len(buf) < total:
                break
            address, control = buf[1], buf[4]
            if length:
                payload = bytes(buf[HEADER_RAW_SIZE:total - FCS_SIZE])
                fcs = buf[total - 2] | (buf[total - 1] << 8)
                ok = crc16(payload) == fcs
                if not ok:
                    self.fcs_errors += 1
            else:
                payload, ok = b"", True
            del buf[:total]
            frames.append(Frame(address, control, payload, ok))
        return frames


# --------------------------------------------------------------------------------------------
# Errors
# --------------------------------------------------------------------------------------------

class CpcError(Exception):
    """Base class for everything this module raises."""


class CpcTimeoutError(CpcError, TimeoutError):
    pass


class CpcProtocolError(CpcError):
    """The secondary sent something this host does not understand."""


class CpcConnectionLost(CpcError):
    """Transport closed, or the secondary reset unexpectedly."""


class CpcRejectError(CpcError):
    def __init__(self, endpoint: int, reason: int, hint: str = "") -> None:
        self.endpoint = endpoint
        self.reason = reason
        msg = f"secondary rejected a frame on endpoint {endpoint}: {_name(Reject, reason)}"
        super().__init__(f"{msg}. {hint}" if hint else msg)


class CpcPropertyError(CpcError):
    """A property get/set was answered with PROP_LAST_STATUS instead of the property."""

    def __init__(self, prop: int, status: int | None) -> None:
        self.prop = prop
        self.status = status
        st = "no status" if status is None else _name(Status, status)
        super().__init__(f"property {_name(Prop, prop)} ({prop:#x}) failed: {st}")


class CpcEndpointError(CpcError):
    pass


# --------------------------------------------------------------------------------------------
# Transport interface
# --------------------------------------------------------------------------------------------

class StreamReaderLike(Protocol):
    async def read(self, n: int = -1) -> bytes: ...


class StreamWriterLike(Protocol):
    def write(self, data: bytes) -> Any: ...
    def close(self) -> Any: ...


# --------------------------------------------------------------------------------------------
# Endpoints
# --------------------------------------------------------------------------------------------

@dataclass
class _PendingTx:
    seq: int
    payload: bytes
    poll_final: bool
    wake: asyncio.Event = field(default_factory=asyncio.Event)
    acked: bool = False
    error: BaseException | None = None


@dataclass
class EndpointStats:
    tx_iframes: int = 0
    retransmits: int = 0
    rx_iframes: int = 0
    rx_duplicates: int = 0
    rejects_sent: int = 0
    rejects_received: int = 0


_CLOSED = object()


class Endpoint:
    """One CPC endpoint. Transmit window is 1, as on the secondary (inc/sl_cpc.h:287-288)."""

    def __init__(self, primary: CpcPrimary, ep_id: int) -> None:
        self._primary = primary
        self.id = ep_id
        self.seq = 0        # next sequence number to send (sl_cpc.c:2644)
        self.ack = 0        # next sequence number expected from the secondary (sl_cpc.c:2645)
        self.connected = False
        self.error: CpcError | None = None
        self.stats = EndpointStats()
        self._rx: asyncio.Queue[Any] = asyncio.Queue()
        self._tx_lock = asyncio.Lock()
        self._pending: _PendingTx | None = None

    def __repr__(self) -> str:
        return f"<Endpoint {self.id} connected={self.connected} seq={self.seq} ack={self.ack}>"

    async def write(self, data: bytes) -> None:
        """Send one payload as an I-frame and wait until the secondary acknowledges it."""
        data = bytes(data)
        if not data:
            raise ValueError("CPC I-frames need a non-empty payload")
        limit = self._primary.max_tx_payload
        if len(data) > limit:
            raise ValueError(f"payload of {len(data)} bytes exceeds the secondary's RX capability "
                             f"of {limit} bytes")
        if self.id != EP_SYSTEM and not self.connected and self.error is None:
            raise CpcEndpointError(f"endpoint {self.id} is not connected")
        await self._primary._send_iframe(self, data)

    async def read(self, timeout: float | None = None) -> bytes:
        """Return the next payload received on this endpoint."""
        if self.error is not None and self._rx.empty():
            raise self.error
        try:
            async with asyncio.timeout(timeout):
                item = await self._rx.get()
        except TimeoutError:
            raise CpcTimeoutError(f"no data on endpoint {self.id} within {timeout} s") from None
        if item is _CLOSED:
            self._rx.put_nowait(_CLOSED)        # wake any other reader too
            assert self.error is not None
            raise self.error
        return item

    def read_nowait(self) -> bytes | None:
        try:
            item = self._rx.get_nowait()
        except asyncio.QueueEmpty:
            return None
        if item is _CLOSED:
            self._rx.put_nowait(_CLOSED)
            assert self.error is not None
            raise self.error
        return item

    def _deliver(self, payload: bytes) -> None:
        self._rx.put_nowait(payload)

    def _fail(self, exc: CpcError) -> None:
        if self.error is None:
            self.error = exc
        self.connected = False
        p = self._pending
        if p is not None and not p.acked and p.error is None:
            p.error = exc
            p.wake.set()
        self._rx.put_nowait(_CLOSED)


# --------------------------------------------------------------------------------------------
# Primary
# --------------------------------------------------------------------------------------------

@dataclass
class SecondaryInfo:
    protocol_version: int
    capabilities: int
    rx_capability: int
    cpc_version: tuple[int, int, int]
    app_version: str
    reset_reason: int | None

    @property
    def capability_names(self) -> list[str]:
        return [c.name for c in Capability if self.capabilities & c] or ["none"]


@dataclass
class PrimaryStats:
    tx_frames: int = 0
    rx_frames: int = 0
    unknown_endpoint_frames: int = 0


def _u32(value: bytes, what: str) -> int:
    if len(value) != 4:
        raise CpcProtocolError(f"{what}: expected 4 bytes, got {value.hex() or 'nothing'}")
    return int.from_bytes(value, "little")


class CpcPrimary:
    """CPC primary over a (reader, writer) byte stream pair."""

    def __init__(self, reader: StreamReaderLike, writer: StreamWriterLike, *,
                 initial_rto: float = INIT_RE_TRANSMIT_TIMEOUT,
                 max_rto: float = MAX_RE_TRANSMIT_TIMEOUT,
                 max_retransmits: int = RE_TRANSMIT_MAX,
                 uframe_timeout: float = 1.0,
                 uframe_retries: int = 5,
                 command_timeout: float = SYSTEM_CMD_TIMEOUT) -> None:
        self._reader = reader
        self._writer = writer
        self.initial_rto = initial_rto
        self.max_rto = max_rto
        self.max_retransmits = max_retransmits
        self.uframe_timeout = uframe_timeout
        self.uframe_retries = uframe_retries
        self.command_timeout = command_timeout

        self.decoder = FrameDecoder()
        self.stats = PrimaryStats()
        self.info: SecondaryInfo | None = None
        # Until PROP_RX_CAPABILITY is read: the SDK default (config/sl_cpc_config.h:46).
        self.max_tx_payload = 256
        self.last_reset_reason: int | None = None

        self._sys = Endpoint(self, EP_SYSTEM)
        self._sys.connected = True     # the system endpoint is always connected (sl_cpc.c:1210-1213)
        self._endpoints: dict[int, Endpoint] = {EP_SYSTEM: self._sys}
        self._cmd_seq = 0
        self._sys_waiters: dict[int, asyncio.Future[tuple[int, bytes]]] = {}
        self._ua_event = asyncio.Event()
        self._reset_reason_event = asyncio.Event()
        self._ep_open_events: dict[int, asyncio.Event] = {}
        self._expect_reset = False
        self._started = False
        self._dead: CpcError | None = None
        self._reader_task: asyncio.Task[None] | None = None

    # -- lifecycle -----------------------------------------------------------------------------

    async def __aenter__(self) -> CpcPrimary:
        return self

    async def __aexit__(self, *exc: object) -> None:
        await self.close()

    def _ensure_reader(self) -> None:
        if self._reader_task is None:
            self._reader_task = asyncio.get_running_loop().create_task(self._read_loop(),
                                                                       name="cpc-reader")

    async def close(self) -> None:
        if self._reader_task is not None:
            self._reader_task.cancel()
            try:
                await self._reader_task
            except (asyncio.CancelledError, Exception):
                pass
            self._reader_task = None
        self._fatal(CpcConnectionLost("CPC primary closed"))
        try:
            self._writer.close()
        except Exception:      # noqa: BLE001 - closing is best effort
            pass

    async def start(self, *, reset: bool = True, set_primary_version: bool = True,
                    reset_timeout: float = 5.0) -> SecondaryInfo:
        """Bring the link up and read the secondary's identity.

        reset=True first reboots the secondary into its application, as the SDK's embedded
        primary does (src/sl_cpc_reboot_sequence.c:324-394): it clears endpoint connections
        and sequence numbers left over from an earlier host session. Then: reset-seq on the
        system endpoint, protocol version, capabilities, RX capability, CPC version, primary
        version (optional) and application version, all as U-frame polls. The application
        version is read last because reading it marks the reset sequence done on the
        secondary (src/sl_cpc_system_secondary.c:1213-1216).
        """
        self._ensure_reader()
        if reset:
            await self._reset_secondary(reset_timeout)
        await self.reset_sequence_numbers()

        pv = await self.get_property(Prop.PROTOCOL_VERSION, uframe=True)
        if len(pv) != 1:
            raise CpcProtocolError(f"protocol version reply has {len(pv)} bytes, expected 1")
        if pv[0] != PROTOCOL_VERSION:
            raise CpcProtocolError(f"secondary speaks CPC protocol v{pv[0]}, this host v{PROTOCOL_VERSION}")
        caps = _u32(await self.get_property(Prop.CAPABILITIES, uframe=True), "capabilities")
        rx = await self.get_property(Prop.RX_CAPABILITY, uframe=True)
        if len(rx) != 2:
            raise CpcProtocolError(f"RX capability reply has {len(rx)} bytes, expected 2")
        rx_cap = int.from_bytes(rx, "little")
        ver = await self.get_property(Prop.SECONDARY_CPC_VERSION, uframe=True)
        if len(ver) != 12:
            raise CpcProtocolError(f"CPC version reply has {len(ver)} bytes, expected 12")
        cpc_version = struct.unpack("<III", ver)
        if set_primary_version:
            await self.set_property(Prop.PRIMARY_VERSION_VALUE, bytes(HOST_VERSION), uframe=True)
        app = await self.get_property(Prop.SECONDARY_APP_VERSION, uframe=True)
        app_version = app.split(b"\0", 1)[0].decode("utf-8", "replace")

        self.max_tx_payload = rx_cap
        self.info = SecondaryInfo(pv[0], caps, rx_cap, cpc_version, app_version,
                                  self.last_reset_reason)
        self._started = True
        if caps & Capability.SECURITY_ENDPOINT:
            _LOG.warning("secondary reports CPC security enabled; this host does not implement "
                         "it, so I-frames on endpoints other than 0 and 1 will be rejected")
        return self.info

    async def _reset_secondary(self, reset_timeout: float) -> None:
        mode = await self.set_property(Prop.BOOTLOADER_REBOOT_MODE,
                                       struct.pack("<I", REBOOT_APPLICATION), uframe=True)
        if _u32(mode, "reboot mode") != REBOOT_APPLICATION:
            raise CpcProtocolError(f"secondary will not reboot into the application (mode {mode.hex()})")

        self._expect_reset = True
        self._reset_reason_event.clear()
        loop = asyncio.get_running_loop()
        deadline = loop.time() + reset_timeout
        try:
            seq, fut = self._new_command()
            msg = self._command_bytes(Cmd.RESET, seq, b"")
            replied = False
            try:
                for _ in range(1 + self.uframe_retries):
                    self._transmit(EP_SYSTEM, control_u(U_POLL_FINAL), msg)
                    done = await self._wait_any(self.uframe_timeout, fut,
                                                self._reset_reason_event)
                    if fut in done:
                        cmd, body = fut.result()
                        if cmd != Cmd.RESET or len(body) != 4:
                            raise CpcProtocolError(f"unexpected reply to RESET: cmd {cmd:#x} {body.hex()}")
                        status = int.from_bytes(body, "little")
                        if status != Status.OK:
                            raise CpcProtocolError(f"secondary refused to reset: {_name(Status, status)}")
                        replied = True
                        break
                    if self._reset_reason_event.is_set():
                        break           # reply lost but it rebooted: do not ask again
            finally:
                self._sys_waiters.pop(seq, None)
            if not replied and not self._reset_reason_event.is_set():
                raise CpcTimeoutError("secondary did not answer the RESET command")
            remaining = max(0.0, deadline - loop.time())
            try:
                async with asyncio.timeout(remaining):
                    await self._reset_reason_event.wait()
            except TimeoutError:
                _LOG.warning("no reset reason from the secondary within %.1f s; continuing",
                             reset_timeout)
        finally:
            self._expect_reset = False
        # A rebooted secondary starts every endpoint at seq 0 / ack 0 (sl_cpc.c:2644-2645).
        self._sys.seq = self._sys.ack = 0

    async def reset_sequence_numbers(self) -> None:
        """Send U-frame reset-seq on the system endpoint and wait for the U-frame acknowledge.

        The secondary zeroes the system endpoint's seq and ack (sl_cpc.c:4212-4229).
        """
        self._check_alive()
        for _ in range(1 + self.uframe_retries):
            self._ua_event.clear()
            self._transmit(EP_SYSTEM, control_u(U_RESET_SEQ))
            try:
                async with asyncio.timeout(self.uframe_timeout):
                    await self._ua_event.wait()
            except TimeoutError:
                continue
            self._check_alive()
            self._sys.seq = self._sys.ack = 0
            return
        raise CpcTimeoutError("secondary did not acknowledge reset-seq (is it running CPC at this baud rate?)")

    # -- system commands -----------------------------------------------------------------------

    def _new_command(self) -> tuple[int, asyncio.Future[tuple[int, bytes]]]:
        self._check_alive()
        seq = self._cmd_seq
        self._cmd_seq = (seq + 1) & 0xFF
        fut: asyncio.Future[tuple[int, bytes]] = asyncio.get_running_loop().create_future()
        self._sys_waiters[seq] = fut
        return seq, fut

    @staticmethod
    def _command_bytes(cmd: int, seq: int, body: bytes) -> bytes:
        return _SYS_HEADER.pack(cmd, seq, len(body)) + body

    async def system_command(self, cmd: int, body: bytes = b"", *, uframe: bool,
                             timeout: float | None = None,
                             retries: int | None = None) -> tuple[int, bytes]:
        """Send one system command and return (reply command id, reply payload).

        U-frame polls are not retransmitted by the link layer, so they are repeated here with
        the same command seq (src/sl_cpc_system_primary.c:265-289). I-frame commands are sent
        once with P/F set and the link layer retransmits them (src/sl_cpc_system_primary.c:
        895-913). The secondary accepts only RESET and a few properties as U-frames
        (src/sl_cpc_system_secondary.c:1416-1457); anything else must be an I-frame.
        """
        seq, fut = self._new_command()
        msg = self._command_bytes(cmd, seq, body)
        try:
            if uframe:
                per_try = self.uframe_timeout if timeout is None else timeout
                tries = 1 + (self.uframe_retries if retries is None else retries)
                for _ in range(tries):
                    self._transmit(EP_SYSTEM, control_u(U_POLL_FINAL), msg)
                    try:
                        async with asyncio.timeout(per_try):
                            return await asyncio.shield(fut)
                    except TimeoutError:
                        continue
                raise CpcTimeoutError(f"no reply to system command {_name(Cmd, cmd)} "
                                      f"after {tries} U-frame polls")
            await self._send_iframe(self._sys, msg, poll_final=True)
            wait = self.command_timeout if timeout is None else timeout
            try:
                async with asyncio.timeout(wait):
                    return await fut
            except TimeoutError:
                raise CpcTimeoutError(f"no reply to system command {_name(Cmd, cmd)} "
                                      f"within {wait} s") from None
        finally:
            self._sys_waiters.pop(seq, None)

    @staticmethod
    def _property_value(prop: int, cmd: int, body: bytes) -> bytes:
        if cmd != Cmd.PROP_VALUE_IS or len(body) < 4:
            raise CpcProtocolError(f"unexpected reply to property {prop:#x}: cmd {cmd:#x} {body.hex()}")
        got = int.from_bytes(body[:4], "little")
        value = body[4:]
        if got == prop:
            return value
        if got == Prop.LAST_STATUS:
            # Failed get/set answers PROP_LAST_STATUS (src/sl_cpc_system_secondary.c:817-826).
            raise CpcPropertyError(prop, int.from_bytes(value, "little") if len(value) == 4 else None)
        raise CpcProtocolError(f"asked for property {prop:#x}, got {got:#x}")

    async def get_property(self, prop: int, *, uframe: bool = False,
                           timeout: float | None = None) -> bytes:
        cmd, body = await self.system_command(Cmd.PROP_VALUE_GET, struct.pack("<I", prop),
                                              uframe=uframe, timeout=timeout)
        return self._property_value(prop, cmd, body)

    async def set_property(self, prop: int, value: bytes, *, uframe: bool = False,
                           timeout: float | None = None) -> bytes:
        cmd, body = await self.system_command(Cmd.PROP_VALUE_SET,
                                              struct.pack("<I", prop) + bytes(value),
                                              uframe=uframe, timeout=timeout)
        return self._property_value(prop, cmd, body)

    async def noop(self, timeout: float | None = None) -> None:
        """NOOP must be an I-frame: the secondary rejects it as a U-frame
        (src/sl_cpc_system_secondary.c:1454-1456, 1460-1462)."""
        cmd, _ = await self.system_command(Cmd.NOOP, uframe=False, timeout=timeout)
        if cmd != Cmd.NOOP:
            raise CpcProtocolError(f"unexpected reply to NOOP: {cmd:#x}")

    async def get_security_state(self) -> int:
        """PROP_SECURITY_STATE (I-frame only). Raises CpcPropertyError(UNIMPLEMENTED) when the
        firmware has no CPC security component (src/sl_cpc_system_secondary.c:686-703)."""
        return _u32(await self.get_property(Prop.SECURITY_STATE), "security state")

    async def get_endpoint_state(self, ep_id: int) -> int:
        value = await self.get_property(prop_endpoint_state(ep_id))
        if len(value) != 1:
            raise CpcProtocolError(f"endpoint state reply has {len(value)} bytes, expected 1")
        return value[0]

    # -- endpoints -----------------------------------------------------------------------------

    async def connect_endpoint(self, ep_id: int, *, timeout: float = 10.0,
                               retry_interval: float = 0.25) -> Endpoint:
        """Connect to an endpoint the secondary has open.

        Sends PROP_VALUE_SET PROP_ENDPOINT_STATE_<id> = CONNECTED (1 byte) as an I-frame
        (sl_cpc.c:3014-3022). The secondary answers CONNECTED only if the endpoint is OPEN or
        CONNECTING, otherwise CLOSED (sl_cpc.c:1698-1720), and marks it connected once its
        reply is acknowledged (src/sl_cpc_system_secondary.c:321-327). A refusal is retried
        until timeout because an application may open its endpoint after CPC starts.
        """
        if not 1 <= ep_id <= 255:
            raise ValueError("endpoint id must be 1..255 (0 is the system endpoint)")
        existing = self._endpoints.get(ep_id)
        if existing is not None and existing.connected:
            return existing
        loop = asyncio.get_running_loop()
        deadline = loop.time() + timeout
        ep = Endpoint(self, ep_id)
        self._endpoints[ep_id] = ep
        event = self._ep_open_events.setdefault(ep_id, asyncio.Event())
        last_state: int | None = None
        try:
            while True:
                event.clear()
                remaining = deadline - loop.time()
                if remaining <= 0:
                    break
                value = await self.set_property(prop_endpoint_state(ep_id),
                                                bytes([EpState.CONNECTED]), timeout=remaining)
                if len(value) != 1:      # sl_cpc.c:2790-2795
                    raise CpcProtocolError(f"connect reply for endpoint {ep_id} has {len(value)} bytes")
                last_state = value[0]
                if last_state == EpState.CONNECTED:
                    ep.connected = True
                    return ep
                remaining = deadline - loop.time()
                if remaining <= 0:
                    break
                try:
                    async with asyncio.timeout(min(retry_interval, remaining)):
                        await event.wait()        # opening notification, sl_cpc.c:1245-1246
                except TimeoutError:
                    pass
        except BaseException:
            if self._endpoints.get(ep_id) is ep:
                del self._endpoints[ep_id]
            raise
        if self._endpoints.get(ep_id) is ep:
            del self._endpoints[ep_id]
        state = "no reply" if last_state is None else _name(EpState, last_state)
        raise CpcEndpointError(
            f"secondary refused endpoint {ep_id} (last reply: {state}). The endpoint is not "
            f"open on the secondary: the firmware does not provide it, it has not started yet, "
            f"or it is still connected from an earlier session (start with reset=True)")

    # -- link layer ----------------------------------------------------------------------------

    def _check_alive(self) -> None:
        if self._dead is not None:
            raise self._dead

    def _transmit(self, address: int, control: int, payload: bytes = b"") -> None:
        self._check_alive()
        frame = encode_frame(address, control, payload)
        if _LOG.isEnabledFor(logging.DEBUG):
            _LOG.debug("TX %s %s", Frame(address, control, payload).describe(), frame.hex())
        self.stats.tx_frames += 1
        self._writer.write(frame)

    def _send_rr(self, ep: Endpoint) -> None:
        self._transmit(ep.id, control_s(ep.ack, S_RR))            # sl_cpc.c:4242-4265

    def _send_reject(self, address: int, ack: int, reason: Reject) -> None:
        ep = self._endpoints.get(address)
        if ep is not None:
            ep.stats.rejects_sent += 1
        self._transmit(address, control_s(ack, S_REJ), bytes([reason]))   # sl_cpc.c:4373-4400

    async def _send_iframe(self, ep: Endpoint, payload: bytes, poll_final: bool = False) -> None:
        async with ep._tx_lock:
            self._check_alive()
            if ep.error is not None:
                raise ep.error
            pending = _PendingTx(ep.seq, payload, poll_final)
            ep.seq = (ep.seq + 1) & 7                              # sl_cpc.c:3468-3471
            ep._pending = pending
            rto = self.initial_rto
            retransmits = 0
            try:
                while True:
                    pending.wake.clear()
                    # The ack field always carries the latest ack, also on a retransmission
                    # (sl_cpc.c:4504-4508).
                    self._transmit(ep.id, control_i(pending.seq, ep.ack, poll_final), payload)
                    if retransmits == 0:
                        ep.stats.tx_iframes += 1
                    try:
                        async with asyncio.timeout(rto):
                            await pending.wake.wait()
                    except TimeoutError:
                        if retransmits >= self.max_retransmits:     # sl_cpc.c:4978-4986
                            exc = CpcTimeoutError(
                                f"endpoint {ep.id}: frame seq {pending.seq} not acknowledged after "
                                f"{retransmits} retransmissions")
                            ep._fail(exc)
                            raise exc from None
                        _LOG.warning("endpoint %d: frame seq %d not acknowledged within %.0f ms, "
                                     "resending", ep.id, pending.seq, rto * 1000)
                        rto = min(rto * 2, self.max_rto)            # sl_cpc.c:4989-4993
                        retransmits += 1
                        ep.stats.retransmits += 1
                        continue
                    if pending.error is not None:
                        raise pending.error
                    if pending.acked:
                        return
                    # Woken without ack or error: checksum reject, retransmit now
                    # (sl_cpc.c:4064-4067).
                    if retransmits >= self.max_retransmits:
                        exc = CpcTimeoutError(f"endpoint {ep.id}: frame seq {pending.seq} rejected "
                                              f"{retransmits + 1} times")
                        ep._fail(exc)
                        raise exc
                    retransmits += 1
                    ep.stats.retransmits += 1
            finally:
                ep._pending = None

    async def _wait_any(self, timeout: float, *items: asyncio.Future[Any] | asyncio.Event
                        ) -> set[Any]:
        """Wait until any future is done or event set; return the set of those that are."""
        waits: dict[asyncio.Future[Any], Any] = {}
        for item in items:
            if isinstance(item, asyncio.Event):
                waits[asyncio.ensure_future(item.wait())] = item
            else:
                waits[asyncio.ensure_future(asyncio.shield(item))] = item
        try:
            await asyncio.wait(waits, timeout=timeout, return_when=asyncio.FIRST_COMPLETED)
        finally:
            for w in waits:
                w.cancel()
        return {item for item in items
                if (item.is_set() if isinstance(item, asyncio.Event) else item.done())}

    async def _read_loop(self) -> None:
        try:
            while True:
                data = await self._reader.read(4096)
                if not data:
                    self._fatal(CpcConnectionLost("transport closed (end of stream)"))
                    return
                skipped = self.decoder.discarded_bytes
                frames = self.decoder.feed(data)
                if self.decoder.discarded_bytes > skipped and self._started:
                    _LOG.warning("skipped %d bytes that were not a valid frame",
                                 self.decoder.discarded_bytes - skipped)
                for frame in frames:
                    try:
                        self._on_frame(frame)
                    except CpcError as exc:
                        if self._dead is not None:
                            return
                        _LOG.warning("error handling %s: %s", frame.describe(), exc)
        except asyncio.CancelledError:
            raise
        except Exception as exc:    # noqa: BLE001 - surface any transport failure to waiters
            self._fatal(CpcConnectionLost(f"transport failed: {exc!r}"))

    def _fatal(self, exc: CpcError) -> None:
        if self._dead is None:
            self._dead = exc
        for fut in self._sys_waiters.values():
            if not fut.done():
                fut.set_exception(exc)
        for ep in self._endpoints.values():
            ep._fail(exc)
        self._ua_event.set()
        self._reset_reason_event.set()
        for ev in self._ep_open_events.values():
            ev.set()

    # -- receive path --------------------------------------------------------------------------

    def _on_frame(self, frame: Frame) -> None:
        self.stats.rx_frames += 1
        if _LOG.isEnabledFor(logging.DEBUG):
            _LOG.debug("RX %s", frame.describe())
        ep = self._endpoints.get(frame.address)
        kind = frame.kind
        if ep is None or (ep.id != EP_SYSTEM and not ep.connected and ep.error is not None):
            self.stats.unknown_endpoint_frames += 1
            if kind != FRAME_S:
                # Data on an endpoint this host has not connected (sl_cpc.c:3545-3548).
                _LOG.info("frame on unconnected endpoint %d, rejecting", frame.address)
                self._send_reject(frame.address, 0, Reject.UNREACHABLE_ENDPOINT)
            return
        if kind in (FRAME_I, FRAME_S):
            self._on_ack(ep, frame.ack)                           # sl_cpc.c:3584-3592
        if kind == FRAME_I:
            self._on_iframe(ep, frame)
        elif kind == FRAME_S:
            self._on_sframe(ep, frame)
        else:
            self._on_uframe(ep, frame)

    def _on_ack(self, ep: Endpoint, ack: int) -> None:
        p = ep._pending
        if p is not None and not p.acked and p.error is None and ack == (p.seq + 1) & 7:
            p.acked = True
            p.wake.set()

    def _on_iframe(self, ep: Endpoint, frame: Frame) -> None:
        if not frame.fcs_ok:
            _LOG.warning("endpoint %d: checksum error in frame seq %d, rejecting", ep.id, frame.seq)
            self._send_reject(ep.id, ep.ack, Reject.CHECKSUM_MISMATCH)    # sl_cpc.c:3650-3651
            return
        if frame.seq == ep.ack:
            ep.ack = (ep.ack + 1) & 7                                     # sl_cpc.c:3999-4000
            ep.stats.rx_iframes += 1
            self._send_rr(ep)                                             # sl_cpc.c:4003
            if not frame.payload:
                return
            if ep.id == EP_SYSTEM:
                if frame.poll_final:
                    self._on_system_reply(frame.payload)
                else:
                    self._on_unsolicited(frame.payload)
            else:
                ep._deliver(frame.payload)
        elif frame.seq == (ep.ack - 1) & 7:
            ep.stats.rx_duplicates += 1                                   # sl_cpc.c:3913-3918
            _LOG.warning("endpoint %d: chip resent frame seq %d (our acknowledgement was lost or "
                         "late)", ep.id, frame.seq)
            self._send_rr(ep)
        else:
            _LOG.warning("endpoint %d: frame seq %d out of sequence (expected %d), rejecting",
                         ep.id, frame.seq, ep.ack)
            self._send_reject(ep.id, ep.ack, Reject.SEQUENCE_MISMATCH)   # sl_cpc.c:3906-3910

    def _on_sframe(self, ep: Endpoint, frame: Frame) -> None:
        if frame.s_function != S_REJ:
            return                                                       # RR: ack already handled
        if not frame.fcs_ok or len(frame.payload) != 1:
            _LOG.warning("malformed reject on endpoint %d", ep.id)
            return
        reason = frame.payload[0]
        ep.stats.rejects_received += 1
        p = ep._pending
        _LOG.info("endpoint %d: reject %s", ep.id, _name(Reject, reason))
        if reason == Reject.CHECKSUM_MISMATCH:
            if p is not None and not p.acked:
                p.wake.set()                       # retransmit at once (sl_cpc.c:4064-4067)
        elif reason in (Reject.SEQUENCE_MISMATCH, Reject.OUT_OF_MEMORY):
            pass                                   # the retransmit timer handles it (sl_cpc.c:4061-4074)
        else:
            hint = ""
            if reason == Reject.SECURITY_ISSUE:
                hint = ("CPC security is enabled in the secondary firmware and this host does "
                        "not implement it; build the firmware with cpc_security_secondary_none")
            elif reason == Reject.UNREACHABLE_ENDPOINT:
                hint = "the endpoint is not connected on the secondary"
            exc = CpcRejectError(ep.id, reason, hint)
            if ep.id == EP_SYSTEM:
                self._fatal(exc)
            else:
                ep._fail(exc)                      # sl_cpc.c:4076-4091, 4106-4113

    def _on_uframe(self, ep: Endpoint, frame: Frame) -> None:
        if not frame.fcs_ok:
            return                                 # dropped, no reject for U-frames (sl_cpc.c:3652-3653)
        if ep.id != EP_SYSTEM:
            _LOG.debug("ignoring U-frame on endpoint %d", ep.id)
            return
        t = frame.u_type
        if t == U_ACKNOWLEDGE:
            self._ua_event.set()
        elif t == U_POLL_FINAL:
            self._on_system_reply(frame.payload)
        elif t == U_INFORMATION:
            self._on_unsolicited(frame.payload)
        else:
            _LOG.debug("ignoring U-frame type %#x", t)

    @staticmethod
    def _parse_system(payload: bytes) -> tuple[int, int, bytes]:
        if len(payload) < _SYS_HEADER.size:
            raise CpcProtocolError(f"system frame too short: {payload.hex()}")
        cmd, seq, length = _SYS_HEADER.unpack_from(payload)
        if _SYS_HEADER.size + length != len(payload):
            raise CpcProtocolError(f"system frame length {length} does not match payload {payload.hex()}")
        return cmd, seq, payload[_SYS_HEADER.size:]

    def _on_system_reply(self, payload: bytes) -> None:
        cmd, seq, body = self._parse_system(payload)
        fut = self._sys_waiters.get(seq)              # matched by seq, src/sl_cpc_system_primary.c:408-413
        if fut is None or fut.done():
            _LOG.info("system reply with unknown seq %d (cmd %s)", seq, _name(Cmd, cmd))
            return
        fut.set_result((cmd, body))

    def _on_unsolicited(self, payload: bytes) -> None:
        cmd, _seq, body = self._parse_system(payload)
        if cmd != Cmd.PROP_VALUE_IS or len(body) < 4:
            _LOG.info("ignoring unsolicited system frame %s", payload.hex())
            return
        prop = int.from_bytes(body[:4], "little")
        value = body[4:]
        if prop == Prop.LAST_STATUS and len(value) == 4:
            status = int.from_bytes(value, "little")
            if not Status.RESET_POWER_ON <= status <= Status.RESET_WATCHDOG:
                _LOG.info("unsolicited last status %s", _name(Status, status))
                return
            self.last_reset_reason = status
            if self._expect_reset:
                self._reset_reason_event.set()
            elif self._started:
                # src/sl_cpc_reboot_sequence.c:669-673: a reset outside the reset sequence.
                self._fatal(CpcConnectionLost(f"secondary reset unexpectedly ({_name(Status, status)})"))
            else:
                # Stale boot message from before this host started (src/sl_cpc_reboot_sequence.c:655-658).
                _LOG.info("ignoring reset reason %s received before start", _name(Status, status))
        elif Prop.ENDPOINT_STATE_0 <= prop <= Prop.ENDPOINT_STATE_0 + 0xFF and len(value) == 1:
            # Notifications from src/sl_cpc_system_secondary.c:341-403.
            ep_id = prop & 0xFF
            state = value[0]
            _LOG.info("secondary endpoint %d is now %s", ep_id, _name(EpState, state))
            if state == EpState.OPEN:
                ev = self._ep_open_events.get(ep_id)
                if ev is not None:
                    ev.set()
            elif state in (EpState.CLOSED, EpState.DISCONNECTED):
                ep = self._endpoints.get(ep_id)
                if ep is not None and ep.id != EP_SYSTEM:
                    ep._fail(CpcEndpointError(f"secondary closed endpoint {ep_id} ({_name(EpState, state)})"))
        else:
            _LOG.info("ignoring unsolicited property %#x = %s", prop, value.hex())


# --------------------------------------------------------------------------------------------
# Serial transport (pyserial). Not exercised against hardware by the tests.
# --------------------------------------------------------------------------------------------

class SerialWriter:
    """Minimal writer over an open pyserial object; write() is synchronous (small frames)."""

    def __init__(self, ser: Any, loop: asyncio.AbstractEventLoop, fd: int) -> None:
        self._ser = ser
        self._loop = loop
        self._fd = fd
        self._closed = False

    def write(self, data: bytes) -> None:
        if self._closed:
            raise CpcConnectionLost("serial port closed")
        t0 = time.monotonic()
        self._ser.write(data)          # blocking: the whole event loop waits for it
        took = time.monotonic() - t0
        if took > 0.05:
            _LOG.warning("serial write of %d bytes blocked for %.0f ms", len(data), took * 1000)

    async def drain(self) -> None:
        return None

    def close(self) -> None:
        if self._closed:
            return
        self._closed = True
        try:
            self._loop.remove_reader(self._fd)
        finally:
            self._ser.close()


def serial_streams(ser: Any) -> tuple[asyncio.StreamReader, SerialWriter]:
    """Wrap an already open, non-blocking pyserial port (timeout=0) as an asyncio pair.

    POSIX only: the file descriptor is watched with loop.add_reader().
    """
    loop = asyncio.get_running_loop()
    reader = asyncio.StreamReader(limit=1 << 16)
    fd = ser.fileno()

    def on_readable() -> None:
        try:
            data = ser.read(max(1, ser.in_waiting))
        except Exception as exc:    # noqa: BLE001 - e.g. the USB device was unplugged
            loop.remove_reader(fd)
            reader.set_exception(CpcConnectionLost(f"serial read failed: {exc}"))
            return
        if data:
            reader.feed_data(data)

    loop.add_reader(fd, on_readable)
    return reader, SerialWriter(ser, loop, fd)


async def open_serial(port: str, baudrate: int = 460800) -> tuple[asyncio.StreamReader, SerialWriter]:
    """Open a UART at 8N1 without any flow control and return (reader, writer)."""
    import serial  # pyserial; imported here so the rest of the module works without it

    ser = serial.Serial(port=port, baudrate=baudrate, bytesize=serial.EIGHTBITS,
                        parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE, timeout=0,
                        write_timeout=2, xonxoff=False, rtscts=False, dsrdtr=False,
                        exclusive=True)
    ser.reset_input_buffer()
    return serial_streams(ser)
