#!/bin/bash
# Multi-day soak of OUR RCP firmware on the spare dongle (root): the gate before it goes on the
# production radio. /dev/cu.usbserial-1120 joins the production mesh as a host FTD (ot-cli) and,
# every PERIOD seconds, sends what the mesh sends: a secured unicast (ping to the parent), a
# site-local UDP groupcast (forwarded to the LAN by the border router), and every 6th round a
# realm-local multicast (ff03::1, the MPL pattern that first reproduced the stall). The host has no
# RCP restoration, so a stall ends ot-cli: that is counted as a stall and the node is restarted.
# Once an hour and at the end a summary line goes to logs/rcp-soak-summary.log. The dongle is never
# reset during the run; the firmware's own records are read afterwards with collect-report.py.
#   sudo bash /Users/me/Projects/thread-rcp-firmware/scripts/rcp-soak.sh        (HOURS=72 PERIOD=20)
#   sudo HOURS=1 bash .../rcp-soak.sh                                                (short trial)
set -u
OTCLI=/Users/me/Projects/openthread-pr/build/posix/src/posix/ot-cli
PORT_DEV=/dev/cu.usbserial-1120
URL="spinel+hdlc+uart://${PORT_DEV}?uart-baudrate=460800"
LOGDIR=/Users/me/Projects/infra/ha/logs
NODE="${LOGDIR}/rcp-soak-node.log"; NODE_ERR="${LOGDIR}/rcp-soak-node.err"; SUMMARY="${LOGDIR}/rcp-soak-summary.log"
DATA=/tmp/rcp-soak-node; FIFO=/tmp/rcp-soak.fifo
HOURS="${HOURS:-72}"; PERIOD="${PERIOD:-20}"
GROUP=ff05::abcd; GPORT=1234

[ "$(id -u)" -eq 0 ] || { echo "run with sudo" >&2; exit 1; }
[ -x "$OTCLI" ] || { echo "missing $OTCLI" >&2; exit 1; }
[ -e "$PORT_DEV" ] || { echo "no $PORT_DEV" >&2; exit 1; }
if lsof -t "$PORT_DEV" >/dev/null 2>&1; then echo "FAIL: $PORT_DEV is in use by: $(lsof -t "$PORT_DEV" | tr '\n' ' ')"; exit 1; fi
PROD_IF=""
for f in /var/run/openthread-utun*.sock; do [ -S "$f" ] && { PROD_IF=$(basename "$f" .sock | sed 's#^openthread-##'); break; }; done
AGENT=$(ps -o command= -p "$(pgrep -x otbr-agent | head -1)" 2>/dev/null | awk '{print $1}')
OTCTL="${AGENT%/src/agent/otbr-agent}/third_party/openthread/repo/src/posix/ot-ctl"
[ -n "$PROD_IF" ] && [ -x "$OTCTL" ] || { echo "production agent / ot-ctl not found" >&2; exit 1; }
DS=$("$OTCTL" -I "$PROD_IF" dataset active | tr -d '\r')
f() { echo "$DS" | awk -F': ' -v k="$1" '$1==k {print $2; exit}'; }
[ -n "$(f Channel)" ] || { echo "FAIL: could not read the production dataset" >&2; exit 1; }

mkdir -p "$DATA"; : >"$NODE"; : >"$NODE_ERR"
NPID=""; START=$(date +%s); DEADLINE=$((START + HOURS * 3600))
ROUNDS=0; PING_OK=0; PING_TOTAL=0; HOST_EXITS=0; LAST_SUMMARY=$START
note() { echo "$(date '+%m-%d %H:%M:%S') $*" | tee -a "$SUMMARY"; }

cli() { # $1 = command, $2 = max wait in quarter seconds (default 80)
    local before; [ -n "$NPID" ] && kill -0 "$NPID" 2>/dev/null || return 1
    before=$(wc -l <"$NODE"); printf '%s\n' "$1" >&3 2>/dev/null || return 1
    for _ in $(seq 1 "${2:-80}"); do
        sleep 0.25
        tail -n +$((before + 1)) "$NODE" | tr -d '\r' | sed 's/^\(> \)*//' | grep -q '^Done$\|^Error ' && break
        kill -0 "$NPID" 2>/dev/null || return 1
    done
    tail -n +$((before + 1)) "$NODE" | tr -d '\r' | sed 's/^\(> \)*//' | grep -v '^Done$\|^$'
}
first() { sed -n 1p; }

