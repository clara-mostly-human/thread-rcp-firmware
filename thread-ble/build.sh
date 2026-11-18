#!/bin/bash
# Build the Thread RCP + Bluetooth HCI (CPC) firmware natively: make + the vendored Arm GCC + the
# vendored SDK. No slc, no Java, no network. Output: out/thread-ble-hci-pmg24-<tag>-460800.gbl
# VENDOR_UNPACKED overrides vendor/unpacked (default: this checkout's, a symlink in a worktree).
set -euo pipefail
cd "$(dirname "$0")/.."
V="${VENDOR_UNPACKED:-$PWD/vendor/unpacked}"
TAG="${1:-dev}"
[ -d "$V/simplicity_sdk" ] || { echo "unpack vendor/ first (see README.md)" >&2; exit 1; }
rm -rf thread-ble/firmware/build
mkdir -p build out
make -C thread-ble/firmware -f thread-ble-hci.Makefile -j8 SDK_PATH="$V/simplicity_sdk" \
    BASE_SDK_PATH="$V/simplicity_sdk" ARM_GCC_DIR="$V/arm-gnu-toolchain-12.2.rel1-darwin-arm64-arm-none-eabi" \
    >build/threadble-make.log 2>&1 || { tail -30 build/threadble-make.log; exit 1; }
python3 scripts/gbl.py pack thread-ble/firmware/build/debug/thread-ble-hci.s37 \
    "out/thread-ble-hci-pmg24-${TAG}-460800.gbl"
