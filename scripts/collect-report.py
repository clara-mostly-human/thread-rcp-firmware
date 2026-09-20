#!/usr/bin/env python3
"""Collect the firmware's post-mortem report from the spare dongle. No root needed.

Pin-resets the chip through DTR/RTS into the Gecko bootloader (no intermediate application run),
starts the application (bootloader menu "2"), and prints the LOCAL lines the firmware logs about
the run before this boot (kept in the BURAM retention registers).
"""
import os, sys, time, re, termios, fcntl, struct, select
DEV = '/dev/cu.usbserial-1120'
IOSSIOSPEED = 0x80085402; TIOCMBIS = 0x8004746c; TIOCMBIC = 0x8004746b; DTR = 0x002; RTS = 0x004

import subprocess
# Collecting pin-resets the chip. Never do that under a running host (it cost a soak run once).
holders = subprocess.run(['lsof', DEV], capture_output=True, text=True).stdout.strip().splitlines()[1:]
if holders and '--force' not in sys.argv:
    sys.exit('refusing: %s is open by another process (a test is probably running):\n  %s\n'
             'wait for it to finish, or pass --force' % (DEV, '\n  '.join(h[:100] for h in holders)))
sys.argv = [a for a in sys.argv if a != '--force']

def open_port(baud):
    fd = os.open(DEV, os.O_RDWR | os.O_NOCTTY | os.O_NONBLOCK)
    a = termios.tcgetattr(fd); a[0] = 0; a[1] = 0; a[3] = 0; a[2] = termios.CS8 | termios.CREAD | termios.CLOCAL
    a[6][termios.VMIN] = 0; a[6][termios.VTIME] = 0
    termios.tcsetattr(fd, termios.TCSANOW, a); fcntl.ioctl(fd, IOSSIOSPEED, struct.pack('L', baud))
    return fd

def read_for(fd, secs):
    buf = b''; t = time.time()
    while time.time() - t < secs:
        if select.select([fd], [], [], 0.2)[0]:
            try: buf += os.read(fd, 4096)
            except BlockingIOError: pass
    return buf

fd = open_port(115200)
bit = lambda bits, on: fcntl.ioctl(fd, TIOCMBIS if on else TIOCMBIC, struct.pack('i', bits))
bit(DTR, False); bit(RTS, True); time.sleep(0.1); bit(DTR, True); bit(RTS, False); time.sleep(0.5); bit(DTR, False)
os.write(fd, b'\n'); time.sleep(0.3); os.write(fd, b'2'); time.sleep(0.3); read_for(fd, 0.3); os.close(fd)
fd = open_port(460800); buf = read_for(fd, float(sys.argv[1]) if len(sys.argv) > 1 else 8); os.close(fd)
lines = sorted({x.decode() for x in re.findall(rb'LOCAL [ -~]{8,}', buf)})
print('\n'.join(lines) if lines else '(no LOCAL lines; %d bytes read)' % len(buf))