start_node() {
    rm -f "$FIFO"; mkfifo "$FIFO"
    ("$OTCLI" -v --data-path "$DATA" "$URL" <"$FIFO" >>"$NODE" 2>>"$NODE_ERR") &
    NPID=$!
    exec 3>"$FIFO"
    local n=0; while [ $n -lt 40 ] && ! tail -5 "$NODE" 2>/dev/null | grep -q '>'; do sleep 0.25; n=$((n + 1)); done; sleep 1
    cli "log level 4" >/dev/null
    for c in "dataset clear" "dataset channel $(f Channel)" "dataset panid $(f 'PAN ID')" "dataset extpanid $(f 'Ext PAN ID')" \
             "dataset networkkey $(f 'Network Key')" "dataset meshlocalprefix $(f 'Mesh Local Prefix' | sed 's,/64$,,')" \
             "dataset networkname $(f 'Network Name')" "dataset activetimestamp 1" "dataset commit active"; do cli "$c" >/dev/null; done
    cli "ifconfig up" >/dev/null; cli "thread start" >/dev/null
    local state=""; for _ in $(seq 1 60); do state=$(cli state | first); case "$state" in child | router) break ;; esac; sleep 2; done
    cli "udp open" >/dev/null
    note "node started: rcp $(cli 'rcp version' 20 | first | cut -c1-60), state ${state:-?}, rloc16 $(cli rloc16 | first), txpower $(cli txpower | first)"
    case "$state" in child | router) return 0 ;; *) return 1 ;; esac
}
stop_node() {
    [ -n "$NPID" ] || return 0
    printf 'thread stop\nexit\n' >&3 2>/dev/null; sleep 1; kill "$NPID" 2>/dev/null; wait "$NPID" 2>/dev/null
    exec 3>&- 2>/dev/null; rm -f "$FIFO"; NPID=""
}
summary() { # $1 label
    local now elapsed timeouts stuck state
    now=$(date +%s); elapsed=$(( (now - START) / 60 ))
    timeouts=$(grep -a -c 'radio tx timeout' "$NODE_ERR"); stuck=$(grep -a -c 'LOCAL tx stuck' "$NODE_ERR")
    state=$(cli state 20 | first)
    note "$1: ${elapsed} min, rounds $ROUNDS, parent pings ${PING_OK}/${PING_TOTAL}, host exits $HOST_EXITS, radio tx timeouts $timeouts, firmware stuck reports $stuck, state ${state:-<no answer>}"
    LAST_SUMMARY=$now
}
cleanup() {
    trap - EXIT INT TERM
    summary "=== soak ended"
    stop_node
    echo "logs: $SUMMARY (summary), $NODE_ERR (host), $NODE (cli); firmware records: python3 $(dirname "$0")/collect-report.py"
}
trap cleanup EXIT INT TERM

note "=== soak start: $HOURS h, one round every $PERIOD s, dongle $PORT_DEV, mesh $(f 'Network Name') channel $(f Channel)"
start_node || note "WARNING: node did not attach at start (state above); continuing, it may attach later"

while [ "$(date +%s)" -lt "$DEADLINE" ]; do
    if ! kill -0 "$NPID" 2>/dev/null; then
        HOST_EXITS=$((HOST_EXITS + 1))
        note "HOST EXITED (#$HOST_EXITS): $(grep -a 'radio tx timeout\|RadioSpinelNoResponse\|\[C\]' "$NODE_ERR" | tail -2 | sed -E 's/^.*> ?: //' | cut -c1-90 | tr '\n' ';')"
        exec 3>&- 2>/dev/null; rm -f "$FIFO"; NPID=""
        sleep 5; start_node || true
    fi
    ROUNDS=$((ROUNDS + 1))
    MLP=$(cli "ipaddr rloc" 20 | first | cut -d: -f1-4)
    PRLOC=$(cli parent 20 | awk -F': ' '/Rloc/ {print $2}' | sed 's/^0x//')
    if [ -n "$MLP" ] && [ -n "$PRLOC" ]; then
        PING_TOTAL=$((PING_TOTAL + 1))
        cli "ping ${MLP}:0:ff:fe00:${PRLOC} 32 1 1 64 1" 24 | grep -q 'bytes from' && PING_OK=$((PING_OK + 1))
    fi
    cli "udp send $GROUP $GPORT soak-$ROUNDS" 20 >/dev/null
    [ $((ROUNDS % 6)) -eq 0 ] && cli "ping ff03::1 16 1 1 64 1" 24 >/dev/null
    [ $(( $(date +%s) - LAST_SUMMARY )) -ge 3600 ] && summary "hourly"
    sleep "$PERIOD"
done
