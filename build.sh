#!/bin/bash
# Build the RCP firmware natively: make + the vendored Arm GCC + the vendored SDK. No slc, no Java,
# no network. Output: out/ot-rcp-pmg24-<version>-460800.gbl
set -euo pipefail
cd "$(dirname "$0")"
V="$PWD/vendor/unpacked"
[ -d "$V/simplicity_sdk" ] || { echo "unpack vendor/ first (see README.md)" >&2; exit 1; }
# Always from scratch: make does not notice changed -D flags, and a full build takes ~5 s.
rm -rf firmware/build
make -C firmware -f ot-rcp.Makefile -j8 SDK_PATH="$V/simplicity_sdk" BASE_SDK_PATH="$V/simplicity_sdk" \
    ARM_GCC_DIR="$V/arm-gnu-toolchain-12.2.rel1-darwin-arm64-arm-none-eabi" >build/make.log 2>&1 \
    || { tail -30 build/make.log; exit 1; }
VERSION=$(strings firmware/build/debug/ot-rcp.bin | grep -m1 -o 'SL-OPENTHREAD/[0-9.]*' | cut -d/ -f2)
mkdir -p out
python3 scripts/gbl.py pack firmware/build/debug/ot-rcp.s37 "out/ot-rcp-pmg24-${VERSION}-460800.gbl"
