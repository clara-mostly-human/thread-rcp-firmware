#!/bin/bash
# Which kind of transmission wedges the RCP? (root)
# The spare dongle (/dev/cu.usbserial-1120) joins the production mesh as a host FTD, then sends,
# stage by stage: secured unicast (ping the parent), link-local multicast (ping ff02::1),
# realm-local multicast (ping ff03::1), a site-local UDP groupcast (the soak's traffic). After every
# stage: is the RCP still answering, do pings to the parent still work, what do the MAC counters say.
# Host logs at info level (set at run time; `-d` has no effect, openthread#13625).
#   sudo bash /Users/me/Projects/thread-rcp-firmware/scripts/tx-debug.sh
set -u
OTCLI=/Users/me/Projects/openthread-pr/build/posix/src/posix/ot-cli
PORT_DEV=/dev/cu.usbserial-1120
URL="spinel+hdlc+uart://${PORT_DEV}?uart-baudrate=460800"
LOGDIR=/Users/me/Projects/infra/ha/logs
NODE="${LOGDIR}/tx-debug-node.log"; NODE_ERR="${LOGDIR}/tx-debug-node.err"
DATA=/tmp/tx-debug-node; FIFO=/tmp/tx-debug.fifo
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
    echo "--- host log: warnings and worse"; grep -a '\[W\]\|\[C\]' "$NODE_ERR" | sed -E 's/^.*(\[[WC]\] )/  \1/' | sort | uniq -c | sort -rn | head -15
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

health() { # after a stage: RCP answers? unicast still works? counters
    local v p
    v=$(cli "rcp version" 20 | head -1); p=$(cli "ping $PARENT 8 2 0.3 64 1" 20 | grep -c 'bytes from')
    echo "    rcp answers: $([ -n "$v" ] && echo yes || echo NO); ping parent: $p/2"
    echo "    BR rx: $(prod_rx)"
    cli "counters mac" | grep -E 'TxTotal|TxBroadcast|TxUnicast|TxErrCca|TxErrAbort|TxErrBusyChannel|TxAcked|TxNoAckRequested|RxTotal' | tr -s ' ' | tr '\n' ';' | sed 's/^/    /'; echo
}
cli "txpower 10" >/dev/null; echo "txpower now $(cli txpower | head -1)"
echo "=== baseline"; health
echo "=== stage 1: secured unicast, 5 pings to the parent"; echo "    replies: $(cli "ping $PARENT 32 5 0.3 64 1" 30 | grep -c 'bytes from')/5"; health
echo "=== stage 2: link-local multicast, 3 pings to ff02::1"; echo "    replies: $(cli "ping ff02::1 32 3 0.5 64 1" 30 | grep -c 'bytes from')"; health
echo "=== stage 3: realm-local multicast, 3 pings to ff03::1"; echo "    replies: $(cli "ping ff03::1 32 3 0.5 64 1" 30 | grep -c 'bytes from')"; health
echo "=== stage 4: site-local UDP groupcast x5 (what the soak sends)"; cli "udp open" >/dev/null
for i in 1 2 3 4 5; do cli "udp send ff05::abcd 1234 dbg-$i" 20 >/dev/null; sleep 0.5; done; health
echo "=== done: state $(cli state 20 | head -1)"
