import os
import cv2
import numpy as np
import argparse

# Dataset paths
TEST_IMAGE_FOLDER = r"C:\Users\Chris\Documents\Vivado\pythontorch\SNN_guest_lecture\shapes_dataset\test"

OUTPUT_FOLDER = r"C:\Users\Chris\Documents\Vivado\pythontorch\SNN_guest_lecture\code\shapes_dataset_test"

# Must match the model trainer
CLASS_FOLDERS = [
    "circle",
    "figure_eight",
    "square",
    "triangle"
]

IMG_H = 60
IMG_W = 80

T = 5
GRID_H = 12
GRID_W = 16

SOBEL_PERCENTILE = 90
ALPHA = 3.0

N_FEATURES = GRID_H * GRID_W * 2


def image_to_spikes(img_u8):

    img_u8 = cv2.resize(
        img_u8,
        (IMG_W, IMG_H),
        interpolation=cv2.INTER_LINEAR
    )

    img = img_u8.astype(np.float32) / 255.0

    sobel_x = cv2.Sobel(
        img, cv2.CV_32F, 1, 0, ksize=3
    )

    sobel_y = cv2.Sobel(
        img, cv2.CV_32F, 0, 1, ksize=3
    )

    sobel_combined = sobel_x + sobel_y

    pos_edge = np.maximum(sobel_combined, 0)
    neg_edge = np.maximum(-sobel_combined, 0)

    pos_edge /= pos_edge.max() + 1e-8
    neg_edge /= neg_edge.max() + 1e-8

    on_mask = pos_edge > np.percentile(
        pos_edge, SOBEL_PERCENTILE
    )

    off_mask = neg_edge > np.percentile(
        neg_edge, SOBEL_PERCENTILE
    )

    spikes = np.zeros(
        (T, 2, IMG_H, IMG_W),
        dtype=np.float32
    )

    on_time = (
        np.exp(-ALPHA * pos_edge) * (T - 1)
    ).astype(np.int32)

    off_time = (
        np.exp(-ALPHA * neg_edge) * (T - 1)
    ).astype(np.int32)

    ys, xs = np.where(on_mask)
    spikes[on_time[ys, xs], 0, ys, xs] = 1

    ys, xs = np.where(off_mask)
    spikes[off_time[ys, xs], 1, ys, xs] = 1

    return spikes


def spikes_to_snn_mlp_features(spikes):

    cell_h = IMG_H // GRID_H
    cell_w = IMG_W // GRID_W

    on = spikes[:, 0].reshape(
        T, GRID_H, cell_h, GRID_W, cell_w
    )

    off = spikes[:, 1].reshape(
        T, GRID_H, cell_h, GRID_W, cell_w
    )

    on_density = on.mean(axis=(2, 4))
    off_density = off.mean(axis=(2, 4))

    features = np.stack(
        [on_density, off_density],
        axis=-1
    )

    features = features.reshape(T, N_FEATURES)

    return features.astype(np.float32)


def export_test_features(test_root, output_root):

    os.makedirs(output_root, exist_ok=True)

    total_exported = 0

    for class_name in CLASS_FOLDERS:

        input_folder = os.path.join(
            test_root, class_name
        )

        output_folder = os.path.join(
            output_root, class_name
        )

        os.makedirs(output_folder, exist_ok=True)

        if not os.path.isdir(input_folder):
            print("Missing class folder:", input_folder)
            continue

        for filename in sorted(os.listdir(input_folder)):

            if not filename.lower().endswith(
                (".png", ".jpg", ".jpeg", ".bmp")
            ):
                continue

            image_path = os.path.join(
                input_folder, filename
            )

            img = cv2.imread(
                image_path,
                cv2.IMREAD_GRAYSCALE
            )

            if img is None:
                print("Could not read:", image_path)
                continue

            # Convert image into five timesteps of spikes
            spikes = image_to_spikes(img)

            # Convert spikes into (5, 384) features
            features = spikes_to_snn_mlp_features(spikes)

            # Q7 quantization: only if HLS expects raw Q7 integers
            features_q7 = np.round(
                features * 128
            ).astype(np.int16)

            # Flatten timestep-major: 5 * 384 = 1920
            flat_features = features_q7.reshape(-1)

            output_name = (
                os.path.splitext(filename)[0] + ".txt"
            )

            output_path = os.path.join(
                output_folder, output_name
            )

            np.savetxt(
                output_path,
                flat_features,
                fmt="%d"
            )

            total_exported += 1

            print(
                f"Exported {class_name}/{output_name} "
                f"({len(flat_features)} values)"
            )

    print("\n================================")
    print("Feature export finished")
    print("Total exported:", total_exported)
    print("Expected values per file:", T * N_FEATURES)
    print("Output folder:", output_root)
    print("================================")


if __name__ == "__main__":
    export_test_features(
        TEST_IMAGE_FOLDER,
        OUTPUT_FOLDER
    )