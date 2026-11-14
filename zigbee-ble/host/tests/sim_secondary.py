"""A simulated CPC secondary for the tests.

Modelled on the chip-side C code of Simplicity SDK 2025.6.3 (platform/service/cpc/src:
sl_cpc.c decode_packet / receive_iframe / receive_sframe / receive_uframe / receive_ack,
sl_cpc_system_secondary.c sli_cpc_system_secondary_on_poll). It deliberately shares no code
with cpc.py: its own bitwise CRC, frame builder, byte parser and constants, so that a mistake
in cpc.py's codec is not mirrored here.

Anything the real secondary would SLI_CPC_ASSERT on is recorded in `errors`; tests assert that
list is empty.
"""

from __future__ import annotations

import asyncio
import collections
import struct
from dataclasses import dataclass, replace
from typing import Any, Callable

# Endpoint states (inc/sl_cpc.h:92-106)
ST_FREED, ST_OPEN, ST_CLOSED, ST_CONNECTING, ST_CONNECTED, ST_ERROR_UNREACHABLE = 0, 1, 2, 4, 5, 10

# Reject reasons (inc/sli_cpc.h:373-379)
REJ_CHECKSUM, REJ_SEQUENCE, REJ_OOM, REJ_SECURITY, REJ_UNREACHABLE, REJ_ERROR = 1, 2, 3, 4, 5, 6


def crc_xmodem(data: bytes) -> int:
    """Bitwise CRC-16/XMODEM (independent of cpc.py's table version)."""
    crc = 0
    for b in data:
        crc ^= b << 8
        for _ in range(8):
            crc = ((crc << 1) ^ 0x1021) & 0xFFFF if crc & 0x8000 else (crc << 1) & 0xFFFF
    return crc


def build_frame(addr: int, control: int, payload: bytes = b"") -> bytes:
    length = len(payload) + 2 if payload else 0
    hdr = struct.pack("<BBHB", 0x14, addr, length, control)
    out = hdr + struct.pack("<H", crc_xmodem(hdr))
    if payload:
        out += payload + struct.pack("<H", crc_xmodem(payload))
    return out


@dataclass(frozen=True)
class HostFrame:
    addr: int
    control: int
    payload: bytes
    fcs_ok: bool

    @property
    def ftype(self) -> str:
        top = self.control >> 6
        return "I" if top in (0, 1) else ("S" if top == 2 else "U")

    @property
    def seq(self) -> int:
        return (self.control >> 4) & 7

    @property
    def ack(self) -> int:
        return self.control & 7

    @property
    def pf(self) -> bool:
        return bool(self.control & 0x08)


@dataclass
class _Tx:
    payload: bytes
    pf: bool
    on_acked: Callable[[], None] | None = None
    seq: int = 0
    tries: int = 0
    rto: float = 0.0
    timer: asyncio.TimerHandle | None = None


class SimEp:
    def __init__(self, ep_id: int, state: int) -> None:
        self.id = ep_id
        self.state = state
        self.seq = 0
        self.ack = 0
        self.txq: collections.deque[_Tx] = collections.deque()
        self.unacked: _Tx | None = None
        self.rx: list[bytes] = []

    def reset(self, state: int) -> None:
        if self.unacked is not None and self.unacked.timer is not None:
            self.unacked.timer.cancel()
        self.__init__(self.id, state)


App = Callable[["SimSecondary", int, bytes], None]


