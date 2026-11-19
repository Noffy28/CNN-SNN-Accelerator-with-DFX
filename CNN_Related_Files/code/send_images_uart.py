#!/usr/bin/env python3

from pathlib import Path
import struct
import time
import threading

import cv2
import numpy as np
import serial


# ============================================================
# CONFIGURATION
# ============================================================

ROOT = Path(
    r"C:\Users\Chris\Documents\Vivado\pythontorch\SNN_guest_lecture\shapes_dataset\test"
)

SERIAL_PORT = "COM8"
BAUD_RATE = 4000000

MAX_IMAGES_PER_FOLDER = 1000

# Terminal output switches (the UART log file is always written in full)
VERBOSE = False            # True = print the raw UART debug blocks
PRINT_EACH_IMAGE = True    # True = print one line for every image

IMG_H = 60
IMG_W = 80
N_PIXELS = IMG_H * IMG_W
RX_BYTES = N_PIXELS * 2

FRAME_START = b"\xA6\x6A"

# CNN reply from the FPGA (15 bytes total):
#   0xA5 | pred (1) | time_us (4, LE) | 4 x int16 logits (8, LE) | 0x5A
REPLY_BODY_BYTES = 14        # everything after the 0xA5 byte

CLASS_FOLDERS = [
    "circle",
    "figure_eight",
    "square",
    "triangle",
]

# Raw copy of EVERYTHING received on the UART (overwritten every run)
LOG_FILE = Path(__file__).resolve().parent / "fpga_debug.log"


def vprint(*args, **kwargs):
    if VERBOSE:
        print(*args, **kwargs)


# ============================================================
# BACKGROUND UART LOGGER / READER
# ============================================================

class UARTLogger(threading.Thread):

    def __init__(self, ser, log_path):
        super().__init__(daemon=True)
        self.ser = ser
        self.log_file = open(log_path, "wb", buffering=0)
        self.cond = threading.Condition()
        self.buf = bytearray()
        self.running = True
        self.total_rx = 0

    def run(self):
        while self.running:
            try:
                data = self.ser.read(self.ser.in_waiting or 1)
            except (serial.SerialException, OSError):
                break

            if not data:
                continue

            self.log_file.write(data)

            with self.cond:
                self.buf.extend(data)
                self.total_rx += len(data)
                self.cond.notify_all()

    def stop(self):
        self.running = False
        self.join(timeout=1.0)
        self.log_file.close()

    def clear(self):
        with self.cond:
            self.buf.clear()

    def wait_for_marker(self, marker, timeout_s):
        deadline = time.time() + timeout_s

        with self.cond:
            while True:
                idx = self.buf.find(bytes([marker]))

                if idx >= 0:
                    preamble = bytes(self.buf[:idx])
                    del self.buf[:idx + 1]
                    return preamble, True

                remaining = deadline - time.time()

                if remaining <= 0:
                    return bytes(self.buf), False

                self.cond.wait(timeout=remaining)

    def read_exact(self, count, timeout_s):
        deadline = time.time() + timeout_s

        with self.cond:
            while len(self.buf) < count:
                remaining = deadline - time.time()

                if remaining <= 0:
                    break

                self.cond.wait(timeout=remaining)

            n = min(count, len(self.buf))
            data = bytes(self.buf[:n])
            del self.buf[:n]
            return data


# ============================================================
# IMAGE PREPROCESSING
# ============================================================

