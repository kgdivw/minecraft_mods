"""Generate textures for the Tijger Mod (tiger fur on wolf UV, orange bow/arrow icons, pack icon).

The tiger entity reuses vanilla geometry.wolf (64x32 texture). We fill the whole
sheet with orange fur + black stripes so every UV region looks like tiger fur,
then paint the face and snout regions deliberately.

Wolf box-UV reference (cube at (u,v), size w,h,d -> front face at (u+d, v+d), size w x h):
- head:  uv (0,0)  size 6x6x4  -> front face (4,4)-(9,9)
- snout: uv (0,10) size 3x3x4  -> front face (4,14)-(6,16)
- mane:  uv (21,0) size 8x6x7  -> front face (28,7)-(35,12)
"""

from PIL import Image, ImageDraw
import os

ORANGE = (232, 132, 43)
DARK_ORANGE = (196, 100, 25)
BLACK = (25, 20, 15)
CREAM = (245, 230, 200)
YELLOW = (255, 214, 64)
PINK = (60, 40, 35)


def draw_rect(d, x1, y1, x2, y2, color):
    d.rectangle([x1, y1, x2, y2], fill=color)


def create_tiger_texture(output_path):
    """64x32 tiger fur on the wolf UV layout."""
    img = Image.new("RGBA", (64, 32), ORANGE)
    d = ImageDraw.Draw(img)

    # Black stripes over the whole sheet (covers body, legs, tail, ears)
    for x in range(2, 64, 5):
        d.line([(x, 0), (x, 31)], fill=BLACK, width=1)
        # small offset dashes for a more natural look
        if (x // 5) % 2 == 0:
            d.line([(x + 2, 4), (x + 2, 12)], fill=BLACK, width=1)
        else:
            d.line([(x + 2, 18), (x + 2, 27)], fill=BLACK, width=1)

    # Chest (mane front face) lighter
    draw_rect(d, 28, 9, 35, 12, CREAM)
    d.line([(30, 9), (30, 12)], fill=DARK_ORANGE, width=1)
    d.line([(33, 9), (33, 12)], fill=DARK_ORANGE, width=1)

    # -- HEAD front face (4,4)-(9,9) --
    draw_rect(d, 4, 4, 9, 9, ORANGE)
    # forehead stripes
    d.point((5, 4), fill=BLACK)
    d.point((8, 4), fill=BLACK)
    d.point((6, 5), fill=BLACK)
    d.point((7, 5), fill=BLACK)
    # eyes (yellow with black pupil)
    d.point((5, 6), fill=YELLOW)
    d.point((8, 6), fill=YELLOW)
    d.point((5, 7), fill=BLACK)
    d.point((8, 7), fill=BLACK)
    # white cheeks
    d.point((4, 8), fill=CREAM)
    d.point((9, 8), fill=CREAM)
    d.point((4, 9), fill=CREAM)
    d.point((9, 9), fill=CREAM)

    # -- SNOUT front face (4,14)-(6,16) --
    draw_rect(d, 4, 14, 6, 16, CREAM)
    d.point((5, 14), fill=PINK)  # nose
    # snout sides/top (rest of the snout cube UV area) cream-ish
    draw_rect(d, 0, 14, 3, 16, CREAM)
    draw_rect(d, 7, 14, 13, 16, CREAM)
    draw_rect(d, 4, 10, 9, 13, ORANGE)

    img.save(output_path)
    print(f"Created {output_path}")


def create_arrow_entity_texture(output_path):
    """16x16 texture for the arrow projectile cube."""
    img = Image.new("RGBA", (16, 16), ORANGE)
    d = ImageDraw.Draw(img)
    for x in range(1, 16, 4):
        d.line([(x, 0), (x, 15)], fill=DARK_ORANGE, width=1)
    img.save(output_path)
    print(f"Created {output_path}")


def create_bow_icon(output_path):
    """16x16 orange bow item icon."""
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    # bow limb: quarter arc from lower-left to upper-right area
    d.arc([2, 2, 24, 24], start=180, end=270, fill=ORANGE, width=2)
    d.arc([3, 3, 23, 23], start=180, end=270, fill=DARK_ORANGE, width=1)
    # string
    d.line([(2, 13), (13, 2)], fill=(220, 220, 220), width=1)
    # grip
    d.point((3, 8), fill=BLACK)
    d.point((3, 9), fill=BLACK)
    img.save(output_path)
    print(f"Created {output_path}")


def create_arrow_icon(output_path):
    """16x16 orange arrow item icon."""
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    # shaft (diagonal)
    d.line([(3, 12), (11, 4)], fill=ORANGE, width=2)
    # arrow head
    d.point((12, 3), fill=(90, 90, 90))
    d.point((13, 2), fill=(90, 90, 90))
    d.point((13, 3), fill=(120, 120, 120))
    d.point((12, 2), fill=(120, 120, 120))
    # fletching (white feathers)
    d.point((2, 13), fill=(240, 240, 240))
    d.point((3, 13), fill=(240, 240, 240))
    d.point((2, 12), fill=(240, 240, 240))
    d.point((4, 14), fill=(240, 240, 240))
    img.save(output_path)
    print(f"Created {output_path}")


def create_pack_icon(output_path):
    """128x128 tiger face pack icon."""
    img = Image.new("RGBA", (128, 128), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)

    # head
    d.ellipse([14, 14, 114, 114], fill=ORANGE)
    # ears
    d.ellipse([10, 6, 42, 38], fill=ORANGE)
    d.ellipse([86, 6, 118, 38], fill=ORANGE)
    d.ellipse([18, 14, 34, 30], fill=BLACK)
    d.ellipse([94, 14, 110, 30], fill=BLACK)

    # stripes on the sides of the face
    for i, y in enumerate(range(30, 95, 16)):
        w = 18 - (i % 2) * 6
        draw_rect(d, 14, y, 14 + w, y + 6, BLACK)
        draw_rect(d, 114 - w, y, 114, y + 6, BLACK)
    # forehead stripes
    draw_rect(d, 60, 16, 68, 40, BLACK)
    draw_rect(d, 46, 20, 52, 38, BLACK)
    draw_rect(d, 76, 20, 82, 38, BLACK)

    # eyes
    d.ellipse([38, 50, 56, 66], fill=(255, 255, 255))
    d.ellipse([72, 50, 90, 66], fill=(255, 255, 255))
    d.ellipse([44, 53, 54, 65], fill=YELLOW)
    d.ellipse([74, 53, 84, 65], fill=YELLOW)
    d.ellipse([47, 56, 52, 63], fill=BLACK)
    d.ellipse([77, 56, 82, 63], fill=BLACK)

    # muzzle
    d.ellipse([44, 72, 84, 106], fill=CREAM)
    # nose
    d.polygon([(58, 80), (70, 80), (64, 90)], fill=(40, 30, 25))
    # mouth
    d.line([(64, 90), (64, 96)], fill=(40, 30, 25), width=2)
    d.arc([54, 88, 64, 102], start=0, end=90, fill=(40, 30, 25), width=2)
    d.arc([64, 88, 74, 102], start=90, end=180, fill=(40, 30, 25), width=2)

    img.save(output_path)
    print(f"Created {output_path}")


if __name__ == "__main__":
    base = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    mod = os.path.join(base, "tijger_mod")

    os.makedirs(os.path.join(mod, "RP", "textures", "entity"), exist_ok=True)
    os.makedirs(os.path.join(mod, "RP", "textures", "items"), exist_ok=True)

    create_tiger_texture(os.path.join(mod, "RP", "textures", "entity", "tijger.png"))
    create_arrow_entity_texture(os.path.join(mod, "RP", "textures", "entity", "oranje_pijl.png"))
    create_bow_icon(os.path.join(mod, "RP", "textures", "items", "oranje_boog.png"))
    create_arrow_icon(os.path.join(mod, "RP", "textures", "items", "oranje_pijl.png"))
    create_pack_icon(os.path.join(mod, "BP", "pack_icon.png"))
    create_pack_icon(os.path.join(mod, "RP", "pack_icon.png"))
    print("All tijger textures generated!")
