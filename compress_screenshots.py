"""
Compress all README screenshots in-place (GIFs + PNGs).
Works on Windows, Mac, Linux — only needs Python + Pillow.

Install once:
    pip install pillow

Run from the repo root (same folder that contains the "screenshots" folder):
    python compress_screenshots.py
"""

import os
import shutil
from PIL import Image, ImageSequence

SCREENSHOTS_DIR = "screenshots"
BACKUP_DIR = "screenshots_backup"
MAX_WIDTH = 260  # 2x the 130px display size, plenty sharp, much smaller than originals


def backup_once():
    if not os.path.exists(BACKUP_DIR):
        shutil.copytree(SCREENSHOTS_DIR, BACKUP_DIR)
        print(f"Backed up originals to {BACKUP_DIR}/")
    else:
        print(f"Backup already exists at {BACKUP_DIR}/, skipping backup.")


def resize_dims(w, h, max_w):
    if w <= max_w:
        return w, h
    ratio = max_w / w
    return max_w, int(h * ratio)


def compress_png(path):
    before = os.path.getsize(path)
    img = Image.open(path)
    w, h = resize_dims(*img.size, MAX_WIDTH)
    if (w, h) != img.size:
        img = img.resize((w, h), Image.LANCZOS)
    if img.mode in ("RGB", "RGBA"):
        try:
            img = img.convert("RGBA").quantize(colors=128, method=Image.MEDIANCUT)
        except Exception:
            pass
    img.save(path, optimize=True)
    after = os.path.getsize(path)
    print(f"  {os.path.basename(path)}: {before//1024}KB -> {after//1024}KB")


def compress_gif(path):
    before = os.path.getsize(path)
    img = Image.open(path)
    frames = []
    durations = []
    w, h = resize_dims(*img.size, MAX_WIDTH)
    for frame in ImageSequence.Iterator(img):
        f = frame.convert("RGBA")
        if (w, h) != frame.size:
            f = f.resize((w, h), Image.LANCZOS)
        f = f.quantize(colors=64, method=Image.MEDIANCUT)
        frames.append(f)
        durations.append(frame.info.get("duration", 80))
    frames[0].save(
        path,
        save_all=True,
        append_images=frames[1:],
        duration=durations,
        loop=0,
        optimize=True,
        disposal=2,
    )
    after = os.path.getsize(path)
    print(f"  {os.path.basename(path)}: {before//1024}KB -> {after//1024}KB")


def main():
    if not os.path.isdir(SCREENSHOTS_DIR):
        print(f'No "{SCREENSHOTS_DIR}" folder found here. Run this from your repo root.')
        return

    backup_once()

    files = sorted(os.listdir(SCREENSHOTS_DIR))
    print(f"\nCompressing {len(files)} files...\n")

    for name in files:
        path = os.path.join(SCREENSHOTS_DIR, name)
        lower = name.lower()
        try:
            if lower.endswith(".png"):
                compress_png(path)
            elif lower.endswith(".gif"):
                compress_gif(path)
        except Exception as e:
            print(f"  Skipped {name}: {e}")

    before_total = sum(
        os.path.getsize(os.path.join(BACKUP_DIR, f)) for f in os.listdir(BACKUP_DIR)
    )
    after_total = sum(
        os.path.getsize(os.path.join(SCREENSHOTS_DIR, f)) for f in os.listdir(SCREENSHOTS_DIR)
    )
    print(f"\nDone. Total before: {before_total/1e6:.1f}MB -> after: {after_total/1e6:.1f}MB")
    print(f"Originals kept safe in {BACKUP_DIR}/ in case you want to revert.")


if __name__ == "__main__":
    main()