"""The Bluetooth half: Bumble over a CPC-like endpoint against Bumble's virtual controller, and
the ESPHome server against aioesphomeapi's own client (the one HA uses). No hardware."""

import asyncio

import pytest

pytest.importorskip("bumble")
pytest.importorskip("aioesphomeapi")

from aioesphomeapi import APIClient, BluetoothProxyFeature, BluetoothScannerMode
from bumble.controller import Controller
from bumble.device import Device
from bumble.hci import Address, OwnAddressType
from bumble.host import Host
from bumble.link import LocalLink
from bumble.transport.common import AsyncPipeSink

import ble_proxy
import cpc
from test_cpc import async_test

ADV_DATA = bytes([0x02, 0x01, 0x06, 0x05, 0x09]) + b"Tent"


class VirtualChipEndpoint:
    """Stands in for cpc.Endpoint 14: HCI packets to and from Bumble's virtual controller."""

    def __init__(self, controller: Controller) -> None:
        self.controller = controller
        self.queue: asyncio.Queue[bytes | None] = asyncio.Queue()
        controller.host = self                      # controller-to-host packets land in on_packet

    def on_packet(self, packet: bytes) -> None:
        self.queue.put_nowait(bytes(packet))

    async def write(self, data: bytes) -> None:
        self.controller.on_packet(data)              # raw H4 bytes, as CPC carries them

    async def read(self, timeout=None) -> bytes:
        item = await self.queue.get()
        if item is None:
            raise cpc.CpcConnectionLost("closed")
        return item

    def close(self) -> None:
        self.queue.put_nowait(None)


async def advertiser(link: LocalLink, address: str) -> Device:
    ctrl = Controller("adv", link=link, public_address=address)
    dev = Device(name="adv", address=Address(address), host=Host(ctrl, AsyncPipeSink(ctrl)))
    await dev.power_on()
    await dev.start_advertising(own_address_type=OwnAddressType.PUBLIC, advertising_data=ADV_DATA,
                                advertising_interval_min=20, advertising_interval_max=20)
    return dev


@async_test
async def test_scanner_reports_a_virtual_advertiser_through_the_endpoint():
    link = LocalLink()
    chip = Controller("chip", link=link, public_address="11:22:33:44:55:66")
    ep = VirtualChipEndpoint(chip)
    got: list[ble_proxy.RawAdvert] = []
    scanner = ble_proxy.BleScanner(got.append, interval_ms=20, window_ms=20)
    await scanner.attach(ep)
    try:
        assert scanner.address == "11:22:33:44:55:66"
        assert scanner.state == ble_proxy.STATE_RUNNING
        adv = await advertiser(link, "AA:BB:CC:DD:EE:01")
        for _ in range(200):
            if any(a.address == 0xAABBCCDDEE01 for a in got):
                break
            await asyncio.sleep(0.01)
        mine = [a for a in got if a.address == 0xAABBCCDDEE01]
        assert mine, got
        assert mine[0].address_type == 0 and mine[0].data == ADV_DATA
        await adv.stop_advertising()
        # a new mode restarts scanning and reports the state
        states = []
        scanner.on_state = lambda: states.append((scanner.state, scanner.mode))
        await scanner.set_mode(ble_proxy.MODE_ACTIVE)
        assert (ble_proxy.STATE_RUNNING, ble_proxy.MODE_ACTIVE) in states
    finally:
        await scanner.detach()
        ep.close()
    assert scanner.state == ble_proxy.STATE_IDLE


@async_test
async def test_scanner_survives_a_chip_reboot():
    link = LocalLink()
    got = []
    scanner = ble_proxy.BleScanner(got.append, interval_ms=20, window_ms=20)
    first = VirtualChipEndpoint(Controller("chip", link=link, public_address="11:22:33:44:55:66"))
    await scanner.attach(first)
    await scanner.set_mode(ble_proxy.MODE_ACTIVE)
    first.close()                                   # the chip reboots: a new endpoint arrives
    second = VirtualChipEndpoint(Controller("chip2", link=link, public_address="11:22:33:44:55:66"))
    await scanner.attach(second)
    try:
        assert scanner.state == ble_proxy.STATE_RUNNING and scanner.mode == ble_proxy.MODE_ACTIVE
        adv = await advertiser(link, "AA:BB:CC:DD:EE:02")
        for _ in range(200):
            if any(a.address == 0xAABBCCDDEE02 for a in got):
                break
            await asyncio.sleep(0.01)
        assert any(a.address == 0xAABBCCDDEE02 for a in got)
        await adv.stop_advertising()
    finally:
        await scanner.detach()
        second.close()


