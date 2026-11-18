"""The chip's OpenThread RCP on CPC endpoint 12, as a SimSecondary app.

Modelled on the SDK 2025.6.3 sources, sharing no code with spinel_socket.py:
  protocol/openthread/platform-abstraction/ncp/ncp_cpc.cpp
    - one Spinel frame per CPC payload from the host (ProcessCpc, :309-326);
    - frames to the host concatenated, each after a u16 big-endian length, up to the TX chunk
      size (SendToCPC, :197-216);
    - nothing goes to the host until the host has sent a frame (mIsReady, :321-324); the
      reset notification queued at boot waits for that too.
  util/third_party/openthread/src/ncp/ncp_base.cpp
    - CMD_RESET with SPINEL_RESET_STACK: radio stack reset, NCP buffer cleared, then
      LAST_STATUS RESET_POWER_ON on IID 0 (CommandHandler_RESET, :1293-1323);
    - other commands are answered with the request's header (IID and TID).
Only what the tests need: RESET, NOOP, PROP_VALUE_GET of a few keys, LAST_STATUS OK otherwise.
"""

from __future__ import annotations

FLAG = 0x80                                    # SPINEL_HEADER_FLAG
CMD_NOOP, CMD_RESET, CMD_GET, CMD_SET, CMD_IS = 0x00, 0x01, 0x02, 0x03, 0x06
PROP_LAST_STATUS, PROP_PROTOCOL_VERSION, PROP_NCP_VERSION = 0x00, 0x01, 0x02
STATUS_OK, STATUS_RESET_POWER_ON, STATUS_RESET_UNKNOWN = 0x00, 0x70, 0x74
RESET_STACK = 2


def last_status(header: int, status: int) -> bytes:
    assert status < 0x80                       # one-byte packed uint is enough here
    return bytes([header, CMD_IS, PROP_LAST_STATUS, status])


class FakeRcp:
    def __init__(self, *, boot_status: int = STATUS_RESET_UNKNOWN, chunk: int = 2048) -> None:
        self.boot_status = boot_status
        self.chunk = chunk
        self.received: list[bytes] = []
        self.payloads_sent: list[bytes] = []
        self.ready = False
        self._queue: list[bytes] = []
        self._sim = None
        self._ep = 12
        self.on_reboot()

    def on_reboot(self) -> None:
        self.ready = False
        self._queue = [last_status(FLAG, self.boot_status)]   # NcpBase queues it at boot

    def __call__(self, sim, ep_id: int, data: bytes) -> None:
        self._sim, self._ep = sim, ep_id
        self.received.append(data)
        self.ready = True
        self._handle(data)
        self._flush()

    def push(self, frame: bytes) -> None:
        """Something the RCP says on its own (a received radio frame, a TX done...)."""
        self._queue.append(frame)
        self._flush()

    def _handle(self, frame: bytes) -> None:
        header, cmd = frame[0], frame[1]
        if cmd == CMD_RESET:
            if len(frame) < 3 or frame[2] == RESET_STACK:
                self._queue.clear()
                self._queue.append(last_status(FLAG, STATUS_RESET_POWER_ON))
            return
        if cmd == CMD_GET and len(frame) >= 3:
            key = frame[2]
            if key == PROP_PROTOCOL_VERSION:
                self._queue.append(bytes([header, CMD_IS, key, 4, 3]))
            elif key == PROP_NCP_VERSION:
                self._queue.append(bytes([header, CMD_IS, key]) + b"SIM-RCP/1.0\0")
            else:
                self._queue.append(last_status(header, STATUS_OK))
            return
        self._queue.append(last_status(header, STATUS_OK))

    def _flush(self) -> None:
        if not self.ready or self._sim is None:
            return
        while self._queue:
            out = bytearray()
            while self._queue and len(out) + 2 + len(self._queue[0]) < self.chunk:
                f = self._queue.pop(0)
                out += len(f).to_bytes(2, "big") + f
            self.payloads_sent.append(bytes(out))
            self._sim.send_data(self._ep, bytes(out))
