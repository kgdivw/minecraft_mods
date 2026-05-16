"""Generate Superteams villager textures for Minecraft Bedrock Edition.

Layout: 64x64 player skin (geometry.humanoid).
- Head front: (8,8)-(15,15)
- Body front: (20,20)-(27,31)
- Right arm front: (44,20)-(47,31)
- Right leg front: (4,20)-(7,31)
"""

from PIL import Image, ImageDraw
import os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT_DIR = os.path.join(ROOT, "superteams", "RP", "textures", "entity")
ITEM_DIR = os.path.join(ROOT, "superteams", "RP", "textures", "items")


def rect(d, x1, y1, x2, y2, color):
    d.rectangle([x1, y1, x2, y2], fill=color)


def paint_humanoid(d, robe, robe_dark, accent, skin, hair, belt):
    """Paint a humanoid 64x64 skin with given palette."""
    # === HEAD ===
    # Head top (hair)
    rect(d, 8, 0, 15, 7, hair)
    # Head bottom (underside)
    rect(d, 16, 0, 23, 7, hair)
    # Head right (face side)
    rect(d, 0, 8, 7, 15, skin)
    # Head front (face)
    rect(d, 8, 8, 15, 15, skin)
    # Hair fringe
    rect(d, 8, 8, 15, 9, hair)
    # Eyes
    d.point((10, 12), fill=(0, 0, 0))
    d.point((13, 12), fill=(0, 0, 0))
    d.point((10, 11), fill=(255, 255, 255))
    d.point((13, 11), fill=(255, 255, 255))
    # Nose
    d.point((11, 13), fill=accent)
    d.point((12, 13), fill=accent)
    # Mouth
    rect(d, 10, 14, 13, 14, (90, 50, 40))
    # Head left
    rect(d, 16, 8, 23, 15, skin)
    rect(d, 16, 8, 23, 9, hair)
    # Head back (hair)
    rect(d, 24, 8, 31, 15, hair)

    # === BODY (torso) ===
    # Body top
    rect(d, 20, 16, 27, 19, robe_dark)
    # Body bottom
    rect(d, 28, 16, 35, 19, robe_dark)
    # Body front (robe)
    rect(d, 20, 20, 27, 31, robe)
    # Belt
    rect(d, 20, 26, 27, 27, belt)
    # Accent stripe
    rect(d, 23, 21, 24, 25, accent)
    # Body right
    rect(d, 16, 20, 19, 31, robe_dark)
    # Body left
    rect(d, 28, 20, 31, 31, robe_dark)
    # Body back
    rect(d, 32, 20, 39, 31, robe)
    rect(d, 32, 26, 39, 27, belt)

    # === RIGHT ARM ===
    # Top
    rect(d, 44, 16, 47, 19, robe)
    # Bottom
    rect(d, 48, 16, 51, 19, skin)
    # Right side
    rect(d, 40, 20, 43, 31, robe_dark)
    # Front (sleeve + hand)
    rect(d, 44, 20, 47, 27, robe)
    rect(d, 44, 28, 47, 31, skin)  # hand
    # Left side
    rect(d, 48, 20, 51, 31, robe_dark)
    # Back
    rect(d, 52, 20, 55, 27, robe)
    rect(d, 52, 28, 55, 31, skin)

    # === LEFT ARM (in 64x64 layout) ===
    # Top
    rect(d, 36, 48, 39, 51, robe)
    # Bottom
    rect(d, 40, 48, 43, 51, skin)
    # Right
    rect(d, 32, 52, 35, 63, robe_dark)
    # Front
    rect(d, 36, 52, 39, 59, robe)
    rect(d, 36, 60, 39, 63, skin)
    # Left
    rect(d, 40, 52, 43, 63, robe_dark)
    # Back
    rect(d, 44, 52, 47, 59, robe)
    rect(d, 44, 60, 47, 63, skin)

    # === RIGHT LEG ===
    # Top
    rect(d, 4, 16, 7, 19, (40, 30, 25))
    # Bottom
    rect(d, 8, 16, 11, 19, (40, 30, 25))
    # Right
    rect(d, 0, 20, 3, 31, (45, 35, 30))
    # Front (pants)
    rect(d, 4, 20, 7, 27, (60, 40, 30))
    # Shoes
    rect(d, 4, 28, 7, 31, (30, 20, 15))
    # Left
    rect(d, 8, 20, 11, 31, (45, 35, 30))
    # Back
    rect(d, 12, 20, 15, 27, (60, 40, 30))
    rect(d, 12, 28, 15, 31, (30, 20, 15))

    # === LEFT LEG ===
    rect(d, 20, 48, 23, 51, (40, 30, 25))
    rect(d, 24, 48, 27, 51, (40, 30, 25))
    rect(d, 16, 52, 19, 63, (45, 35, 30))
    rect(d, 20, 52, 23, 59, (60, 40, 30))
    rect(d, 20, 60, 23, 63, (30, 20, 15))
    rect(d, 24, 52, 27, 63, (45, 35, 30))
    rect(d, 28, 52, 31, 59, (60, 40, 30))
    rect(d, 28, 60, 31, 63, (30, 20, 15))


