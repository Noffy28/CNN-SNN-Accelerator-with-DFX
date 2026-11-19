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

ROOT = Path(r"C:\Users\Chris\Documents\Vivado\pythontorch\SNN_guest_lecture\shapes_dataset\test")

SERIAL_PORT = "COM8"
BAUD_RATE = 4000000

MAX_IMAGES_PER_FOLDER = 1000

# Terminal output switches (the UART log file is always written in full)
VERBOSE = False            # True = print raw reply bytes and stray text
PRINT_EACH_IMAGE = True    # True = print one line for every image

IMG_H = 60
IMG_W = 80

T_STEPS = 5

GRID_H = 12
GRID_W = 16
N_FEATURES = GRID_H * GRID_W * 2

SOBEL_PERCENTILE = 90
ALPHA = 3.0

FEATURE_SCALE = 128

MAGIC = b"\xAA\x55"

# SNN reply from the FPGA (23 bytes total):
#   0xA5 | pred (1) | time_us (4, LE) | 4 x int32 logits (16, LE) | 0x5A
REPLY_BODY_BYTES = 22        # everything after the 0xA5 byte

CLASS_FOLDERS = [
    "circle",
    "figure_eight",
    "square",
    "triangle",
]

# Raw copy of EVERYTHING received on the UART (overwritten every run)
LOG_FILE = Path(__file__).resolve().parent / "fpga_snn_debug.log"


def vprint(*args, **kwargs):
    if VERBOSE:
        print(*args, **kwargs)


# ============================================================
# BACKGROUND UART LOGGER / READER
#
# One thread is the only reader of the serial port. It writes every
# received byte to the log file and hands the bytes to the main thread
# through a shared buffer.
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
# TRAINING-MATCHED FEATURE EXTRACTION
# ============================================================

def image_to_spikes(img_u8):

    img_u8 = cv2.resize(
        img_u8,
        (IMG_W, IMG_H),
        interpolation=cv2.INTER_LINEAR,
    )

    img = img_u8.astype(np.float32) / 255.0

    sobel_x = cv2.Sobel(img, cv2.CV_32F, 1, 0, ksize=3)
    sobel_y = cv2.Sobel(img, cv2.CV_32F, 0, 1, ksize=3)

    sobel_combined = sobel_x + sobel_y

    pos_edge = np.maximum(sobel_combined, 0)
    neg_edge = np.maximum(-sobel_combined, 0)

    pos_edge /= pos_edge.max() + 1e-8
    neg_edge /= neg_edge.max() + 1e-8

    on_mask = pos_edge > np.percentile(pos_edge, SOBEL_PERCENTILE)
    off_mask = neg_edge > np.percentile(neg_edge, SOBEL_PERCENTILE)

    spikes = np.zeros((T_STEPS, 2, IMG_H, IMG_W), dtype=np.float32)

    if T_STEPS == 1:
        spikes[0, 0, on_mask] = 1.0
        spikes[0, 1, off_mask] = 1.0
    else:
        on_time = (np.exp(-ALPHA * pos_edge) * (T_STEPS - 1)).astype(np.int32)
        off_time = (np.exp(-ALPHA * neg_edge) * (T_STEPS - 1)).astype(np.int32)

        ys, xs = np.where(on_mask)
        spikes[on_time[ys, xs], 0, ys, xs] = 1.0

        ys, xs = np.where(off_mask)
        spikes[off_time[ys, xs], 1, ys, xs] = 1.0

    return spikes


def spikes_to_sparse_regional_features(spikes):

    T, _, H, W = spikes.shape

    cell_h = H // GRID_H
    cell_w = W // GRID_W

    all_features = []

    for t in range(T):

        on_map = spikes[t, 0]
        off_map = spikes[t, 1]

        features = []

        for gy in range(GRID_H):
            y0 = gy * cell_h
            y1 = H if gy == GRID_H - 1 else (gy + 1) * cell_h

            for gx in range(GRID_W):
                x0 = gx * cell_w
                x1 = W if gx == GRID_W - 1 else (gx + 1) * cell_w

                on_cell = on_map[y0:y1, x0:x1]
                off_cell = off_map[y0:y1, x0:x1]

                area = float((y1 - y0) * (x1 - x0))

                features.append(float(on_cell.sum()) / area)
                features.append(float(off_cell.sum()) / area)

        all_features.append(features)

    return np.array(all_features, dtype=np.float32)


