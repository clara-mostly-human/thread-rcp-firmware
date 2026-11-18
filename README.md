# thread-rcp-firmware

Own the radio: build firmware for the SONOFF Dongle Plus MG24 from source on this machine, with
every input archived locally, so the radio can be rebuilt, debugged and modified with the network
unplugged. Three images, each with its Mac-side host where it needs one:

| Image | What | Mac side |
|---|---|---|
| `ot-rcp` (`firmware/`) | OpenThread RCP for the border router | none: otbr-agent speaks Spinel over the serial port |
| `zigbee-ble` | Zigbee NCP + Bluetooth HCI over CPC | `zigbee-ble/host`: the bridge serves EZSP to ZHA (`socket://`) and raw HCI to nimbled |
| `thread-ble` | Thread RCP + Bluetooth HCI over CPC | `thread_ble_bridge.py` and an OpenThread RCP vendor interface (`thread-ble/otbr`); see [docs/thread-ble.md](docs/thread-ble.md). Not yet tried on hardware |

They are used by the native macOS Home Assistant ([supervisor](https://github.com/clara-mostly-human/supervisor)
`macos_support` branch, whose installer flashes them; apps in
[ha-macos-apps](https://github.com/clara-mostly-human/ha-macos-apps); Bluetooth host in
[ha-macos-bluetooth](https://github.com/clara-mostly-human/ha-macos-bluetooth)).

Built images are published as release assets with their SHA-256, not committed. Flash with
`universal-silabs-flasher --device <port> --bootloader-reset rts_dtr flash --firmware <image>`;
the application flash leaves the bootloader and the network settings (NVM3) alone.

Licence: our own files (scripts, host programs, the vendor interface) are Apache-2.0
([LICENSE](LICENSE)). Files generated from or copied out of Silicon Labs' SDK keep the licence
in their headers (Zlib or Silicon Labs' MSLA); the SDK itself is not in this repository.

Target: Simplicity SDK 2025.6.3 (Silicon Labs OpenThread SDK 2.7.3.0, upstream OpenThread
fb0446f53). Everything is source except RAIL, the radio library, which Silicon Labs ships as
`librail_efr32xg24_gcc_release.a`.

## Layout

- `vendor/` — third-party inputs. The archives are not in git; `vendor/SHA256SUMS` pins them.
  - `simplicity-sdk-2025.6.3.zip` — github.com/SiliconLabs/simplicity_sdk release asset (MSLA licence)
  - `slc_cli_mac.zip` — Silicon Labs project generator (needs a Java 17+ runtime)
  - `arm-gnu-toolchain-12.2.rel1-darwin-arm64-arm-none-eabi.tar.xz` — Arm GNU toolchain 12.2.1
  - `amazon-corretto-17-aarch64-macos-jdk.tar.gz` — Java 17 runtime for `slc`, run from `vendor/unpacked/jdk`, not installed system-wide
  - `unpacked/` — the three of them extracted
- `board/` — what we know about the hardware and how we know it
- `scripts/gbl.py` — inspect and create `.gbl` upgrade files (replaces Simplicity Commander)
- `out/` — built images
- `zigbee-ble/` — Zigbee NCP + Bluetooth HCI over CPC, and the Mac-side CPC host (`zigbee-ble/host`)
- `thread-ble/` — Thread RCP + Bluetooth HCI over CPC; `thread-ble/otbr/` holds otbr-agent's RCP vendor
  interface for it. Design, tests and hardware plan: `docs/thread-ble.md`

## Rules

1. Spare dongle (`/dev/cu.usbserial-1120`) first; the production radio (`-3110`) only after a soak.
2. SONOFF's stock image stays in `~/Projects/infra/ha/otbr/firmware/` as the way back.
3. The bootloader is never touched.
