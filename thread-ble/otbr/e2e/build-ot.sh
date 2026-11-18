#!/bin/bash
# Build the two OpenThread programs the end-to-end test needs, from the OpenThread tree that
# ot-br-posix pins (third_party/openthread/repo):
#   ot-cli (posix)       the host stack, with the CPC socket vendor interface; runs without root
#                        (no platform netif), RCP restoration on as in the OTBR app, plain stdio
#                        CLI (no readline) so a script can drive it
#   ot-rcp (simulation)  a real OpenThread RCP on the simulated radio, Spinel over HDLC on stdio
#   ot-cli-ftd (sim)     a second, all-in-one Thread node on the same simulated radio
#
#   thread-ble/otbr/e2e/build-ot.sh <openthread checkout> <build dir>
set -euo pipefail
OT=$(cd "$1" && pwd)
OUT=$2
HERE=$(cd "$(dirname "$0")/.." && pwd)
mkdir -p "$OUT"
OUT=$(cd "$OUT" && pwd)
LAUNCH=()
command -v ccache >/dev/null && LAUNCH=(-DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_COMPILER_LAUNCHER=ccache)

cmake -S "$OT" -B "$OUT/posix" -G Ninja "${LAUNCH[@]}" -DOT_PLATFORM=posix -DOT_FTD=ON -DOT_MTD=OFF \
  -DOT_RCP=OFF -DOT_APP_CLI=ON -DOT_APP_NCP=OFF -DOT_APP_RCP=OFF -DOT_RCP_RESTORATION_MAX_COUNT=2 \
  -DOT_POSIX_RCP_VENDOR_BUS=ON "-DOT_POSIX_CONFIG_RCP_VENDOR_INTERFACE=$HERE/cpc_socket_interface.cpp" \
  "-DCMAKE_CXX_FLAGS=-DOPENTHREAD_POSIX_CONFIG_SPINEL_VENDOR_INTERFACE_URL_PROTOCOL_NAME=\\\"spinel+cpc\\\"" \
  -DOT_LOG_LEVEL=INFO -DOT_COMPILE_WARNING_AS_ERROR=ON -DOT_READLINE=OFF >"$OUT/posix.configure.log" 2>&1 \
  || { tail -30 "$OUT/posix.configure.log"; exit 1; }
cmake --build "$OUT/posix" --target ot-cli >"$OUT/posix.build.log" 2>&1 \
  || { grep -B2 -A6 'error' "$OUT/posix.build.log" | head -60; exit 1; }

cmake -S "$OT" -B "$OUT/sim" -G Ninja "${LAUNCH[@]}" -DOT_PLATFORM=simulation -DOT_FTD=ON -DOT_MTD=OFF \
  -DOT_RCP=ON -DOT_APP_CLI=ON -DOT_APP_NCP=OFF -DOT_APP_RCP=ON >"$OUT/sim.configure.log" 2>&1 \
  || { tail -30 "$OUT/sim.configure.log"; exit 1; }
cmake --build "$OUT/sim" --target ot-rcp ot-cli-ftd >"$OUT/sim.build.log" 2>&1 \
  || { grep -B2 -A6 'error' "$OUT/sim.build.log" | head -60; exit 1; }

ls -l "$OUT/posix/src/posix/ot-cli" "$OUT/sim/examples/apps/ncp/ot-rcp" \
  "$OUT/sim/examples/apps/cli/ot-cli-ftd"