class SimSecondary:
    def __init__(self, *, endpoints: tuple[int, ...] = (5, 14), closed_endpoints: tuple[int, ...] = (),
                 rx_capability: int = 256, capabilities: int = 0, app_version: str = "sim-app 1.0",
                 cpc_version: tuple[int, int, int] = (4, 7, 1), protocol_version: int = 6,
                 security_state: int | None = None, security_rejects: bool = False,
                 reset_reason: int = 114, boot_delay: float = 0.02, rto: float = 0.05,
                 max_retx: int = 10, boot_garbage: bytes = b"\x00\xff\x14\x13\x37",
                 apps: dict[int, App] | None = None) -> None:
        self.rx_capability = rx_capability
        self.capabilities = capabilities
        self.app_version = app_version
        self.cpc_version = cpc_version
        self.protocol_version = protocol_version
        self.security_state = security_state       # None: component not built in
        self.security_rejects = security_rejects   # INITIALIZING: user-endpoint I-frames rejected
        self.reset_reason = reset_reason
        self.boot_delay = boot_delay
        self.rto = rto
        self.max_retx = max_retx
        self.boot_garbage = boot_garbage
        self.apps: dict[int, App] = dict(apps or {})

        self.eps: dict[int, SimEp] = {0: SimEp(0, ST_CONNECTED)}
        for e in endpoints:
            self.eps[e] = SimEp(e, ST_OPEN)
        for e in closed_endpoints:
            self.eps[e] = SimEp(e, ST_CLOSED)
        self._initial_states = {e: ep.state for e, ep in self.eps.items()}
        self.reset_sequence_done = False
        self.reboot_mode = 0
        self.primary_version: bytes | None = None

        # logs
        self.rx_log: list[HostFrame] = []
        self.tx_log: list[tuple[int, int, bytes]] = []
        self.dropped_rx: list[HostFrame] = []
        self.dropped_tx: list[tuple[int, int, bytes]] = []
        self.commands: list[tuple[str, int, int | None]] = []
        self.errors: list[str] = []
        self.rejects_sent: list[tuple[int, int]] = []
        self.retransmits = 0
        self.duplicates = 0
        self.bad_headers = 0
        self.reboots = 0

        # fault injection: [predicate, remaining]
        self._drop_rx: list[list[Any]] = []
        self._drop_tx: list[list[Any]] = []
        self._corrupt_rx: list[list[Any]] = []
        self._corrupt_tx: list[list[Any]] = []

        self._buf = bytearray()
        self._writer: Any = None
        self._task: asyncio.Task[None] | None = None
        self._booting = False

    # -- plumbing ------------------------------------------------------------------------------

    def start(self, reader: asyncio.StreamReader, writer: Any) -> None:
        self._writer = writer
        self._task = asyncio.get_running_loop().create_task(self._run(reader))

    async def stop(self) -> None:
        for ep in self.eps.values():
            ep.reset(ep.state)
        for app in self.apps.values():
            if hasattr(app, "on_reboot"):
                app.on_reboot()
        if self._task is not None:
            self._task.cancel()
            try:
                await self._task
            except asyncio.CancelledError:
                pass

    async def _run(self, reader: asyncio.StreamReader) -> None:
        while True:
            data = await reader.read(4096)
            if not data:
                return
            if self._booting:
                continue
            self._buf += data
            self._parse()

    def drop_from_host(self, pred: Callable[[HostFrame], bool], count: int = 1) -> None:
        self._drop_rx.append([pred, count])

    def drop_to_host(self, pred: Callable[[int, int, bytes], bool], count: int = 1) -> None:
        self._drop_tx.append([pred, count])

    def corrupt_from_host(self, pred: Callable[[HostFrame], bool], count: int = 1) -> None:
        self._corrupt_rx.append([pred, count])

    def corrupt_to_host(self, pred: Callable[[int, int, bytes], bool], count: int = 1) -> None:
        self._corrupt_tx.append([pred, count])

    @staticmethod
    def _match(rules: list[list[Any]], *args: Any) -> bool:
        for rule in rules:
            if rule[1] > 0 and rule[0](*args):
                rule[1] -= 1
                return True
        return False

    def send_raw(self, data: bytes) -> None:
        self._writer.write(data)

    def _send(self, addr: int, control: int, payload: bytes = b"") -> None:
        if self._match(self._drop_tx, addr, control, payload):
            self.dropped_tx.append((addr, control, payload))
            return
        self.tx_log.append((addr, control, payload))
        raw = build_frame(addr, control, payload)
        if payload and self._match(self._corrupt_tx, addr, control, payload):
            raw = raw[:7] + bytes([raw[7] ^ 0xFF]) + raw[8:]
        self._writer.write(raw)

    # -- receive path (sl_cpc.c decode_packet) ---------------------------------------------------

    def _parse(self) -> None:
        buf = self._buf
        while True:
            i = buf.find(b"\x14")
            if i < 0:
                buf.clear()
                return
            del buf[:i]
            if len(buf) < 7:
                return
            if crc_xmodem(bytes(buf[:5])) != int.from_bytes(buf[5:7], "little"):
                self.bad_headers += 1
                del buf[:1]
                continue
            length = int.from_bytes(buf[2:4], "little")
            if length > self.rx_capability + 2:
                self.errors.append(f"host sent a {length - 2}-byte payload, RX capability is {self.rx_capability}")
                del buf[:1]
                continue
            if len(buf) < 7 + length:
                return
            raw = bytes(buf[:7 + length])
            del buf[:7 + length]
            if 0 < length <= 2:
                addr = raw[1]
                self._reject(addr, self.eps[addr].ack if addr in self.eps else 0, REJ_ERROR)
                continue
            payload = raw[7:-2] if length else b""
            ok = (not length) or crc_xmodem(payload) == int.from_bytes(raw[-2:], "little")
            self._on_frame(HostFrame(raw[1], raw[4], payload, ok))

    def _on_frame(self, f: HostFrame) -> None:
        if self._match(self._drop_rx, f):
            self.dropped_rx.append(f)
            return
        if f.payload and self._match(self._corrupt_rx, f):
            f = replace(f, fcs_ok=False)
        self.rx_log.append(f)
        ep = self.eps.get(f.addr)
        if ep is None or ep.state in (ST_FREED,):
            if f.ftype != "S":
                self._reject(f.addr, 0, REJ_UNREACHABLE)          # sl_cpc.c:3545-3548
            return
        if ep.state == ST_CONNECTING and f.ftype == "I":
            self._mark_connected(ep)                                 # sl_cpc.c:3562-3564
        if ep.state != ST_CONNECTED:
            self._reject(f.addr, 0, REJ_UNREACHABLE)                 # sl_cpc.c:3567-3579
            return
        if f.ftype in ("I", "S"):
            self._receive_ack(ep, f.ack)
        if f.payload and not f.fcs_ok:
            if f.ftype == "I":
                self._reject(ep.id, ep.ack, REJ_CHECKSUM)            # sl_cpc.c:3650-3651
            return
        if f.ftype == "I":
            self._receive_iframe(ep, f)
        elif f.ftype == "S":
            self._receive_sframe(ep, f)
        else:
            self._receive_uframe(ep, f)

    def _receive_ack(self, ep: SimEp, ack: int) -> None:
        u = ep.unacked
        if u is None or ack != (u.seq + 1) % 8:
            return
        if u.timer is not None:
            u.timer.cancel()
        ep.unacked = None
        if u.on_acked is not None:
            u.on_acked()
        self._pump(ep)

    def _receive_iframe(self, ep: SimEp, f: HostFrame) -> None:
        dup = f.seq == (ep.ack - 1) % 8
        if f.seq != ep.ack and not dup:
            self._reject(ep.id, ep.ack, REJ_SEQUENCE)              # sl_cpc.c:3906-3910
            return
        if dup:
            self.duplicates += 1
            self._rr(ep)                                             # sl_cpc.c:3913-3918
            return
        reply = None
        if f.pf:
            if ep.id != 0:
                self._reject(ep.id, ep.ack, REJ_ERROR)               # sl_cpc.c:3923-3930
                return
            reply = self._on_poll("I", f.payload)
        else:
            if self.security_rejects and ep.id not in (0, 1):
                self._reject(ep.id, ep.ack, REJ_SECURITY)            # sl_cpc.c:3826-3846
                return
            if ep.id != 0:
                ep.rx.append(f.payload)
        ep.ack = (ep.ack + 1) % 8
        self._rr(ep)
        if reply is not None:
            data, on_acked = reply
            self._write_iframe(ep, data, pf=True, on_acked=on_acked)
        elif not f.pf and ep.id != 0 and ep.id in self.apps:
            self.apps[ep.id](self, ep.id, f.payload)

    def _receive_sframe(self, ep: SimEp, f: HostFrame) -> None:
        fn = (f.control >> 4) & 3
        if fn == 0:
            return
        if fn != 1 or len(f.payload) != 1:
            self.errors.append(f"bad S-frame from host {f}")
            return
        reason = f.payload[0]
        if reason == REJ_CHECKSUM and ep.unacked is not None:
            self._retransmit(ep)                                     # sl_cpc.c:4064-4067
        elif reason in (REJ_SEQUENCE, REJ_OOM):
            pass
        else:
            ep.state = ST_ERROR_UNREACHABLE

    def _receive_uframe(self, ep: SimEp, f: HostFrame) -> None:
        if ep.id != 0:
            return                                     # U-frames enabled on the system ep only
        utype = f.control & 0x37                        # SDK mask, inc/sli_cpc_hdlc.h:63
        if utype == 0x00:
            return
        if utype == 0x04:
            reply = self._on_poll("U", f.payload)
            if reply is None:
                return
            data, after = reply
            self._send(0, 0xC4, data)
            if after is not None:
                after()                                 # U-frame "write complete" = sent
        elif utype == 0x31:
            ep.seq = 0
            ep.ack = 0                                  # sl_cpc.c:4219-4223
            self._send(0, 0xCE)
        else:
            self.errors.append(f"unknown U-frame control {f.control:#x}")

    # -- transmit path ---------------------------------------------------------------------------

    def _rr(self, ep: SimEp) -> None:
        self._send(ep.id, 0x80 | ep.ack)

    def _reject(self, addr: int, ack: int, reason: int) -> None:
        self.rejects_sent.append((addr, reason))
        self._send(addr, 0x90 | (ack & 7), bytes([reason]))

    def send_data(self, ep_id: int, payload: bytes) -> None:
        """Application write on a user endpoint (I-frame)."""
        ep = self.eps[ep_id]
        if ep.state != ST_CONNECTED:
            self.errors.append(f"app wrote on endpoint {ep_id} in state {ep.state}")
            return
        self._write_iframe(ep, payload)

    def send_iframe_raw(self, ep_id: int, seq: int, payload: bytes) -> None:
        """Inject an I-frame with an arbitrary seq (for sequence-mismatch tests)."""
        ep = self.eps[ep_id]
        self._send(ep_id, ((seq & 7) << 4) | ep.ack, payload)

    def _write_iframe(self, ep: SimEp, payload: bytes, pf: bool = False,
                      on_acked: Callable[[], None] | None = None) -> None:
        ep.txq.append(_Tx(payload, pf, on_acked))
        self._pump(ep)

    def _pump(self, ep: SimEp) -> None:
        if ep.unacked is not None or not ep.txq:
            return
        tx = ep.txq.popleft()
        tx.seq = ep.seq
        ep.seq = (ep.seq + 1) % 8
        tx.rto = self.rto
        ep.unacked = tx
        self._transmit(ep, tx)

    def _transmit(self, ep: SimEp, tx: _Tx) -> None:
        control = (tx.seq << 4) | (0x08 if tx.pf else 0) | ep.ack     # ack refreshed each time
        self._send(ep.id, control, tx.payload)
        tx.timer = asyncio.get_running_loop().call_later(tx.rto, self._on_timeout, ep, tx)

    def _retransmit(self, ep: SimEp) -> None:
        tx = ep.unacked
        assert tx is not None
        if tx.timer is not None:
            tx.timer.cancel()
        self.retransmits += 1
        self._transmit(ep, tx)

    def _on_timeout(self, ep: SimEp, tx: _Tx) -> None:
        if ep.unacked is not tx:
            return
        tx.tries += 1
        if tx.tries > self.max_retx:
            ep.state = ST_ERROR_UNREACHABLE
            ep.unacked = None
            return
        tx.rto = min(tx.rto * 2, 5.0)
        self._retransmit(ep)

    # -- system endpoint (sl_cpc_system_secondary.c) ---------------------------------------------

    def _on_poll(self, kind: str, payload: bytes) -> tuple[bytes, Callable[[], None] | None] | None:
        if len(payload) < 4:
            if kind == "U":
                self.errors.append("U-frame poll shorter than a command header (SDK asserts)")
            return None
        cmd, seq, length = struct.unpack_from("<BBH", payload)
        if 4 + length != len(payload):
            self.errors.append(f"system command length {length} != payload {len(payload) - 4} (SDK asserts)")
            return None
        body = payload[4:]
        prop = int.from_bytes(body[:4], "little") if cmd in (2, 3) and len(body) >= 4 else None
        self.commands.append((kind, cmd, prop))
        after: Callable[[], None] | None = None
        if kind == "U":
            if cmd == 0x01:                                              # RESET
                reply_cmd, reply = 0x01, struct.pack("<I", 0)
                after = self._schedule_reboot
            elif cmd == 0x02 and prop in (0x20, 0x02, 0x40, 0x50, 0x01, 0x200, 0x03, 0x04):
                reply_cmd, reply = 0x06, self._prop_get(prop)
            elif cmd == 0x03 and prop in (0x202, 0x21, 0x60):
                reply_cmd, (reply, after) = 0x06, self._prop_set(prop, body[4:])
            else:
                self.errors.append(f"U-frame command {cmd:#x} prop {prop} is not accepted as a "
                                   f"U-frame (sl_cpc_system_secondary.c:1416-1457, SDK asserts)")
                return None
        else:
            if cmd == 0x00:
                reply_cmd, reply = 0x00, b""
            elif cmd == 0x02 and prop is not None:
                reply_cmd, reply = 0x06, self._prop_get(prop)
            elif cmd == 0x03 and prop is not None:
                reply_cmd, (reply, after) = 0x06, self._prop_set(prop, body[4:])
            else:
                self.errors.append(f"I-frame command {cmd:#x} not supported (SDK asserts)")
                return None
        return struct.pack("<BBH", reply_cmd, seq, len(reply)) + reply, after

    @staticmethod
    def _p(prop: int, value: bytes = b"") -> bytes:
        return struct.pack("<I", prop) + value

    def _prop_get(self, prop: int) -> bytes:
        if prop == 0x00:
            return self._p(0, struct.pack("<I", 0))
        if prop == 0x01:
            return self._p(1, bytes([self.protocol_version]))
        if prop == 0x02:
            return self._p(2, struct.pack("<I", self.capabilities))
        if prop == 0x03:
            return self._p(3, struct.pack("<III", *self.cpc_version))
        if prop == 0x04:
            self.reset_sequence_done = True                                 # :1213-1216
            return self._p(4, self.app_version.encode() + b"\0")
        if prop == 0x20:
            return self._p(0x20, struct.pack("<H", self.rx_capability))
        if prop in (0x40, 0x50):
            return self._p(prop, struct.pack("<I", 460800))
        if prop == 0x200:
            return self._p(0x200, struct.pack("<III", 2, 0x00020000, 0))
        if prop == 0x202:
            return self._p(0x202, struct.pack("<I", self.reboot_mode))
        if prop == 0x301:
            if self.security_state is None:
                return self._p(0, struct.pack("<I", 2))                     # UNIMPLEMENTED
            return self._p(0x301, struct.pack("<I", self.security_state))
        if 0x1000 <= prop <= 0x10FF:
            ep = self.eps.get(prop & 0xFF)
            return self._p(prop, bytes([ep.state if ep else ST_FREED]))
        return self._p(0, struct.pack("<I", 13))                            # PROP_NOT_FOUND

    def _prop_set(self, prop: int, value: bytes) -> tuple[bytes, Callable[[], None] | None]:
        if 0x1000 <= prop <= 0x10FF:
            ep_id = prop & 0xFF
            if len(value) < 1:
                self.errors.append("endpoint state set without a value")
                return self._p(0), None
            if len(value) != 1:
                self.errors.append(f"endpoint state value is {len(value)} bytes, the SDK reads 1")
            state = value[0]
            ep = self.eps.get(ep_id)
            if state == ST_CONNECTED:
                if ep is not None and ep.state in (ST_OPEN, ST_CONNECTING):   # sl_cpc.c:1709-1716
                    ep.state = ST_CONNECTING
                    return self._p(prop, bytes([ST_CONNECTED])), lambda: self._mark_connected(ep)
                return self._p(prop, bytes([ST_CLOSED])), None
            if state in (ST_CLOSED, 3):
                if ep is not None and ep.id != 0:
                    ep.reset(ST_OPEN)
                return self._p(prop, bytes([ST_CLOSED])), None
            self.errors.append(f"unsupported endpoint state {state} (SDK asserts)")
            return self._p(0), None
        if prop == 0x60:
            self.primary_version = bytes(value)
            return self._p(0x60), None
        if prop == 0x202:
            mode = int.from_bytes(value[:4], "little")
            self.reboot_mode = 0
            if mode not in (0, 1):
                return self._p(0, struct.pack("<I", 3)), None
            return self._p(0x202, struct.pack("<I", 0)), None
        if prop == 0x21:
            return self._p(0x21, value[:2]), None
        if prop in (0x00, 0x01, 0x02, 0x03, 0x04, 0x200, 0x301, 0x1100):
            return self._p(0, struct.pack("<I", 21)), None                  # INVALID_COMMAND_FOR_PROP
        return self._p(0, struct.pack("<I", 13)), None

    def _mark_connected(self, ep: SimEp) -> None:
        if ep.state == ST_CONNECTING:
            ep.state = ST_CONNECTED

    # -- life cycle events -----------------------------------------------------------------------

    def _schedule_reboot(self) -> None:
        self._booting = True
        asyncio.get_running_loop().call_later(self.boot_delay, self._reboot)

    def _reboot(self) -> None:
        self.reboots += 1
        self._buf.clear()
        for e, ep in self.eps.items():
            ep.reset(self._initial_states[e])
        self.reset_sequence_done = False
        for app in self.apps.values():
            if hasattr(app, "on_reboot"):
                app.on_reboot()
        self._booting = False
        if self.boot_garbage:
            self.send_raw(self.boot_garbage)
        self.send_reset_reason(self.reset_reason)

    def send_reset_reason(self, reason: int) -> None:
        """Unsolicited PROP_VALUE_IS LAST_STATUS as a U-frame information (:409-444)."""
        body = struct.pack("<II", 0, reason)
        self._send(0, 0xC0, struct.pack("<BBH", 0x06, 0, len(body)) + body)

    def open_endpoint(self, ep_id: int) -> None:
        """An application opens (listens on) an endpoint late (sl_cpc.c:1245-1262)."""
        ep = self.eps.setdefault(ep_id, SimEp(ep_id, ST_OPEN))
        ep.reset(ST_OPEN)
        if self.reset_sequence_done:
            body = struct.pack("<IB", 0x1000 | ep_id, ST_OPEN)
            self._write_iframe(self.eps[0], struct.pack("<BBH", 0x06, 0, len(body)) + body)


