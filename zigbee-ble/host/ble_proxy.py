"""Bluetooth half of the zigbee-ble dongle: Bumble on CPC endpoint 14, served to HA as an
ESPHome Bluetooth proxy.

    chip (Bluetooth controller, HCI)  --CPC ep 14-->  Bumble host stack (scanning)
        --> ESPHome Native API server (plaintext, 127.0.0.1:6053) --> HA's ESPHome integration

HA treats the server like an ESP32 Bluetooth proxy: it reads DeviceInfo, sees the proxy feature
flags, subscribes to raw advertisements and sets the scan mode. Passive and active scanning only
for now (no GATT connections: those need ACTIVE_CONNECTIONS and the GATT requests).

ESPHome API facts used here, from aioesphomeapi 46.25.0 (the version in production Core):
  * plaintext frame = 0x00, varuint(len(data)), varuint(message id), data (protobuf);
    _frame_helper/packets.py make_plain_text_packets.
  * message ids are the `id` option of each message in api.proto (api_pb2 descriptors).
  * the client sends HelloRequest (+ AuthenticationRequest only with a password) and waits for
    HelloResponse only; then DeviceInfoRequest, ListEntitiesRequest, subscriptions.
  * BluetoothProxyFeature: PASSIVE_SCAN 1, ACTIVE_CONNECTIONS 2, RAW_ADVERTISEMENTS 32,
    FEATURE_STATE_AND_MODE 64 (aioesphomeapi/model.py:138-145). Raw advertisements carry the
    address as an integer, the address type, RSSI and the advertising data bytes.
"""

from __future__ import annotations

import asyncio
import contextlib
import logging
import time
from collections.abc import Callable
from dataclasses import dataclass

from aioesphomeapi import api_options_pb2, api_pb2
from bumble import hci
from bumble.device import Advertisement, Device
from bumble.transport.common import ParserSource

import cpc

_LOG = logging.getLogger("ble_proxy")

PASSIVE_SCAN, RAW_ADVERTISEMENTS, STATE_AND_MODE = 1, 32, 64
MODE_PASSIVE = api_pb2.BLUETOOTH_SCANNER_MODE_PASSIVE
MODE_ACTIVE = api_pb2.BLUETOOTH_SCANNER_MODE_ACTIVE
STATE_IDLE = api_pb2.BLUETOOTH_SCANNER_STATE_IDLE
STATE_RUNNING = api_pb2.BLUETOOTH_SCANNER_STATE_RUNNING
STATE_FAILED = api_pb2.BLUETOOTH_SCANNER_STATE_FAILED

MSG_ID: dict[type, int] = {}
MSG_BY_ID: dict[int, type] = {}
for _name, _desc in api_pb2.DESCRIPTOR.message_types_by_name.items():
    _opts = _desc.GetOptions()
    if _opts.HasExtension(api_options_pb2.id):
        _cls = getattr(api_pb2, _name)
        MSG_ID[_cls] = _opts.Extensions[api_options_pb2.id]
        MSG_BY_ID[MSG_ID[_cls]] = _cls


# ------------------------------------------------------------------------------------------
# Bumble over CPC endpoint 14
# ------------------------------------------------------------------------------------------

class CpcHciSource(ParserSource):
    """Controller-to-host bytes from the endpoint, split into H4 packets by Bumble's parser
    (whether the chip sends one packet per CPC frame or splits them)."""

    def __init__(self, ep: cpc.Endpoint) -> None:
        super().__init__()
        self._task = asyncio.create_task(self._pump(ep), name="hci-rx")

    async def _pump(self, ep: cpc.Endpoint) -> None:
        try:
            while True:
                self.parser.feed_data(await ep.read())
        except cpc.CpcError as exc:
            _LOG.warning("Bluetooth endpoint closed: %s", exc)
            self.on_transport_lost()

    async def close(self) -> None:
        self._task.cancel()
        with contextlib.suppress(asyncio.CancelledError, Exception):
            await self._task


