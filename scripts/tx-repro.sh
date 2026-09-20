#!/bin/bash
# Reproduce the stuck transmit and print the firmware's own report (root).
# The spare dongle (/dev/cu.usbserial-1120) joins the production mesh as a host FTD, then sends,
# stage by stage: secured unicast (ping the parent), link-local multicast (ping ff02::1),
# realm-local multicast (ping ff03::1), a site-local UDP groupcast (the soak's traffic). After every
# stage: is the RCP still answering, do pings to the parent still work, what do the MAC counters say.
# Host logs at info level (set at run time; `-d` has no effect, openthread#13625).
#   sudo bash /Users/me/Projects/thread-rcp-firmware/scripts/tx-repro.sh   (ROUNDS=40 by default)
set -u
OTCLI=/Users/me/Projects/openthread-pr/build/posix/src/posix/ot-cli
PORT_DEV=/dev/cu.usbserial-1120
URL="spinel+hdlc+uart://${PORT_DEV}?uart-baudrate=460800"
LOGDIR=/Users/me/Projects/infra/ha/logs
NODE="${LOGDIR}/tx-repro-node.log"; NODE_ERR="${LOGDIR}/tx-repro-node.err"
DATA=/tmp/tx-repro-node; FIFO=/tmp/tx-repro.fifo
[ "$(id -u)" -eq 0 ] || { echo "run with sudo" >&2; exit 1; }
pkill -f "ot-cli.*usbserial-1120" 2>/dev/null && sleep 1

PROD_IF=""
for f in /var/run/openthread-utun*.sock; do [ -S "$f" ] && { PROD_IF=$(basename "$f" .sock | sed 's#^openthread-##'); break; }; done
# By exact process name: matching the command line also catches unrelated shells that mention the path.
AGENT=$(ps -o command= -p "$(pgrep -x otbr-agent | head -1)" 2>/dev/null | awk '{print $1}')
OTCTL="${AGENT%/src/agent/otbr-agent}/third_party/openthread/repo/src/posix/ot-ctl"
[ -n "$PROD_IF" ] && [ -x "$OTCTL" ] || { echo "production agent / ot-ctl not found" >&2; exit 1; }
DS=$("$OTCTL" -I "$PROD_IF" dataset active | tr -d '\r')
f() { echo "$DS" | awk -F': ' -v k="$1" '$1==k {print $2; exit}'; }

rm -rf "$DATA" && mkdir -p "$DATA"; rm -f "$FIFO" && mkfifo "$FIFO"; : >"$NODE"; : >"$NODE_ERR"
("$OTCLI" -v --data-path "$DATA" "$URL" <"$FIFO" >>"$NODE" 2>>"$NODE_ERR") &
NPID=$!
exec 3>"$FIFO"
cli() { # $1 = command, $2 = max wait in quarter seconds (default 80)
    local before; kill -0 "$NPID" 2>/dev/null || { echo "<ot-cli exited>"; return 1; }
    before=$(wc -l <"$NODE"); printf '%s\n' "$1" >&3 2>/dev/null || return 1
    for _ in $(seq 1 "${2:-80}"); do
        sleep 0.25
        tail -n +$((before + 1)) "$NODE" | tr -d '\r' | sed 's/^\(> \)*//' | grep -q '^Done$\|^Error ' && break
        kill -0 "$NPID" 2>/dev/null || { echo "<ot-cli exited>"; return 1; }
    done
    tail -n +$((before + 1)) "$NODE" | tr -d '\r' | sed 's/^\(> \)*//' | grep -v '^Done$\|^$'
}
cleanup() { trap - EXIT; printf 'thread stop\nexit\n' >&3 2>/dev/null; sleep 1; kill "$NPID" 2>/dev/null; exec 3>&- 2>/dev/null; rm -f "$FIFO"
    echo "--- firmware report (LOCAL lines) and host verdict:"; grep -a 'LOCAL\|radio tx timeout\|RadioSpinelNoResponse\|RCP failure\|recover' "$NODE_ERR" | sed -E 's/^.*> ?: //' | cut -c1-260 | head -30
    echo "logs: $NODE_ERR (host), $NODE (cli)"; }