# ------------------------------------------------------------------------------------------------
# Fake applications
# ------------------------------------------------------------------------------------------------

class EchoApp:
    def __init__(self) -> None:
        self.received: list[bytes] = []

    def __call__(self, sim: SimSecondary, ep_id: int, data: bytes) -> None:
        self.received.append(data)
        sim.send_data(ep_id, b"echo:" + data)


class FakeEzsp:
    """Answers EZSP `version` in the frame format it was asked in."""

    def __init__(self, protocol: int = 18, stack_type: int = 2, stack_version: int = 0x8100) -> None:
        self.protocol = protocol
        self.stack_type = stack_type
        self.stack_version = stack_version
        self.log: list[tuple[Any, ...]] = []

    def __call__(self, sim: SimSecondary, ep_id: int, data: bytes) -> None:
        seq = data[0]
        tail = struct.pack("<BBH", self.protocol, self.stack_type, self.stack_version)
        if len(data) == 4 and data[1] == 0x00 and data[2] == 0x00:
            self.log.append(("legacy", data[3]))
            sim.send_data(ep_id, bytes([seq, 0x80, 0x00]) + tail)
        elif len(data) >= 5 and data[2] & 0x03 == 0x01:
            frame_id = int.from_bytes(data[3:5], "little")
            self.log.append(("extended", frame_id, data[5:]))
            if frame_id == 0 and len(data) == 6:
                sim.send_data(ep_id, bytes([seq, 0x80, 0x01, 0x00, 0x00]) + tail)
            else:
                sim.send_data(ep_id, bytes([seq, 0x80, 0x01, 0x58, 0x00, 0x31]))
        else:
            self.log.append(("bad", data))
            sim.send_data(ep_id, bytes([seq, 0x80, 0x58, 0x31]))