class CpcHciSink:
    """Host-to-controller H4 packets (type byte included) to the endpoint, in order."""

    def __init__(self, ep: cpc.Endpoint) -> None:
        self._queue: asyncio.Queue[bytes] = asyncio.Queue()
        self._task = asyncio.create_task(self._pump(ep), name="hci-tx")

    def on_packet(self, packet: bytes) -> None:
        self._queue.put_nowait(bytes(packet))

    async def _pump(self, ep: cpc.Endpoint) -> None:
        with contextlib.suppress(cpc.CpcError):
            while True:
                await ep.write(await self._queue.get())

    async def close(self) -> None:
        self._task.cancel()
        with contextlib.suppress(asyncio.CancelledError, Exception):
            await self._task


@dataclass
class RawAdvert:
    address: int        # 48-bit address as an integer, most significant byte first
    address_type: int   # 0 public, 1 random
    rssi: int
    data: bytes


def raw_advert(adv: Advertisement) -> RawAdvert:
    addr = adv.address
    return RawAdvert(int.from_bytes(bytes(reversed(bytes(addr))), "big"),
                     1 if addr.address_type in (hci.Address.RANDOM_DEVICE_ADDRESS,
                                                hci.Address.RANDOM_IDENTITY_ADDRESS) else 0,
                     int(adv.rssi), bytes(adv.data_bytes))


class BleScanner:
    """Bumble host on the chip's controller; scans and hands every advertisement to `on_advert`.

    Survives chip reboots: `attach()` is called with the new endpoint after each reboot and
    scanning resumes in the last requested mode.
    """

    def __init__(self, on_advert: Callable[[RawAdvert], None], *, interval_ms: float = 150,
                 window_ms: float = 30) -> None:
        self.on_advert = on_advert
        self.interval_ms = interval_ms
        self.window_ms = window_ms
        self.mode = MODE_PASSIVE
        self.state = STATE_IDLE
        self.address: str | None = None          # the controller's public address
        self.on_state: Callable[[], None] = lambda: None
        self._device: Device | None = None
        self._source: CpcHciSource | None = None
        self._sink: CpcHciSink | None = None
        self._lock = asyncio.Lock()
        self.adverts = 0

    def _set_state(self, state: int) -> None:
        self.state = state
        self.on_state()

    async def attach(self, ep: cpc.Endpoint) -> None:
        async with self._lock:
            await self._detach_locked()
            self._source, self._sink = CpcHciSource(ep), CpcHciSink(ep)
            device = Device.with_hci("zigbee-ble", hci.Address("F0:F1:F2:F3:F4:F5"),
                                     self._source, self._sink)
            device.on("advertisement", self._on_advertisement)
            await device.power_on()
            self._device = device
            self.address = str(device.public_address).split("/")[0]
            _LOG.info("Bluetooth controller up, public address %s", self.address)
            await self._start_locked()

    async def _start_locked(self) -> None:
        if self._device is None:
            return
        try:
            await self._device.start_scanning(
                active=self.mode == MODE_ACTIVE, scan_interval=self.interval_ms,
                scan_window=self.window_ms, filter_duplicates=False,
                own_address_type=hci.OwnAddressType.PUBLIC, scanning_phys=(hci.Phy.LE_1M,))
        except Exception:
            _LOG.exception("could not start scanning")
            self._set_state(STATE_FAILED)
            return
        _LOG.info("scanning (%s, window %g ms every %g ms)",
                  "active" if self.mode == MODE_ACTIVE else "passive", self.window_ms, self.interval_ms)
        self._set_state(STATE_RUNNING)

    async def set_mode(self, mode: int) -> None:
        async with self._lock:
            if mode == self.mode and self.state == STATE_RUNNING:
                self.on_state()
                return
            self.mode = mode
            if self._device is not None:
                with contextlib.suppress(Exception):
                    await self._device.stop_scanning()
                await self._start_locked()
            else:
                self.on_state()

    def _on_advertisement(self, adv: Advertisement) -> None:
        self.adverts += 1
        try:
            self.on_advert(raw_advert(adv))
        except Exception:
            _LOG.exception("advertisement handler failed")

    async def _detach_locked(self) -> None:
        if self._device is not None:
            with contextlib.suppress(Exception):
                await asyncio.wait_for(self._device.stop_scanning(), 1)
        for part in (self._source, self._sink):
            if part is not None:
                await part.close()
        self._device = self._source = self._sink = None
        if self.state != STATE_IDLE:
            self._set_state(STATE_IDLE)

    async def detach(self) -> None:
        async with self._lock:
            await self._detach_locked()


