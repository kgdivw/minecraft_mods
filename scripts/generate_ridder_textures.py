"""Generate Ridder Mod entity textures for Minecraft Bedrock Edition.

All humanoid skins are 64x64 (geometry.humanoid). We fill the standard
body-part UV regions with solid colours so there are never transparent gaps,
then paint a face (or a knight's visor) on the head-front.
"""

from PIL import Image, ImageDraw
import os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT_DIR = os.path.join(ROOT, "ridder_mod", "RP", "textures", "entity")
os.makedirs(OUT_DIR, exist_ok=True)


def rect(d, box, color):
    d.rectangle(box, fill=color)


# Standard 64x64 humanoid UV regions (whole bounding boxes per part)
HEAD = (0, 0, 31, 15)
RLEG = (0, 16, 15, 31)
BODY = (16, 16, 39, 31)
RARM = (40, 16, 55, 31)
LLEG = (16, 48, 31, 63)
LARM = (32, 48, 55, 63)
FACE = (8, 8, 15, 15)


def shade(color, f):
    return tuple(max(0, min(255, int(c * f))) for c in color)


def base_skin(head, body, arms, legs):
    img = Image.new("RGBA", (64, 64), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    rect(d, HEAD, head)
    rect(d, BODY, body)
    rect(d, RARM, arms)
    rect(d, LARM, arms)
    rect(d, RLEG, legs)
    rect(d, LLEG, legs)
    return img, d


def add_face(d, skin, eye=(40, 40, 60)):
    # face skin
    rect(d, FACE, skin)
    # eyes
    rect(d, (10, 11, 10, 12), eye)
    rect(d, (13, 11, 13, 12), eye)
    rect(d, (10, 11, 10, 11), (255, 255, 255))
    rect(d, (13, 11, 13, 11), (255, 255, 255))
    # mouth
    rect(d, (11, 14, 12, 14), shade(skin, 0.7))


def add_visor(d, metal):
    # helmet face: darker metal with a horizontal slit
    rect(d, FACE, shade(metal, 0.85))
    rect(d, (8, 11, 15, 12), (20, 20, 28))  # eye slit
    rect(d, (11, 8, 12, 10), shade(metal, 1.1))  # nose ridge


def knight(metal_head, body, arms, legs, plume=None):
    img, d = base_skin(metal_head, body, arms, legs)
    add_visor(d, metal_head)
    # plume on top of helmet (head top face region 8,0..15,7)
    if plume:
        rect(d, (10, 0, 13, 6), plume)
    # chest emblem
    rect(d, (22, 22, 25, 26), shade(body, 1.25))
    return img


def staff(head_hair, skin, body, arms, legs, hat=None):
    img, d = base_skin(head_hair, body, arms, legs)
    add_face(d, skin)
    if hat:
        rect(d, (0, 0, 31, 7), hat)   # cover head top region with hat colour
        rect(d, (8, 8, 15, 9), hat)   # hat brim over forehead
    return img


def save(img, name):
    img.save(os.path.join(OUT_DIR, name + ".png"))
    print("wrote", name + ".png")


# --- Knights ---
# Friendly knight: steel armour, blue tabard
save(knight((159, 166, 173), (40, 70, 140), (130, 137, 145), (70, 76, 84),
            plume=(220, 40, 50)), "ridder_npc")
# Enemy knight: dark iron, red tabard
save(knight((58, 58, 64), (120, 18, 27), (74, 74, 82), (44, 44, 50),
            plume=(20, 20, 20)), "vijand_ridder")

# Friendly tower archer: steel helm, green hood/tabard
save(knight((159, 166, 173), (46, 120, 60), (120, 130, 110), (60, 80, 55),
            plume=(40, 160, 70)), "ridder_boog")
# Enemy archer: red hood + leather, bright red tabard
img = knight((122, 16, 16), (192, 57, 43), (140, 60, 50), (90, 30, 30), plume=None)
save(img, "vijand_boog")
# Enemy cannoneer: heavy dark iron, soot-grey, red trim
save(knight((42, 10, 10), (60, 60, 64), (50, 50, 56), (35, 35, 40),
            plume=(120, 18, 18)), "vijand_kanon")
# Enemy king: dark red robe, golden crown
img, d = base_skin((90, 10, 10), (90, 10, 10), (120, 20, 20), (60, 8, 8))
add_face(d, (235, 205, 175))
rect(d, (8, 0, 15, 3), (255, 215, 0))   # golden crown on head top
rect(d, (8, 8, 15, 8), (255, 215, 0))   # crown band on forehead
rect(d, (22, 22, 25, 28), (255, 215, 0))  # golden chest emblem
save(img, "vijand_koning")

# --- Castle staff ---
# Cook: white outfit, red apron, chef hat (white)
save(staff((60, 40, 30), (240, 210, 180), (240, 240, 240), (235, 235, 235),
           (90, 90, 95), hat=(255, 255, 255)), "kok")
# Inventor: brown leather coat, goggles look via hat band
save(staff((90, 60, 35), (235, 200, 170), (139, 94, 60), (160, 110, 70),
           (60, 50, 45), hat=(70, 70, 75)), "uitvinder")
# Jester: red+yellow motley, two-colour body
img, d = base_skin((230, 50, 60), (230, 50, 60), (255, 183, 3), (255, 183, 3))
add_face(d, (240, 210, 180))
rect(d, (0, 0, 15, 7), (255, 183, 3))   # half hat yellow
rect(d, (16, 0, 31, 7), (230, 50, 60))  # half hat red
rect(d, (20, 20, 27, 31), (230, 50, 60))
rect(d, (20, 20, 23, 31), (255, 183, 3))  # split tunic
save(img, "hofnar")
# Butler: black tailcoat, white shirt front
img, d = base_skin((40, 30, 25), (26, 26, 26), (26, 26, 26), (20, 20, 20))
add_face(d, (235, 205, 175))
rect(d, (22, 20, 25, 31), (245, 245, 245))  # white shirt
rect(d, (23, 20, 24, 27), (20, 20, 20))     # black tie
save(img, "butler")

# --- Invisible portal marker (16x16 fully transparent) ---
Image.new("RGBA", (16, 16), (0, 0, 0, 0)).save(
    os.path.join(OUT_DIR, "keuze_portal.png"))
print("wrote keuze_portal.png")
