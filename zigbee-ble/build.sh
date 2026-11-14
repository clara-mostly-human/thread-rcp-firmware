#!/bin/bash
# Build the Zigbee NCP + Bluetooth HCI (CPC) firmware natively: make + the vendored Arm GCC + the
# vendored SDK. No slc, no Java, no network. Output: out/zigbee-ble-hci-pmg24-<tag>-460800.gbl
set -euo pipefail
cd "$(dirname "$0")/.."
V="$PWD/vendor/unpacked"
TAG="${1:-dev}"
[ -d "$V/simplicity_sdk" ] || { echo "unpack vendor/ first (see README.md)" >&2; exit 1; }
rm -rf zigbee-ble/firmware/build
mkdir -p build out
make -C zigbee-ble/firmware -f zigbee-ble-hci.Makefile -j8 SDK_PATH="$V/simplicity_sdk" \
    BASE_SDK_PATH="$V/simplicity_sdk" ARM_GCC_DIR="$V/arm-gnu-toolchain-12.2.rel1-darwin-arm64-arm-none-eabi" \
    >build/zbble-make.log 2>&1 || { tail -30 build/zbble-make.log; exit 1; }
python3 scripts/gbl.py pack zigbee-ble/firmware/build/debug/zigbee-ble-hci.s37 \
    "out/zigbee-ble-hci-pmg24-${TAG}-460800.gbl"
