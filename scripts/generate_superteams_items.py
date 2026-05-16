"""Generate 16x16 item textures for Superteams."""

from PIL import Image, ImageDraw
import os
import math

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ITEM_DIR = os.path.join(ROOT, "superteams", "RP", "textures", "items")


def make_soul_shard(path):
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    # Crystal diamond shape, purple/cyan
    outline = (60, 20, 90)
    body = (180, 100, 220)
    light = (230, 180, 255)
    d.polygon([(8, 1), (14, 8), (8, 15), (2, 8)], fill=body, outline=outline)
    d.polygon([(8, 1), (10, 6), (8, 7), (6, 6)], fill=light)
    d.line([(8, 4), (8, 13)], fill=light, width=1)
    img.save(path)
    print(f"Wrote {path}")


def make_respawn_token(path):
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    # Star/heart-like rebirth token, gold
    outline = (90, 60, 0)
    gold = (255, 200, 30)
    light = (255, 240, 150)
    # Star
    cx, cy = 8, 8
    pts = []
    for i in range(10):
        ang = -math.pi / 2 + i * math.pi / 5
        r = 6 if i % 2 == 0 else 2.5
        pts.append((cx + r * math.cos(ang), cy + r * math.sin(ang)))
    d.polygon(pts, fill=gold, outline=outline)
    # Center highlight
    d.ellipse([6, 6, 10, 10], fill=light)
    img.save(path)
    print(f"Wrote {path}")


def make_ball(path, base, glow, edge):
    """Generic ball with team color glow."""
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    # Sphere
    d.ellipse([2, 2, 13, 13], fill=base, outline=edge)
    # Highlight glow
    d.ellipse([5, 4, 9, 8], fill=glow)
    d.point((6, 5), fill=(255, 255, 255))
    # Soft outer aura
    d.point((1, 7), fill=glow)
    d.point((14, 7), fill=glow)
    d.point((7, 1), fill=glow)
    d.point((7, 14), fill=glow)
    img.save(path)
    print(f"Wrote {path}")


def main():
    os.makedirs(ITEM_DIR, exist_ok=True)

    make_soul_shard(os.path.join(ITEM_DIR, "soul_shard.png"))
    make_respawn_token(os.path.join(ITEM_DIR, "respawn_token.png"))

    # Fireball - red/orange with yellow glow
    make_ball(
        os.path.join(ITEM_DIR, "fireball_item.png"),
        base=(230, 57, 70),
        glow=(255, 200, 50),
        edge=(120, 20, 30),
    )
    # Ice ball - light blue with white glow
    make_ball(
        os.path.join(ITEM_DIR, "iceball_item.png"),
        base=(168, 218, 220),
        glow=(255, 255, 255),
        edge=(50, 100, 140),
    )
    # Thunderbolt - yellow with bright white glow
    make_ball(
        os.path.join(ITEM_DIR, "thunderbolt_item.png"),
        base=(255, 214, 10),
        glow=(255, 255, 200),
        edge=(120, 90, 0),
    )
    # Earth ball - green/brown with leaf glow
    make_ball(
        os.path.join(ITEM_DIR, "earthball_item.png"),
        base=(45, 106, 79),
        glow=(140, 200, 130),
        edge=(20, 60, 30),
    )


if __name__ == "__main__":
    main()
