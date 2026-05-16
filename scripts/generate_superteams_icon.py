"""Generate pack icon for Superteams - quadrant logo with the 4 team colors."""

from PIL import Image, ImageDraw, ImageFont
import os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BP_ICON = os.path.join(ROOT, "superteams", "BP", "pack_icon.png")
RP_ICON = os.path.join(ROOT, "superteams", "RP", "pack_icon.png")


def make_icon(path):
    size = 256
    img = Image.new("RGB", (size, size), (40, 40, 50))
    d = ImageDraw.Draw(img)

    # 4 quadrants for the 4 teams
    red = (230, 57, 70)
    blue = (168, 218, 220)
    yellow = (255, 214, 10)
    green = (45, 106, 79)

    half = size // 2
    d.rectangle([0, 0, half, half], fill=red)        # NW = fire
    d.rectangle([half, 0, size, half], fill=blue)    # NE = ice
    d.rectangle([0, half, half, size], fill=yellow)  # SW = lightning
    d.rectangle([half, half, size, size], fill=green) # SE = earth

    # Diagonal cross lines for style
    d.line([(0, 0), (size, size)], fill=(20, 20, 30), width=4)
    d.line([(size, 0), (0, size)], fill=(20, 20, 30), width=4)

    # Center circle - "S" for Superteams
    cx, cy = size // 2, size // 2
    r = 50
    d.ellipse([cx - r, cy - r, cx + r, cy + r], fill=(20, 20, 30))
    # Letter S
    try:
        font = ImageFont.truetype("arialbd.ttf", 70)
    except Exception:
        try:
            font = ImageFont.truetype("DejaVuSans-Bold.ttf", 70)
        except Exception:
            font = ImageFont.load_default()
    text = "S"
    bbox = d.textbbox((0, 0), text, font=font)
    tw, th = bbox[2] - bbox[0], bbox[3] - bbox[1]
    d.text((cx - tw // 2 - bbox[0], cy - th // 2 - bbox[1]), text, fill=(255, 220, 100), font=font)

    img.save(path)
    print(f"Wrote {path}")


def main():
    os.makedirs(os.path.dirname(BP_ICON), exist_ok=True)
    os.makedirs(os.path.dirname(RP_ICON), exist_ok=True)
    make_icon(BP_ICON)
    make_icon(RP_ICON)


if __name__ == "__main__":
    main()
