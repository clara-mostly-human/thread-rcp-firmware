#!/usr/bin/env python3
"""Exercise the host->RCP serial path without root: N Spinel requests of a realistic size, one at a
time, each waiting for its reply. A request whose reply never comes is what the OpenThread host
reports as "Wait for response timeout" / "radio tx timeout". Then run collect-report.py to read the
USART overflow counter for this run."""
import os, sys, time, termios, fcntl, struct, select
DEV = '/dev/cu.usbserial-1120'; N = int(sys.argv[1]) if len(sys.argv) > 1 else 3000
PAD = int(sys.argv[2]) if len(sys.argv) > 2 else 120

def hdlc(payload):
    crc = 0xFFFF
    for b in payload:
        crc ^= b
        for _ in range(8): crc = (crc >> 1) ^ 0x8408 if crc & 1 else crc >> 1
    crc ^= 0xFFFF
    out = bytearray([0x7E])
    for b in payload + bytes([crc & 0xFF, crc >> 8]):
        out += bytes([0x7D, b ^ 0x20]) if b in (0x7E, 0x7D, 0x11, 0x13, 0xF8) else bytes([b])
    return bytes(out) + b'\x7e'

fd = os.open(DEV, os.O_RDWR | os.O_NOCTTY | os.O_NONBLOCK)
a = termios.tcgetattr(fd); a[0] = 0; a[1] = 0; a[3] = 0; a[2] = termios.CS8 | termios.CREAD | termios.CLOCAL
a[6][termios.VMIN] = 0; a[6][termios.VTIME] = 0
termios.tcsetattr(fd, termios.TCSANOW, a); fcntl.ioctl(fd, 0x80085402, struct.pack('L', 460800))
time.sleep(0.2)
while select.select([fd], [], [], 0.1)[0]: os.read(fd, 4096)

# PROP_VALUE_SET of an unknown property with PAD bytes of payload: about the size of a transmit
# request; the RCP answers every one with LAST_STATUS.
ok = lost = 0; t0 = time.time(); first_loss = None
for i in range(N):
    tid = 1 + (i % 15)
    frame = hdlc(bytes([0x80 | tid, 0x03, 0xBF, 0x7F]) + bytes((i + k) & 0xFF for k in range(PAD)))
    os.write(fd, frame)
    buf = b''; deadline = time.time() + 0.5
    while time.time() < deadline:
        if select.select([fd], [], [], 0.05)[0]:
            try: buf += os.read(fd, 4096)
            except BlockingIOError: pass
            if buf.count(b'\x7e') >= 2 and bytes([0x80 | tid]) in buf: break
    if bytes([0x80 | tid]) in buf: ok += 1
    else:
        lost += 1
        if first_loss is None: first_loss = i
os.close(fd)
print(f'{N} requests of ~{PAD + 8} bytes in {time.time() - t0:.1f} s: {ok} answered, {lost} unanswered'
      + (f' (first at #{first_loss})' if lost else ''))
