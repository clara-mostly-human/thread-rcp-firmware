# SONOFF Dongle Plus MG24 (Dongle-PMG24) — board facts

What the firmware must know about this board, where each fact comes from, and how sure we are.
Nothing here is published by SONOFF; keep it that way: measured > reported by SONOFF's own
firmware > community reconstruction > guess.

| Fact | Value | Source | Confidence |
|---|---|---|---|
| SoC | EFR32MG24A020F1024IM40 (1024 kB flash, +20 dBm PA) | community manifest (darkxst/silabs-firmware-builder, `manifests/sonoff/dongle_plus_mg24_*.yaml`) | medium — verify from the bootloader/`commander device info` or chip marking |
| USB bridge | CP2102N (10C4:EA60) | `system_profiler`, this machine | high |
| Host UART | USART0, TX = PC01, RX = PC02 | community manifest | medium (their FTD build talked over it, PR #260) |
| Flow control | none wired (CTS/RTS unused) | community manifest `no_flow`; SONOFF image name says only `460800` | medium |
| Baud rate | 460800 (OpenThread RCP), 115200 (Zigbee NCP, bootloader) | SONOFF image names; probes on this machine | high |
| HFXO crystal | 38.4 MHz | community PR #260 (2026-09-11), verified on hardware there: with the SDK default 39 MHz the radio is ~37 MHz off channel and deaf | high |
| HFXO CTUNE | **open**: SONOFF's Zigbee 7.4.5 firmware reports `CONFIG_CTUNE_VALUE=100`; community manifest hardcodes 128. A manufacturing token, if programmed, overrides the compiled default. | probe on this machine 2026-09-18 vs community manifest | low — resolve before trusting RF performance |
| Bootloader | Gecko bootloader, UART XMODEM, accepts unsigned/unencrypted GBL; application starts at 0x08006000 (24 kB bootloader) | parsed from SONOFF's `openthread_stable_2.4.4` GBL (`scripts/gbl.py inspect`) and repeated reflashes here | high |
| Stock RCP firmware | `SL-OPENTHREAD/2.4.4.0_GitHub-7074a43e4` = Gecko SDK 4.4.4 `ot-rcp`, OpenThread core of 2023-10-30; binary only | version string over Spinel | high |
| External PA/LNA (FEM) | unknown; none configured by the community manifests | — | low — check TX power/RSSI against the stock image |

Never rebuild or replace the bootloader as part of this project: it is the recovery path.
