"""Generate ninja skin textures for Minecraft Bedrock Edition (64x64 player skin format).

Minecraft skin layout (64x64):
- Head front: (8,8)-(15,15)
- Head top: (8,0)-(15,7)
- Head right: (0,8)-(7,15)
- Head left: (16,8)-(23,15)
- Head back: (24,8)-(31,15)
- Head bottom: (16,0)-(23,7)
- Body front: (20,20)-(27,31)
- Body top: (20,16)-(27,19)
- Body right: (16,20)-(19,31)
- Body left: (28,20)-(31,31)
- Body back: (32,20)-(39,31)
- Body bottom: (28,16)-(31,19)
- Right arm front: (44,20)-(47,31)
- Right arm top: (44,16)-(47,19)
- Right arm right: (40,20)-(43,31)
- Right arm left: (48,20)-(51,31)
- Right arm back: (52,20)-(55,31)
- Left arm front: (36,52)-(39,63)
- Left arm top: (36,48)-(39,51)
- Left arm right: (32,52)-(35,63)
- Left arm left: (40,52)-(43,63)
- Left arm back: (44,52)-(47,63)
- Right leg front: (4,20)-(7,31)
- Right leg top: (4,16)-(7,19)
- Right leg right: (0,20)-(3,31)
- Right leg left: (8,20)-(11,31)
- Right leg back: (12,20)-(15,31)
- Left leg front: (20,52)-(23,63)
- Left leg top: (20,48)-(23,51)
- Left leg right: (16,52)-(19,63)
- Left leg left: (24,52)-(27,63)
- Left leg back: (28,52)-(31,63)
"""

from PIL import Image, ImageDraw
import os

def draw_rect(draw, x1, y1, x2, y2, color):
    """Draw a filled rectangle."""
    draw.rectangle([x1, y1, x2, y2], fill=color)

def create_good_ninja(output_path):
    """Green ninja - friendly trader."""
    img = Image.new("RGBA", (64, 64), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)

    dark_green = (13, 61, 24)
    green = (46, 139, 87)
    light_green = (60, 170, 100)
    skin = (200, 170, 130)
    white = (255, 255, 255)
    black = (0, 0, 0)
    dark = (10, 40, 15)
    belt = (139, 69, 19)

    # -- HEAD --
    # Head top
    draw_rect(d, 8, 0, 15, 7, dark_green)
    # Head bottom
    draw_rect(d, 16, 0, 23, 7, dark_green)
    # Head right
    draw_rect(d, 0, 8, 7, 15, dark_green)
    # Head front - ninja mask with eyes visible
    draw_rect(d, 8, 8, 15, 15, dark_green)
    # Eye area (skin showing)
    draw_rect(d, 9, 10, 14, 11, skin)
    # Eyes
    d.point((10, 10), fill=white)
    d.point((10, 11), fill=black)
    d.point((13, 10), fill=white)
    d.point((13, 11), fill=black)
    # Head left
    draw_rect(d, 16, 8, 23, 15, dark_green)
    # Head back
    draw_rect(d, 24, 8, 31, 15, dark_green)

    # -- BODY --
    # Body top
    draw_rect(d, 20, 16, 27, 19, green)
    # Body right
    draw_rect(d, 16, 20, 19, 31, green)
    # Body front - ninja outfit with belt
    draw_rect(d, 20, 20, 27, 31, green)
    draw_rect(d, 20, 26, 27, 27, belt)  # belt
    draw_rect(d, 20, 20, 27, 21, light_green)  # collar
    # Body left
    draw_rect(d, 28, 20, 31, 31, green)
    # Body bottom
    draw_rect(d, 28, 16, 31, 19, green)
    # Body back
    draw_rect(d, 32, 20, 39, 31, green)
    draw_rect(d, 32, 26, 39, 27, belt)

    # -- RIGHT ARM --
    draw_rect(d, 44, 16, 47, 19, green)  # top
    draw_rect(d, 40, 20, 43, 31, green)  # right
    draw_rect(d, 44, 20, 47, 31, green)  # front
    draw_rect(d, 44, 28, 47, 31, skin)   # hands
    draw_rect(d, 48, 20, 51, 31, green)  # left
    draw_rect(d, 52, 20, 55, 31, green)  # back

    # -- LEFT ARM --
    draw_rect(d, 36, 48, 39, 51, green)  # top
    draw_rect(d, 32, 52, 35, 63, green)  # right
    draw_rect(d, 36, 52, 39, 63, green)  # front
    draw_rect(d, 36, 60, 39, 63, skin)   # hands
    draw_rect(d, 40, 52, 43, 63, green)  # left
    draw_rect(d, 44, 52, 47, 63, green)  # back

    # -- RIGHT LEG --
    draw_rect(d, 4, 16, 7, 19, dark_green)   # top
    draw_rect(d, 0, 20, 3, 31, dark_green)    # right
    draw_rect(d, 4, 20, 7, 31, dark_green)    # front
    draw_rect(d, 4, 30, 7, 31, dark)          # shoes
    draw_rect(d, 8, 20, 11, 31, dark_green)   # left
    draw_rect(d, 12, 20, 15, 31, dark_green)  # back

    # -- LEFT LEG --
    draw_rect(d, 20, 48, 23, 51, dark_green)  # top
    draw_rect(d, 16, 52, 19, 63, dark_green)  # right
    draw_rect(d, 20, 52, 23, 63, dark_green)  # front
    draw_rect(d, 20, 62, 23, 63, dark)        # shoes
    draw_rect(d, 24, 52, 27, 63, dark_green)  # left
    draw_rect(d, 28, 52, 31, 63, dark_green)  # back

    img.save(output_path)
    print(f"Created {output_path}")