def make_villager(path, palette):
    img = Image.new("RGBA", (64, 64), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    paint_humanoid(d, **palette)
    img.save(path)
    print(f"Wrote {path}")


# Team palettes
TEAMS = {
    "team_fire": dict(
        robe=(230, 57, 70),       # Vibrant red
        robe_dark=(160, 30, 40),  # Dark red
        accent=(255, 183, 3),     # Yellow flame
        skin=(217, 174, 138),
        hair=(60, 30, 20),
        belt=(80, 30, 20),
    ),
    "team_ice": dict(
        robe=(168, 218, 220),     # Light blue
        robe_dark=(73, 134, 168),
        accent=(255, 255, 255),   # White ice accent
        skin=(217, 174, 138),
        hair=(29, 53, 87),
        belt=(40, 80, 110),
    ),
    "team_lightning": dict(
        robe=(255, 214, 10),      # Bright yellow
        robe_dark=(204, 153, 0),
        accent=(0, 53, 102),      # Dark navy lightning bolt
        skin=(217, 174, 138),
        hair=(30, 30, 30),
        belt=(70, 50, 20),
    ),
    "team_earth": dict(
        robe=(45, 106, 79),       # Forest green
        robe_dark=(20, 70, 50),
        accent=(119, 73, 54),     # Brown accent
        skin=(217, 174, 138),
        hair=(80, 50, 20),
        belt=(60, 35, 20),
    ),
    "neutral_villager": dict(
        robe=(160, 160, 165),     # Light gray
        robe_dark=(105, 105, 110),
        accent=(220, 220, 220),   # White accent
        skin=(217, 174, 138),
        hair=(70, 60, 50),
        belt=(60, 50, 40),
    ),
}


def make_sea_horse(path):
    """Generate a 128x64 horse texture (standard Bedrock horse layout).

    Use a deep ocean blue palette.
    Simplification: we fill the whole image with the team color,
    relying on Bedrock to remap UV. The horse will look uniformly colored.
    """
    img = Image.new("RGBA", (128, 64), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    body = (29, 53, 87)          # Deep navy
    body_light = (69, 123, 157)  # Lighter blue
    mane = (168, 218, 220)       # Light cyan mane
    hoof = (20, 30, 50)
    eye_white = (240, 240, 250)
    eye_black = (0, 0, 0)

    # Fill whole texture in body color first (helps any unexpected UV)
    rect(d, 0, 0, 127, 63, body)

    # === HORSE BODY (Bedrock horse layout, approximate) ===
    # The horse texture is divided into many parts. We paint clusters.
    # Body block (approx)
    rect(d, 0, 32, 127, 63, body)
    # Lighter underbelly
    rect(d, 30, 50, 90, 55, body_light)

    # Head/neck region
    rect(d, 0, 0, 60, 32, body)
    rect(d, 8, 12, 20, 24, body_light)  # face highlight

    # Mane
    rect(d, 56, 0, 64, 16, mane)
    rect(d, 0, 0, 8, 16, mane)

    # Hooves
    rect(d, 0, 56, 16, 63, hoof)
    rect(d, 16, 56, 32, 63, hoof)
    rect(d, 32, 56, 48, 63, hoof)

    # Eyes
    rect(d, 10, 10, 12, 12, eye_white)
    rect(d, 11, 11, 11, 11, eye_black)
    rect(d, 16, 10, 18, 12, eye_white)
    rect(d, 17, 11, 17, 11, eye_black)

    img.save(path)
    print(f"Wrote {path}")


def make_portal_marker(path):
    """Tiny transparent texture for invisible marker entity."""
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    img.save(path)
    print(f"Wrote {path}")


def main():
    os.makedirs(OUT_DIR, exist_ok=True)
    os.makedirs(ITEM_DIR, exist_ok=True)

    for team_id, palette in TEAMS.items():
        out = os.path.join(OUT_DIR, f"{team_id}.png")
        make_villager(out, palette)

    make_sea_horse(os.path.join(OUT_DIR, "sea_horse.png"))
    make_portal_marker(os.path.join(OUT_DIR, "portal_marker.png"))


if __name__ == "__main__":
    main()