# ------------------------------------------------------------------------------------------
# ESPHome Native API server (plaintext)
# ------------------------------------------------------------------------------------------

def _varuint(n: int) -> bytes:
    out = bytearray()
    while True:
        b, n = n & 0x7F, n >> 7
        out.append(b | (0x80 if n else 0))
        if not n:
            return bytes(out)


def frame(msg) -> bytes:
    data = msg.SerializeToString()
    return b"\x00" + _varuint(len(data)) + _varuint(MSG_ID[type(msg)]) + data


class FrameReader:
    """Plaintext ESPHome frames out of a byte stream."""

    def __init__(self) -> None:
        self._buf = bytearray()

    def feed(self, data: bytes) -> list[tuple[int, bytes]]:
        self._buf += data
        out = []
        while True:
            parsed = self._parse()
            if parsed is None:
                return out
            out.append(parsed)

    def _parse(self) -> tuple[int, bytes] | None:
        buf = self._buf
        if not buf:
            return None
        if buf[0] != 0x00:
            raise ValueError(f"not a plaintext ESPHome frame (preamble 0x{buf[0]:02x})")
        pos, vals = 1, []
        for _ in range(2):
            n = shift = 0
            while True:
                if pos >= len(buf):
                    return None
                b = buf[pos]
                pos += 1
                n |= (b & 0x7F) << shift
                shift += 7
                if not b & 0x80:
                    break
                if shift > 28:
                    raise ValueError("varuint too long")
            vals.append(n)
        length, msg_id = vals
        if len(buf) < pos + length:
            return None
        data = bytes(buf[pos:pos + length])
        del buf[:pos + length]
        return msg_id, data


@dataclass
class ProxyIdentity:
    name: str = "zigbee-ble-bluetooth"
    friendly_name: str = "Zigbee + Bluetooth dongle"
    model: str = "SONOFF Dongle Plus MG24 (zigbee-ble)"
    manufacturer: str = "infra/ha zigbee-ble"
    version: str = "2026.11.0"       # ESPHome API compatibility level reported to HA
    project_version: str = "dev"


class EspHomeProxyServer:
    """Serves one or more ESPHome API clients (HA) with the scanner's advertisements."""

    def __init__(self, scanner: BleScanner, identity: ProxyIdentity | None = None, *,
                 batch_interval: float = 0.1, batch_max: int = 16) -> None:
        self.scanner = scanner
        self.identity = identity or ProxyIdentity()
        self.batch_interval = batch_interval
        self.batch_max = batch_max
        self._clients: set[_Client] = set()
        self._server: asyncio.base_events.Server | None = None
        self._started = time.strftime("%b %d %Y, %H:%M:%S")
        scanner.on_advert = self._on_advert
        scanner.on_state = self._on_state

    def _on_advert(self, adv: RawAdvert) -> None:
        for c in self._clients:
            c.advert(adv)

    def _on_state(self) -> None:
        for c in self._clients:
            c.send_state()

    def device_info(self) -> api_pb2.DeviceInfoResponse:
        mac = self.scanner.address or "00:00:00:00:00:00"
        return api_pb2.DeviceInfoResponse(
            uses_password=False, name=self.identity.name, friendly_name=self.identity.friendly_name,
            mac_address=mac, bluetooth_mac_address=mac, esphome_version=self.identity.version,
            compilation_time=self._started, model=self.identity.model,
            manufacturer=self.identity.manufacturer, project_name="infra.zigbee-ble",
            project_version=self.identity.project_version,
            bluetooth_proxy_feature_flags=PASSIVE_SCAN | RAW_ADVERTISEMENTS | STATE_AND_MODE)

    async def start(self, host: str = "127.0.0.1", port: int = 6053) -> int:
        self._server = await asyncio.start_server(self._serve, host, port)
        bound = self._server.sockets[0].getsockname()[1]
        _LOG.info("ESPHome API (Bluetooth proxy) on %s:%d", host, bound)
        return bound

    async def close(self) -> None:
        if self._server:
            self._server.close()
        for c in list(self._clients):
            c.close()
        if self._server:
            with contextlib.suppress(Exception):
                await asyncio.wait_for(self._server.wait_closed(), 5)

    async def _serve(self, reader: asyncio.StreamReader, writer: asyncio.StreamWriter) -> None:
        client = _Client(self, writer)
        self._clients.add(client)
        _LOG.info("ESPHome client connected from %s", writer.get_extra_info("peername"))
        frames = FrameReader()
        try:
            while data := await reader.read(4096):
                for msg_id, payload in frames.feed(data):
                    if not await client.handle(msg_id, payload):
                        return
        except (ValueError, ConnectionError) as exc:
            _LOG.warning("ESPHome client error: %s", exc)
        finally:
            self._clients.discard(client)
            client.close()
            _LOG.info("ESPHome client disconnected")


