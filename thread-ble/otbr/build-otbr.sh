#!/bin/bash
# Build otbr-agent and ot-ctl with the CPC socket RCP vendor interface, the way the OpenThread
# Border Router app builds them (same CMake options file), plus the three vendor options.
#
#   thread-ble/otbr/build-otbr.sh <ot-br-posix checkout> <build dir> [build-options.txt]
#
# The options file defaults to the app's (~/Projects/ha-macos-apps/openthread_border_router).
# The HDLC interface stays built in, so the same binary still takes spinel+hdlc+uart:// URLs.
set -euo pipefail
SRC=$(cd "$1" && pwd)
BUILD=$2
OPTIONS=${3:-$HOME/Projects/ha-macos-apps/openthread_border_router/build-options.txt}
HERE=$(cd "$(dirname "$0")" && pwd)
mkdir -p "$BUILD"
BUILD=$(cd "$BUILD" && pwd)

ARGS=()
while IFS= read -r line; do
  case "$line" in
    ''|'#'*) ;;
    OT_POSIX_RCP_VENDOR_BUS:*|OT_POSIX_CONFIG_RCP_VENDOR_INTERFACE:*) ;;   # set below
    CMAKE_CXX_FLAGS:*)
      # name the vendor interface's URL scheme spinel+cpc (default: spinel+vendor)
      ARGS+=("-D${line} -DOPENTHREAD_POSIX_CONFIG_SPINEL_VENDOR_INTERFACE_URL_PROTOCOL_NAME=\\\"spinel+cpc\\\"") ;;
    *) ARGS+=("-D${line//@SRC@/$SRC}") ;;
  esac
done <"$OPTIONS"
ARGS+=(-DOT_POSIX_RCP_VENDOR_BUS:BOOL=ON
       "-DOT_POSIX_CONFIG_RCP_VENDOR_INTERFACE:STRING=$HERE/cpc_socket_interface.cpp")
if command -v ccache >/dev/null; then
  ARGS+=(-DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_COMPILER_LAUNCHER=ccache)
fi

if [ ! -f "$BUILD/build.ninja" ]; then
  cmake -S "$SRC" -B "$BUILD" -G Ninja "${ARGS[@]}" >"$BUILD.configure.log" 2>&1 \
    || { tail -30 "$BUILD.configure.log"; exit 1; }
fi
cmake --build "$BUILD" --target otbr-agent ot-ctl >"$BUILD.build.log" 2>&1 \
  || { grep -B2 -A6 'error' "$BUILD.build.log" | head -60; exit 1; }

grep -q 'OT_POSIX_RCP_VENDOR_BUS:BOOL=ON' "$BUILD/CMakeCache.txt"
grep -q 'OT_RCP_RESTORATION_MAX_COUNT:STRING=2' "$BUILD/CMakeCache.txt"
echo "built: $("$BUILD/src/agent/otbr-agent" --version 2>&1 | head -1)"