def image_to_q8_8_60x80(image_path: Path) -> np.ndarray:
    img = cv2.imread(str(image_path), cv2.IMREAD_GRAYSCALE)

    if img is None:
        raise RuntimeError(f"Could not read image: {image_path}")

    if img.shape != (IMG_H, IMG_W):
        img = cv2.resize(
            img,
            (IMG_W, IMG_H),
            interpolation=cv2.INTER_LINEAR
        )

    img_u8 = img.astype(np.uint8).reshape(-1)

    px = img_u8.astype(np.int32)
    q = ((1024 * px + 127) // 255 - 512).astype(np.int32)
    q = np.clip(q, -32768, 32767).astype(np.int16)

    assert q.shape[0] == N_PIXELS

    return q


# ============================================================
# UART COMMUNICATION
# ============================================================

def send_image_and_get_prediction(ser, q_img, logger):

    payload = q_img.astype("<i2", copy=False).tobytes(order="C")

    if len(payload) != RX_BYTES:
        raise RuntimeError(
            f"Bad payload size: {len(payload)} != {RX_BYTES}"
        )

    packet = FRAME_START + struct.pack("<H", len(payload)) + payload

    vprint("\n========== UART DEBUG ==========")
    vprint(f"TX total        : {len(packet)} bytes")

    # Drop stale bytes (already saved in the log file) before sending.
    logger.clear()

    ser.write(packet)
    ser.flush()

    preamble, found = logger.wait_for_marker(0xA5, timeout_s=10.0)

    if not found:
        raise RuntimeError(
            "Timeout waiting for FPGA response marker 0xA5\n"
            f"Bytes received meanwhile ({len(preamble)}): {preamble.hex(' ')}"
        )

    if preamble:
        vprint(f"Bytes before A5 ({len(preamble)}): {preamble.hex(' ')}")
        vprint(f"As text         : {preamble.decode(errors='replace')!r}")

    response = logger.read_exact(REPLY_BODY_BYTES, timeout_s=2.0)

    vprint(f"Response HEX : {(bytes([0xA5]) + response).hex(' ')}")

    if len(response) != REPLY_BODY_BYTES:
        raise RuntimeError(
            f"Incomplete FPGA response: received {len(response)} of "
            f"{REPLY_BODY_BYTES} bytes: {response.hex(' ')}"
        )

    pred = response[0]
    time_us = struct.unpack("<I", response[1:5])[0]
    logits = struct.unpack("<hhhh", response[5:13])
    end = response[13]

    if end != 0x5A:
        raise RuntimeError(
            f"Bad FPGA response end marker: 0x{end:02X}\n"
            f"Raw reply: a5 {response.hex(' ')}"
        )

    return pred, time_us, time_us / 1000.0, logits


# ============================================================
# LABELS
# ============================================================

def label_from_folder(folder_name: str) -> int:
    return CLASS_FOLDERS.index(folder_name)


# ============================================================
# MAIN
# ============================================================

def main():

    print()
    print("=====================================")
    print(" FPGA UART CNN TEST")
    print(" Q8.8 int16 60x80 image sender")
    print("=====================================")
    print()

    print(f"Dataset root : {ROOT}")
    print(f"Serial port  : {SERIAL_PORT}")
    print(f"Baud rate    : {BAUD_RATE}")
    print(f"Images/folder: {MAX_IMAGES_PER_FOLDER}")
    print(f"Image size   : {IMG_H} x {IMG_W}")
    print(f"TX bytes/img : {RX_BYTES}")
    print(f"Debug log    : {LOG_FILE}")
    print()

    ser = serial.Serial(
        port=SERIAL_PORT,
        baudrate=BAUD_RATE,
        timeout=0.2,
        write_timeout=5,
        xonxoff=False,
        rtscts=False,
        dsrdtr=False,
    )

    logger = UARTLogger(ser, LOG_FILE)
    logger.start()

    time.sleep(0.2)

    total = 0
    correct = 0
    times_us = []
    confusion = np.zeros((4, 4), dtype=int)

    try:

        for class_name in CLASS_FOLDERS:

            class_dir = ROOT / class_name

            if not class_dir.exists():
                print(f"Skipping missing folder: {class_dir}")
                continue

            true_label = label_from_folder(class_name)

            image_files = sorted(
                list(class_dir.glob("*.jpg")) +
                list(class_dir.glob("*.jpeg")) +
                list(class_dir.glob("*.png")) +
                list(class_dir.glob("*.bmp"))
            )[:MAX_IMAGES_PER_FOLDER]


            class_total = 0
            class_correct = 0

            for image_path in image_files:

                q_img = image_to_q8_8_60x80(image_path)

                pred, time_us, time_ms, logits = (
                    send_image_and_get_prediction(ser, q_img, logger)
                )

                total += 1
                class_total += 1
                times_us.append(time_us)

                ok = (pred == true_label)
                correct += int(ok)
                class_correct += int(ok)

                if 0 <= pred < 4:
                    confusion[true_label, pred] += 1

                if PRINT_EACH_IMAGE:
                    print(
                        f"{image_path.name}: "
                        f"true={true_label} "
                        f"pred={pred} "
                        f"logits={logits} "
                        f"time={time_us} us "
                        f"({time_ms:.6f} ms) "
                        f"{'OK' if ok else 'WRONG'}"
                    )

    except Exception as e:
        print()
        print("=====================================")
        print(" FPGA TEST ERROR")
        print("=====================================")
        print(str(e))
        print(f"UART log: {LOG_FILE}")

    finally:
        logger.stop()
        ser.close()

    print()
    print("=====================================")
    print(" FINAL RESULTS")
    print("=====================================")
    print(f"Total   : {total}")
    print(f"Correct : {correct}")

    if total > 0:
        print(f"Accuracy: {correct / total * 100:.2f}%")

    if times_us:
        print(f"Avg time: {sum(times_us) / len(times_us):.1f} us")

    print()
    print("Confusion matrix (rows=true, cols=pred)")
    print(confusion)
    print()
    print(f"UART bytes received: {logger.total_rx} (full log: {LOG_FILE})")


if __name__ == "__main__":
    main()