trap cleanup EXIT
for _ in $(seq 1 40); do grep -q '>' "$NODE" 2>/dev/null && break; sleep 0.25; done; sleep 1
cli "state" >/dev/null
cli "log level 4" >/dev/null
echo "rcp: $(cli "rcp version" | head -1)"
for c in "dataset clear" "dataset channel $(f Channel)" "dataset panid $(f 'PAN ID')" "dataset extpanid $(f 'Ext PAN ID')" \
         "dataset networkkey $(f 'Network Key')" "dataset meshlocalprefix $(f 'Mesh Local Prefix' | sed 's,/64$,,')" "dataset networkname $(f 'Network Name')" "dataset activetimestamp 1" "dataset commit active"; do cli "$c" >/dev/null; done
cli "ifconfig up" >/dev/null; cli "thread start" >/dev/null
STATE=""; for _ in $(seq 1 60); do STATE=$(cli "state" | head -1); case "$STATE" in child | router) break ;; esac; sleep 2; done
echo "node: ${STATE:-?} rloc16 $(cli rloc16 | head -1), txpower $(cli txpower | head -1)"
case "$STATE" in child | router) ;; *) echo "FAIL: did not attach"; exit 1 ;; esac
PARENT_RLOC=$(cli "parent" | awk -F': ' '/Rloc/ {print $2}')
MLP=$(cli "ipaddr rloc" | head -1 | cut -d: -f1-4)
PARENT="${MLP}:0:ff:fe00:${PARENT_RLOC}"
# The production border router's view: why does it discard what it discards?
prod_rx() { "$OTCTL" -I "$PROD_IF" counters mac | tr -d '\r' | grep -E 'RxTotal|RxErrSec|RxDuplicated|RxErrUnknownNeighbor|RxErrInvalidSrcAddr|RxErrFcs|RxErrOther|RxErrNoFrame' | tr -s ' ' | tr '\n' ';'; }
echo "parent: rloc16 ${PARENT_RLOC:-?} -> $PARENT; $(cli parent | grep -E 'Link Quality|Age|RSSI' | tr '\n' ' ')"

ROUNDS="${ROUNDS:-40}"
cli "txpower 10" >/dev/null
echo "build under test: $(cli "rcp version" | head -1)"
# Routers relay MPL multicast, which is the load that triggered the stall: ask for promotion now.
cli "state router" >/dev/null
for _ in $(seq 1 30); do [ "$(cli state | head -1)" = "router" ] && break; sleep 2; done
echo "role: $(cli state | head -1) rloc16 $(cli rloc16 | head -1)"
START=$(date +%s)
for r in $(seq 1 "$ROUNDS"); do
    kill -0 "$NPID" 2>/dev/null || { echo "round $r: host process exited"; break; }
    grep -a -q 'LOCAL tx stuck' "$NODE_ERR" && { echo "round $r: firmware reported a stuck transmit"; sleep 6; break; }
    N=$(cli "ping ff03::1 64 5 0.2 64 1" 30 | grep -c 'bytes from')
    printf 'round %2d: %2d replies to 5 realm-local multicast pings (t+%ds)\n' "$r" "$N" "$(( $(date +%s) - START ))"
done
# The host exits as soon as the RCP resets, before the firmware's post-boot report. The assert
# record survives resets, so listen once more with a fresh host for a few seconds.
if ! kill -0 "$NPID" 2>/dev/null; then
    echo "--- host exited; reopening the RCP to collect the firmware's post-boot report"
    exec 3>&- 2>/dev/null; rm -f "$FIFO"; mkfifo "$FIFO"
    ("$OTCLI" -v --data-path "$DATA" "$URL" <"$FIFO" >>"$NODE" 2>>"${NODE_ERR}.afterboot") &
    NPID=$!; exec 3>"$FIFO"; : >"${NODE_ERR}.afterboot"
    sleep 14
    grep -a 'LOCAL' "${NODE_ERR}.afterboot" | sed -E 's/^.*> ?: //' | sort -u | cut -c1-260
    grep -a -q 'LOCAL' "${NODE_ERR}.afterboot" || echo "(no LOCAL report after reboot)"
fi
echo "=== done after $(( $(date +%s) - START )) s: host $(kill -0 "$NPID" 2>/dev/null && echo alive || echo EXITED), stuck reports: $(grep -a -c 'LOCAL tx stuck' "$NODE_ERR")"