class FakeHci:
    """A tiny LE controller: Reset, Read Local Version, event masks, legacy passive scan."""

    def __init__(self, addresses: int = 5, interval: float = 0.01, split_events: bool = False) -> None:
        self.addresses = [bytes([0xA0 + i, 1, 2, 3, 4, 5]) for i in range(addresses)]
        self.interval = interval
        self.split_events = split_events
        self.commands: list[int] = []
        self.event_mask = 0x00001FFFFFFFFFFF
        self.scan_params: bytes | None = None
        self.reports_sent = 0
        self._buf = bytearray()
        self._timer: asyncio.TimerHandle | None = None
        self._next = 0

    def on_reboot(self) -> None:
        self._stop()

    def _stop(self) -> None:
        if self._timer is not None:
            self._timer.cancel()
            self._timer = None

    def _event(self, sim: SimSecondary, ep_id: int, code: int, params: bytes) -> None:
        pkt = bytes([0x04, code, len(params)]) + params
        if self.split_events and len(pkt) > 3:
            sim.send_data(ep_id, pkt[:2])
            sim.send_data(ep_id, pkt[2:])
        else:
            sim.send_data(ep_id, pkt)

    def _cc(self, sim: SimSecondary, ep_id: int, opcode: int, ret: bytes = b"\x00") -> None:
        self._event(sim, ep_id, 0x0E, bytes([1]) + struct.pack("<H", opcode) + ret)

    def __call__(self, sim: SimSecondary, ep_id: int, data: bytes) -> None:
        self._buf += data
        while len(self._buf) >= 4:
            if self._buf[0] != 0x01:
                sim.errors.append(f"HCI packet type {self._buf[0]:#x} from host")
                self._buf.clear()
                return
            plen = self._buf[3]
            if len(self._buf) < 4 + plen:
                return
            opcode = int.from_bytes(self._buf[1:3], "little")
            params = bytes(self._buf[4:4 + plen])
            del self._buf[:4 + plen]
            self.commands.append(opcode)
            self._command(sim, ep_id, opcode, params)

    def _command(self, sim: SimSecondary, ep_id: int, opcode: int, params: bytes) -> None:
        if opcode == 0x0C03:
            self._stop()
            self.event_mask = 0x00001FFFFFFFFFFF
            self._cc(sim, ep_id, opcode)
        elif opcode == 0x1001:
            self._cc(sim, ep_id, opcode, struct.pack("<BBHBHH", 0, 0x0D, 0x1234, 0x0D, 0x02FF, 0x5678))
        elif opcode == 0x0C01:
            self.event_mask = int.from_bytes(params, "little")
            self._cc(sim, ep_id, opcode)
        elif opcode == 0x2001:
            self._cc(sim, ep_id, opcode)
        elif opcode == 0x200B:
            self.scan_params = params
            self._cc(sim, ep_id, opcode)
        elif opcode == 0x200C:
            self._cc(sim, ep_id, opcode)
            if params[0]:
                self._schedule(sim, ep_id)
            else:
                self._stop()
        else:
            self._cc(sim, ep_id, opcode, b"\x01")

    def _schedule(self, sim: SimSecondary, ep_id: int) -> None:
        self._timer = asyncio.get_running_loop().call_later(self.interval, self._report, sim, ep_id)

    def _report(self, sim: SimSecondary, ep_id: int) -> None:
        self._timer = None
        if self.event_mask >> 61 & 1:          # LE Meta masked out unless the host enabled it
            addr = self.addresses[self._next % len(self.addresses)]
            self._next += 1
            data = b"\x02\x01\x06"
            params = bytes([0x02, 1, 0x00, 0x00]) + addr + bytes([len(data)]) + data + bytes([0xC4])
            self._event(sim, ep_id, 0x3E, params)
            self.reports_sent += 1
        self._schedule(sim, ep_id)


# ------------------------------------------------------------------------------------------------
# In-memory byte pipe
# ------------------------------------------------------------------------------------------------

class MemWriter:
    def __init__(self, target: asyncio.StreamReader) -> None:
        self.target = target
        self.closed = False
        self.written = bytearray()

    def write(self, data: bytes) -> None:
        if self.closed:
            return
        self.written += data
        self.target.feed_data(bytes(data))

    async def drain(self) -> None:
        return None

    def close(self) -> None:
        if not self.closed:
            self.closed = True
            self.target.feed_eof()


def make_link() -> tuple[tuple[asyncio.StreamReader, MemWriter], tuple[asyncio.StreamReader, MemWriter]]:
    """Return ((host_reader, host_writer), (sim_reader, sim_writer))."""
    host_rx = asyncio.StreamReader()
    sim_rx = asyncio.StreamReader()
    return (host_rx, MemWriter(sim_rx)), (sim_rx, MemWriter(host_rx))