def extract_features(image_path: Path) -> np.ndarray:

    img = cv2.imread(str(image_path), cv2.IMREAD_GRAYSCALE)

    if img is None:
        raise RuntimeError(f"Could not read image: {image_path}")

    spikes = image_to_spikes(img)
    features_float = spikes_to_sparse_regional_features(spikes).reshape(-1)

    features_int16 = np.round(features_float * FEATURE_SCALE).astype(np.int16)

    assert features_int16.shape[0] == T_STEPS * N_FEATURES

    return features_int16


# ============================================================
# UART COMMUNICATION
# FPGA reply:
#   0xA5 <pred> <time_us uint32 LE> <4 x int32 logits LE> 0x5A
# ============================================================

def send_features_and_get_prediction(ser, features, logger):

    packet = MAGIC + struct.pack(
        "<" + "h" * len(features),
        *features.tolist(),
    )

    # Drop stale bytes (already saved in the log file) before sending.
    logger.clear()

    ser.write(packet)
    ser.flush()

    # The first frame after a CNN -> SNN switch also includes the partial
    # reconfiguration time, so allow plenty of time for the reply.
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
            f"Incomplete FPGA reply: received {len(response)} of "
            f"{REPLY_BODY_BYTES} bytes: {response.hex(' ')}"
        )

    pred = response[0]
    time_us = struct.unpack("<I", response[1:5])[0]
    logits = struct.unpack("<iiii", response[5:21])
    end = response[21]

    if end != 0x5A:
        raise RuntimeError(
            f"Bad FPGA reply end: 0x{end:02X}\n"
            f"Raw reply: a5 {response.hex(' ')}"
        )

    time_ms = time_us / 1000.0

    return pred, time_us, time_ms, logits


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
    print(" FPGA UART SNN TEST")
    print(" Training-matched preprocessing")
    print("=====================================")
    print()

    print(f"Dataset root : {ROOT}")
    print(f"Serial port  : {SERIAL_PORT}")
    print(f"Baud rate    : {BAUD_RATE}")
    print(f"Images/folder: {MAX_IMAGES_PER_FOLDER}")
    print(f"T_STEPS      : {T_STEPS}")
    print(f"Grid         : {GRID_H} x {GRID_W}")
    print(f"N_FEATURES   : {N_FEATURES}")
    print(f"Scale        : {FEATURE_SCALE}")
    print(f"UART log     : {LOG_FILE}")
    print()

    ser = serial.Serial(
        port=SERIAL_PORT,
        baudrate=BAUD_RATE,
        timeout=0.2,
        write_timeout=5,
    )

    # Start logging immediately: every byte from the board goes to the log.
    logger = UARTLogger(ser, LOG_FILE)
    logger.start()

    time.sleep(0.5)
    logger.clear()
    ser.reset_output_buffer()

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

            print()
            print(f"Processing class: {class_name}")
            print(f"Images selected: {len(image_files)}")
            print()

            for image_path in image_files:

                features = extract_features(image_path)

                pred, time_us, time_ms, logits = send_features_and_get_prediction(
                    ser,
                    features,
                    logger,
                )

                total += 1
                times_us.append(time_us)

                ok = (pred == true_label)
                correct += int(ok)

                if 0 <= pred < 4:
                    confusion[true_label, pred] += 1

                if PRINT_EACH_IMAGE:
                    print(
                        f"{image_path.name}: "
                        f"true={true_label} "
                        f"pred={pred} "
                        f"time={time_us} us "
                        f"({time_ms:.3f} ms) "
                        f"logits={logits} "
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
    print()

    print(f"Total   : {total}")
    print(f"Correct : {correct}")

    if total > 0:
        print(f"Accuracy: {correct / total * 100:.2f}%")

    if times_us:
        print(f"Avg time: {sum(times_us) / len(times_us):.1f} us")

    print()
    print("Confusion matrix")
    print("(rows=true, cols=pred)")
    print()
    print(confusion)
    print()
    print(f"UART bytes received: {logger.total_rx} (full log: {LOG_FILE})")


if __name__ == "__main__":
    main()
