#!/usr/bin/env python3
"""Inspect and create Gecko Bootloader (GBL) upgrade files without Simplicity Commander.

A GBL file is a sequence of tags: <u32 id><u32 length><payload>, little endian.
An unsigned, unencrypted application upgrade needs four of them:

    HEADER            version 0x03000000, type 0
    APPLICATION_INFO  the 28 bytes of ApplicationData_t from the image's
                      ApplicationProperties_t (type, version, capabilities, product id)
    PROG              <u32 flash address><bytes>, one per contiguous region
    END               <u32 crc32> over every byte before it, the END tag's own
                      id and length included (zlib's CRC-32)

Usage:
    gbl.py inspect <file.gbl>
    gbl.py pack <image.s37> <out.gbl> [--app-start 0x08006000]
"""
import argparse
import struct
import sys
import zlib

TAG_HEADER = 0x03A617EB
TAG_APP_INFO = 0xF40A0AF4
TAG_PROG = 0xFE0101FE
TAG_PROG_LZMA = 0xFD0303FD
TAG_PROG_LZ4 = 0xFD0505FD
TAG_END = 0xFC0404FC
NAMES = {
    TAG_HEADER: "HEADER",
    TAG_APP_INFO: "APPLICATION_INFO",
    TAG_PROG: "PROG",
    TAG_PROG_LZMA: "PROG_LZMA",
    TAG_PROG_LZ4: "PROG_LZ4",
    TAG_END: "END",
    0xF50909F5: "BOOTLOADER",
    0xF60808F6: "METADATA",
    0xF70A0AF7: "SIGNATURE_ECDSA_P256",
    0xF30B0BF3: "CERTIFICATE_ECDSA_P256",
    0x5EA617EB: "SE_UPGRADE",
    0xFA0606FA: "ENCRYPTION_HEADER",
    0xF90707F9: "ENCRYPTION_INIT",
}

# ApplicationProperties_t starts with this 16-byte magic; ApplicationData_t follows
# the magic (16) and structVersion (4) and signature type/location (8).
APP_PROPERTIES_MAGIC = bytes(
    [0x13, 0xB7, 0x79, 0xFA, 0xC9, 0x25, 0xDD, 0xB7, 0xAD, 0xF3, 0xCF, 0xE0, 0xF1, 0xB6, 0x14, 0xB8]
)
APP_DATA_OFFSET = 16 + 4 + 4 + 4
APP_DATA_SIZE = 28


def tags(data):
    offset = 0
    while offset < len(data):
        tag, length = struct.unpack_from("<II", data, offset)
        yield offset, tag, data[offset + 8 : offset + 8 + length]
        offset += 8 + length


def inspect(path):
    data = open(path, "rb").read()
    print(f"{path}: {len(data)} bytes")
    ok = False
    for offset, tag, body in tags(data):
        note = ""
        if tag == TAG_HEADER:
            note = "version=0x%08x type=0x%08x" % struct.unpack("<II", body)
        elif tag == TAG_APP_INFO:
            kind, version, caps = struct.unpack_from("<III", body)
            note = f"type=0x{kind:x} version=0x{version:x} capabilities=0x{caps:x} product={body[12:28].hex()}"
        elif tag in (TAG_PROG, TAG_PROG_LZMA, TAG_PROG_LZ4):
            note = "flash address=0x%08x, %d payload bytes" % (struct.unpack_from("<I", body)[0], len(body) - 4)
        elif tag == TAG_END:
            stored = struct.unpack("<I", body)[0]
            actual = zlib.crc32(data[: offset + 8]) & 0xFFFFFFFF
            ok = stored == actual
            note = f"crc=0x{stored:08x} ({'ok' if ok else 'MISMATCH, computed 0x%08x' % actual})"
        print(f"  0x{tag:08x} {NAMES.get(tag, '?'):<24} len={len(body):<8} {note}")
    return 0 if ok else 1


def read_s37(path):
    """Return {address: bytes} of contiguous regions from a Motorola S-record file."""
    memory = {}
    for line in open(path):
        line = line.strip()
        kind = line[:2]
        if kind not in ("S1", "S2", "S3"):
            continue
        raw = bytes.fromhex(line[2:])
        if (sum(raw) & 0xFF) != 0xFF:
            sys.exit(f"bad S-record checksum: {line[:20]}...")
        addr_len = {"S1": 2, "S2": 3, "S3": 4}[kind]
        address = int.from_bytes(raw[1 : 1 + addr_len], "big")
        for i, byte in enumerate(raw[1 + addr_len : -1]):
            memory[address + i] = byte
    regions, start, chunk = {}, None, bytearray()
    for address in sorted(memory):
        if start is not None and address == start + len(chunk):
            chunk.append(memory[address])
        else:
            if start is not None:
                regions[start] = bytes(chunk)
            start, chunk = address, bytearray([memory[address]])
    if start is not None:
        regions[start] = bytes(chunk)
    return regions


def tag_bytes(tag, body):
    return struct.pack("<II", tag, len(body)) + body


def pack(s37, out, app_start):
    regions = {a: b for a, b in read_s37(s37).items() if a >= app_start}
    if not regions:
        sys.exit(f"no data at or above 0x{app_start:08x} in {s37}")
    if min(regions) != app_start:
        sys.exit(f"image starts at 0x{min(regions):08x}, expected 0x{app_start:08x}: wrong bootloader size?")
    image = b"".join(regions[a] for a in sorted(regions))
    index = image.find(APP_PROPERTIES_MAGIC)
    if index < 0:
        sys.exit("ApplicationProperties_t not found (is the bootloader_interface component in the project?)")
    app_data = image[index + APP_DATA_OFFSET : index + APP_DATA_OFFSET + APP_DATA_SIZE]

    gbl = tag_bytes(TAG_HEADER, struct.pack("<II", 0x03000000, 0))
    gbl += tag_bytes(TAG_APP_INFO, app_data)
    for address in sorted(regions):
        data = regions[address]
        data += b"\xff" * (-len(data) % 4)  # the bootloader writes whole words
        gbl += tag_bytes(TAG_PROG, struct.pack("<I", address) + data)
    gbl += struct.pack("<II", TAG_END, 4)
    gbl += struct.pack("<I", zlib.crc32(gbl) & 0xFFFFFFFF)
    open(out, "wb").write(gbl)
    print(f"wrote {out}: {len(gbl)} bytes, {len(regions)} region(s) from 0x{min(regions):08x}")
    return inspect(out)


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="command", required=True)
    sub.add_parser("inspect").add_argument("file")
    p = sub.add_parser("pack")
    p.add_argument("s37")
    p.add_argument("out")
    p.add_argument("--app-start", type=lambda v: int(v, 0), default=0x08006000)
    args = parser.parse_args()
    sys.exit(inspect(args.file) if args.command == "inspect" else pack(args.s37, args.out, args.app_start))


if __name__ == "__main__":
    main()