class _Client:
    def __init__(self, server: EspHomeProxyServer, writer: asyncio.StreamWriter) -> None:
        self.server = server
        self.writer = writer
        self.raw = False
        self._batch: list[RawAdvert] = []
        self._flush: asyncio.TimerHandle | None = None

    def send(self, msg) -> None:
        if not self.writer.is_closing():
            self.writer.write(frame(msg))

    def close(self) -> None:
        if self._flush:
            self._flush.cancel()
        self.writer.close()

    def send_state(self) -> None:
        s = self.server.scanner
        self.send(api_pb2.BluetoothScannerStateResponse(state=s.state, mode=s.mode, configured_mode=MODE_PASSIVE))

    def advert(self, adv: RawAdvert) -> None:
        if not self.raw:
            return
        self._batch.append(adv)
        if len(self._batch) >= self.server.batch_max:
            self._send_batch()
        elif self._flush is None:
            self._flush = asyncio.get_running_loop().call_later(self.server.batch_interval, self._send_batch)

    def _send_batch(self) -> None:
        if self._flush:
            self._flush.cancel()
            self._flush = None
        batch, self._batch = self._batch, []
        if batch:
            self.send(api_pb2.BluetoothLERawAdvertisementsResponse(advertisements=[
                api_pb2.BluetoothLERawAdvertisement(address=a.address, rssi=a.rssi,
                                                     address_type=a.address_type, data=a.data)
                for a in batch]))

    async def handle(self, msg_id: int, payload: bytes) -> bool:
        cls = MSG_BY_ID.get(msg_id)
        if cls is None:
            _LOG.debug("ignoring unknown message id %d", msg_id)
            return True
        msg = cls.FromString(payload)
        name = cls.__name__
        if name == "HelloRequest":
            self.send(api_pb2.HelloResponse(api_version_major=1, api_version_minor=14,
                                            server_info=f"zigbee-ble ble_proxy {self.server.identity.project_version}",
                                            name=self.server.identity.name))
        elif name == "DisconnectRequest":
            self.send(api_pb2.DisconnectResponse())
            return False
        elif name == "PingRequest":
            self.send(api_pb2.PingResponse())
        elif name == "DeviceInfoRequest":
            self.send(self.server.device_info())
        elif name == "ListEntitiesRequest":
            self.send(api_pb2.ListEntitiesDoneResponse())
        elif name == "SubscribeBluetoothLEAdvertisementsRequest":
            self.raw = bool(msg.flags & 1)          # BluetoothProxySubscriptionFlag.RAW_ADVERTISEMENTS
            if not self.raw:
                _LOG.warning("client asked for legacy (non-raw) advertisements; not supported")
            self.send_state()
        elif name == "UnsubscribeBluetoothLEAdvertisementsRequest":
            self.raw = False
        elif name == "BluetoothScannerSetModeRequest":
            await self.server.scanner.set_mode(msg.mode)
        elif name == "SubscribeBluetoothConnectionsFreeRequest":
            self.send(api_pb2.BluetoothConnectionsFreeResponse(free=0, limit=0))
        else:
            _LOG.debug("ignoring %s", name)
        return True