def create_bad_ninja(output_path):
    """Black/red ninja - hostile."""
    img = Image.new("RGBA", (64, 64), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)

    black = (28, 28, 28)
    dark_black = (15, 15, 15)
    dark_red = (139, 0, 0)
    red_eye = (255, 0, 0)
    gray = (50, 50, 50)
    dark = (10, 10, 10)

    # -- HEAD --
    draw_rect(d, 8, 0, 15, 7, dark_black)   # top
    draw_rect(d, 16, 0, 23, 7, dark_black)   # bottom
    draw_rect(d, 0, 8, 7, 15, dark_black)    # right
    draw_rect(d, 8, 8, 15, 15, dark_black)   # front
    # Menacing red eyes
    draw_rect(d, 9, 10, 14, 11, dark_black)
    d.point((10, 10), fill=red_eye)
    d.point((10, 11), fill=dark_red)
    d.point((13, 10), fill=red_eye)
    d.point((13, 11), fill=dark_red)
    draw_rect(d, 16, 8, 23, 15, dark_black)  # left
    draw_rect(d, 24, 8, 31, 15, dark_black)  # back

    # -- BODY --
    draw_rect(d, 20, 16, 27, 19, black)      # top
    draw_rect(d, 16, 20, 19, 31, black)       # right
    draw_rect(d, 20, 20, 27, 31, black)       # front
    draw_rect(d, 20, 26, 27, 27, dark_red)    # red belt/sash
    draw_rect(d, 20, 20, 21, 31, gray)        # front detail
    draw_rect(d, 28, 20, 31, 31, black)       # left
    draw_rect(d, 28, 16, 31, 19, black)       # bottom
    draw_rect(d, 32, 20, 39, 31, black)       # back
    draw_rect(d, 32, 26, 39, 27, dark_red)

    # -- RIGHT ARM --
    draw_rect(d, 44, 16, 47, 19, black)
    draw_rect(d, 40, 20, 43, 31, black)
    draw_rect(d, 44, 20, 47, 31, black)
    draw_rect(d, 44, 28, 47, 31, gray)    # dark gloves
    draw_rect(d, 48, 20, 51, 31, black)
    draw_rect(d, 52, 20, 55, 31, black)

    # -- LEFT ARM --
    draw_rect(d, 36, 48, 39, 51, black)
    draw_rect(d, 32, 52, 35, 63, black)
    draw_rect(d, 36, 52, 39, 63, black)
    draw_rect(d, 36, 60, 39, 63, gray)
    draw_rect(d, 40, 52, 43, 63, black)
    draw_rect(d, 44, 52, 47, 63, black)

    # -- RIGHT LEG --
    draw_rect(d, 4, 16, 7, 19, dark_black)
    draw_rect(d, 0, 20, 3, 31, dark_black)
    draw_rect(d, 4, 20, 7, 31, dark_black)
    draw_rect(d, 4, 30, 7, 31, dark)
    draw_rect(d, 8, 20, 11, 31, dark_black)
    draw_rect(d, 12, 20, 15, 31, dark_black)

    # -- LEFT LEG --
    draw_rect(d, 20, 48, 23, 51, dark_black)
    draw_rect(d, 16, 52, 19, 63, dark_black)
    draw_rect(d, 20, 52, 23, 63, dark_black)
    draw_rect(d, 20, 62, 23, 63, dark)
    draw_rect(d, 24, 52, 27, 63, dark_black)
    draw_rect(d, 28, 52, 31, 63, dark_black)

    img.save(output_path)
    print(f"Created {output_path}")


