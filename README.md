# thread-rcp-firmware

Own the Thread radio: build the OpenThread RCP firmware for the SONOFF Dongle Plus MG24 from
source on this machine, with every input archived locally, so the radio can be rebuilt, debugged
and modified with the network unplugged.

Target: Simplicity SDK 2025.6.3 (Silicon Labs OpenThread SDK 2.7.3.0, upstream OpenThread
fb0446f53). Everything is source except RAIL, the radio library, which Silicon Labs ships as
`librail_efr32xg24_gcc_release.a`.

## Layout

- `vendor/` — third-party inputs. The archives are not in git; `vendor/SHA256SUMS` pins them.
  - `simplicity-sdk-2025.6.3.zip` — github.com/SiliconLabs/simplicity_sdk release asset (MSLA licence)
  - `slc_cli_mac.zip` — Silicon Labs project generator (needs a Java 17+ runtime)
  - `arm-gnu-toolchain-12.2.rel1-darwin-arm64-arm-none-eabi.tar.xz` — Arm GNU toolchain 12.2.1
  - `unpacked/` — the three of them extracted
- `board/` — what we know about the hardware and how we know it
- `scripts/gbl.py` — inspect and create `.gbl` upgrade files (replaces Simplicity Commander)
- `out/` — built images

## Rules

1. Spare dongle (`/dev/cu.usbserial-1120`) first; the production radio (`-3110`) only after a soak.
2. SONOFF's stock image stays in `~/Projects/infra/ha/otbr/firmware/` as the way back.
3. The bootloader is never touched.