class FakeScanner:
    def __init__(self):
        self.on_advert = lambda adv: None
        self.on_state = lambda: None
        self.address = "11:22:33:44:55:66"
        self.mode = ble_proxy.MODE_PASSIVE
        self.state = ble_proxy.STATE_RUNNING
        self.modes = []

    async def set_mode(self, mode):
        self.modes.append(mode)
        self.mode = mode
        self.on_state()


@async_test
async def test_esphome_client_sees_a_bluetooth_proxy_and_gets_raw_adverts():
    scanner = FakeScanner()
    server = ble_proxy.EspHomeProxyServer(scanner, batch_interval=0.05)
    port = await server.start("127.0.0.1", 0)
    cli = APIClient("127.0.0.1", port, None)
    try:
        await cli.connect(login=True)
        info = await cli.device_info()
        assert info.name == "zigbee-ble-bluetooth"
        assert info.bluetooth_mac_address == "11:22:33:44:55:66"
        flags = info.bluetooth_proxy_feature_flags_compat(cli.api_version)
        assert flags & BluetoothProxyFeature.PASSIVE_SCAN
        assert flags & BluetoothProxyFeature.RAW_ADVERTISEMENTS
        assert flags & BluetoothProxyFeature.FEATURE_STATE_AND_MODE
        assert not flags & BluetoothProxyFeature.ACTIVE_CONNECTIONS
        entities, services = await cli.list_entities_services()
        assert entities == [] and services == []

        states = []
        cli.subscribe_bluetooth_scanner_state(states.append)
        batches = []
        cli.subscribe_bluetooth_le_raw_advertisements(batches.append)
        for _ in range(100):
            if states:
                break
            await asyncio.sleep(0.01)
        assert states and states[-1].state.name.endswith("RUNNING")

        for i in range(20):                          # 16 go out at once, 4 after the interval
            scanner.on_advert(ble_proxy.RawAdvert(0xAABBCCDDEE00 + i, 1, -60 - i, ADV_DATA))
        for _ in range(100):
            if sum(len(b.advertisements) for b in batches) == 20:
                break
            await asyncio.sleep(0.01)
        advs = [a for b in batches for a in b.advertisements]
        assert len(advs) == 20 and len(batches) == 2
        assert advs[0].address == 0xAABBCCDDEE00 and advs[0].address_type == 1
        assert advs[0].rssi == -60 and bytes(advs[0].data) == ADV_DATA

        cli.bluetooth_scanner_set_mode(BluetoothScannerMode.ACTIVE)
        for _ in range(100):
            if scanner.modes:
                break
            await asyncio.sleep(0.01)
        assert scanner.modes == [ble_proxy.MODE_ACTIVE]
        for _ in range(100):
            if states[-1].mode.name.endswith("ACTIVE"):
                break
            await asyncio.sleep(0.01)
        assert states[-1].mode.name.endswith("ACTIVE")
    finally:
        await cli.disconnect()
        await server.close()


def test_frame_reader_splits_and_joins():
    from aioesphomeapi import api_pb2
    data = ble_proxy.frame(api_pb2.PingRequest()) + ble_proxy.frame(api_pb2.HelloRequest(client_info="x" * 200))
    r = ble_proxy.FrameReader()
    out = []
    for i in range(0, len(data), 7):
        out += r.feed(data[i:i + 7])
    assert [m for m, _ in out] == [7, 1]
    assert api_pb2.HelloRequest.FromString(out[1][1]).client_info == "x" * 200
    with pytest.raises(ValueError):
        ble_proxy.FrameReader().feed(b"\x01\x00\x07")