def create_ninja_king(output_path):
    """Black/gold ninja king - boss."""
    img = Image.new("RGBA", (64, 64), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)

    black = (25, 25, 25)
    dark_black = (12, 12, 12)
    gold = (255, 215, 0)
    dark_gold = (184, 134, 11)
    red_eye = (255, 0, 0)
    dark_red = (139, 0, 0)
    dark = (8, 8, 8)
    purple = (80, 0, 80)

    # -- HEAD --
    draw_rect(d, 8, 0, 15, 7, dark_black)   # top
    # Gold crown on top
    d.point((9, 0), fill=gold)
    d.point((11, 0), fill=gold)
    d.point((13, 0), fill=gold)
    draw_rect(d, 8, 1, 15, 2, gold)
    draw_rect(d, 16, 0, 23, 7, dark_black)   # bottom
    draw_rect(d, 0, 8, 7, 15, dark_black)    # right
    draw_rect(d, 0, 8, 7, 9, gold)           # crown side
    draw_rect(d, 8, 8, 15, 15, dark_black)   # front
    draw_rect(d, 8, 8, 15, 9, gold)          # crown front
    # Red eyes
    d.point((10, 10), fill=red_eye)
    d.point((10, 11), fill=dark_red)
    d.point((13, 10), fill=red_eye)
    d.point((13, 11), fill=dark_red)
    draw_rect(d, 16, 8, 23, 15, dark_black)  # left
    draw_rect(d, 16, 8, 23, 9, gold)
    draw_rect(d, 24, 8, 31, 15, dark_black)  # back
    draw_rect(d, 24, 8, 31, 9, gold)

    # -- BODY --
    draw_rect(d, 20, 16, 27, 19, black)      # top
    draw_rect(d, 16, 20, 19, 31, black)       # right
    draw_rect(d, 20, 20, 27, 31, black)       # front
    draw_rect(d, 20, 20, 27, 21, gold)        # gold collar
    draw_rect(d, 20, 26, 27, 27, gold)        # gold belt
    draw_rect(d, 23, 22, 24, 25, purple)      # purple center stripe
    draw_rect(d, 28, 20, 31, 31, black)       # left
    draw_rect(d, 28, 16, 31, 19, black)       # bottom
    draw_rect(d, 32, 20, 39, 31, black)       # back
    draw_rect(d, 32, 26, 39, 27, gold)        # back belt
    draw_rect(d, 32, 20, 39, 21, gold)        # back collar

    # -- RIGHT ARM --
    draw_rect(d, 44, 16, 47, 19, black)
    draw_rect(d, 40, 20, 43, 31, black)
    draw_rect(d, 44, 20, 47, 31, black)
    draw_rect(d, 44, 20, 47, 21, dark_gold)   # gold shoulder
    draw_rect(d, 44, 28, 47, 31, dark_gold)   # gold gloves
    draw_rect(d, 48, 20, 51, 31, black)
    draw_rect(d, 52, 20, 55, 31, black)

    # -- LEFT ARM --
    draw_rect(d, 36, 48, 39, 51, black)
    draw_rect(d, 32, 52, 35, 63, black)
    draw_rect(d, 36, 52, 39, 63, black)
    draw_rect(d, 36, 52, 39, 53, dark_gold)
    draw_rect(d, 36, 60, 39, 63, dark_gold)
    draw_rect(d, 40, 52, 43, 63, black)
    draw_rect(d, 44, 52, 47, 63, black)

    # -- RIGHT LEG --
    draw_rect(d, 4, 16, 7, 19, dark_black)
    draw_rect(d, 0, 20, 3, 31, dark_black)
    draw_rect(d, 4, 20, 7, 31, dark_black)
    draw_rect(d, 4, 30, 7, 31, dark)
    draw_rect(d, 8, 20, 11, 31, dark_black)
    draw_rect(d, 12, 20, 15, 31, dark_black)

    # -- LEFT LEG --
    draw_rect(d, 20, 48, 23, 51, dark_black)
    draw_rect(d, 16, 52, 19, 63, dark_black)
    draw_rect(d, 20, 52, 23, 63, dark_black)
    draw_rect(d, 20, 62, 23, 63, dark)
    draw_rect(d, 24, 52, 27, 63, dark_black)
    draw_rect(d, 28, 52, 31, 63, dark_black)

    img.save(output_path)
    print(f"Created {output_path}")


def create_pack_icon(output_path):
    """Create a simple ninja-themed pack icon (128x128)."""
    img = Image.new("RGBA", (128, 128), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)

    # Dark background circle
    d.ellipse([10, 10, 118, 118], fill=(20, 20, 20))

    # Ninja mask/face
    draw_rect(d, 35, 40, 93, 75, (30, 30, 30))  # mask area
    draw_rect(d, 35, 50, 93, 60, (50, 50, 50))   # eye band

    # Eyes
    draw_rect(d, 42, 52, 55, 58, (255, 0, 0))    # left eye
    draw_rect(d, 73, 52, 86, 58, (255, 0, 0))     # right eye

    # Headband knot tails
    draw_rect(d, 94, 48, 110, 52, (139, 0, 0))
    draw_rect(d, 96, 53, 108, 57, (139, 0, 0))

    img.save(output_path)
    print(f"Created {output_path}")


if __name__ == "__main__":
    base = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

    create_good_ninja(os.path.join(base, "ninja_mod", "RP", "textures", "entity", "good_ninja.png"))
    create_bad_ninja(os.path.join(base, "ninja_mod", "RP", "textures", "entity", "bad_ninja.png"))
    create_ninja_king(os.path.join(base, "ninja_mod", "RP", "textures", "entity", "ninja_king.png"))
    create_pack_icon(os.path.join(base, "ninja_mod", "BP", "pack_icon.png"))
    create_pack_icon(os.path.join(base, "ninja_mod", "RP", "pack_icon.png"))
    print("All textures generated!")
