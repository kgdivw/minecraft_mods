"""Genereert alle textures voor de mod "Je Bent Een Steen".

- mijnwerker.png : 64x64 skin (geometry.humanoid.custom) - gele helm met lampje,
  blauwe overall, bruine laarzen.
- steen_pak.png  : 64x64 steen-texture voor de drie stenen schillen
  (geometry.steen_pak_klein / _groot / _mega). Het hele plaatje is steen, want
  elk blokje van die modellen pakt gewoon een stukje van deze texture.
- item-iconen    : drie keien, van klein naar mega.
- pack_icon.png  : een kei met oogjes en een pikhouweel erboven.

Skin-UV spiekbriefje (64x64):
- kop         (0,0)-(31,15)    boven (8,0)-(15,7)   voor (8,8)-(15,15)
- lichaam     (16,16)-(39,31)  voor  (20,20)-(27,31)
- rechterarm  (40,16)-(55,31)  voor  (44,20)-(47,31)
- rechterbeen (0,16)-(15,31)   voor  (4,20)-(7,31)
- linkerarm   (32,48)-(47,63)
- linkerbeen  (16,48)-(31,63)
"""

import os
import random

from PIL import Image, ImageDraw

BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "steen_mod")

# Kleuren
HUID = (226, 173, 134)
HUID_DONKER = (186, 136, 100)
HELM = (240, 196, 48)
HELM_DONKER = (196, 152, 24)
LAMP = (255, 252, 214)
OVERALL = (47, 88, 168)
OVERALL_DONKER = (34, 64, 126)
SHIRT = (206, 84, 54)
SHIRT_DONKER = (158, 58, 36)
LAARS = (84, 58, 38)
LAARS_DONKER = (58, 40, 26)
ZWART = (26, 26, 30)
WIT = (242, 242, 245)
SNOR = (92, 60, 36)

STEEN = (126, 126, 130)
STEEN_LICHT = (160, 160, 165)
STEEN_DONKER = (96, 96, 101)
STEEN_ZEER_DONKER = (72, 72, 77)
OOG_WIT = (238, 238, 240)


def zorg_voor_map(pad):
    map_naam = os.path.dirname(pad)
    if map_naam and not os.path.isdir(map_naam):
        os.makedirs(map_naam)


# ============================================================
#  DE MIJNWERKER
# ============================================================
def maak_mijnwerker(pad):
    img = Image.new("RGBA", (64, 64), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)

    # --- kop: huid met gele helm erop ---
    d.rectangle([0, 8, 31, 15], fill=HUID)          # alle zijkanten van de kop
    d.rectangle([16, 0, 23, 7], fill=HUID_DONKER)   # onderkant kop (kin/nek)
    d.rectangle([8, 0, 15, 7], fill=HELM)           # bovenkant = helm
    for x in range(8, 16, 2):
        d.rectangle([x, 0, x, 7], fill=HELM_DONKER)  # ribbels in de helm
    d.rectangle([0, 8, 31, 10], fill=HELM)          # helmrand rondom
    d.rectangle([0, 11, 31, 11], fill=HELM_DONKER)

    # gezicht (voorkant van de kop)
    d.rectangle([9, 12, 10, 13], fill=WIT)          # ogen
    d.rectangle([13, 12, 14, 13], fill=WIT)
    d.point((10, 13), fill=ZWART)
    d.point((13, 13), fill=ZWART)
    d.rectangle([10, 14, 13, 14], fill=SNOR)        # snor
    d.rectangle([11, 15, 12, 15], fill=HUID_DONKER)  # mond/kin
    d.rectangle([11, 9, 12, 10], fill=LAMP)         # lampje op de helm

    # --- lichaam: blauwe overall met bandjes ---
    d.rectangle([16, 16, 39, 31], fill=OVERALL)
    d.rectangle([20, 20, 27, 23], fill=SHIRT)       # shirt bij de schouders (voor)
    d.rectangle([32, 20, 39, 23], fill=SHIRT)       # shirt op de rug
    d.rectangle([21, 20, 22, 26], fill=OVERALL_DONKER)  # bandjes
    d.rectangle([25, 20, 26, 26], fill=OVERALL_DONKER)
    d.rectangle([22, 26, 25, 29], fill=OVERALL_DONKER)  # zak op de buik
    d.rectangle([20, 30, 27, 31], fill=LAARS)       # gereedschapsgordel
    d.rectangle([23, 30, 24, 31], fill=HELM)        # gesp

    # --- armen: shirtmouw met blote hand ---
    for ax, ay in [(40, 16), (32, 48)]:
        d.rectangle([ax, ay, ax + 15, ay + 15], fill=SHIRT)
        d.rectangle([ax, ay + 11, ax + 15, ay + 15], fill=HUID)   # handen
        d.rectangle([ax + 4, ay + 4, ax + 7, ay + 7], fill=SHIRT_DONKER)

    # --- benen: overall met laarzen ---
    for bx, by in [(0, 16), (16, 48)]:
        d.rectangle([bx, by, bx + 15, by + 15], fill=OVERALL)
        d.rectangle([bx, by + 12, bx + 15, by + 15], fill=LAARS)  # laarzen
        d.rectangle([bx, by + 15, bx + 15, by + 15], fill=LAARS_DONKER)
        d.rectangle([bx + 4, by + 6, bx + 7, by + 8], fill=OVERALL_DONKER)

    zorg_voor_map(pad)
    img.save(pad)
    print("Gemaakt:", pad)


# ============================================================
#  DE STENEN SCHIL
# ============================================================
def maak_steen_pak(pad):
    random.seed(7)
    img = Image.new("RGBA", (64, 64), STEEN)
    d = ImageDraw.Draw(img)

    # ruwe korrels
    for _ in range(900):
        x = random.randint(0, 63)
        y = random.randint(0, 63)
        kleur = random.choice([STEEN_LICHT, STEEN_DONKER, STEEN, STEEN_ZEER_DONKER])
        d.point((x, y), fill=kleur)

    # dikke brokken: lichte bovenkant, donkere onderkant
    for _ in range(26):
        x = random.randint(0, 56)
        y = random.randint(0, 56)
        b = random.randint(4, 8)
        h = random.randint(4, 8)
        d.rectangle([x, y, x + b, y + h], fill=STEEN_DONKER)
        d.rectangle([x, y, x + b, y], fill=STEEN_LICHT)
        d.rectangle([x, y + h, x + b, y + h], fill=STEEN_ZEER_DONKER)

    # barstjes
    for _ in range(18):
        x = random.randint(2, 61)
        y = random.randint(2, 55)
        for stap in range(random.randint(3, 8)):
            d.point((x, y), fill=STEEN_ZEER_DONKER)
            x = max(0, min(63, x + random.randint(-1, 1)))
            y = min(63, y + 1)

    # Twee oogjes op de VOORKANT van de kop-kubus. Die kubus staat op uv (0,20)
    # en is 9 diep, dus de voorkant loopt van x 9 t/m 17 en y 29 t/m 37.
    d.rectangle([11, 31, 12, 33], fill=OOG_WIT)
    d.rectangle([15, 31, 16, 33], fill=OOG_WIT)
    d.rectangle([11, 32, 12, 33], fill=ZWART)
    d.rectangle([15, 32, 16, 33], fill=ZWART)

    zorg_voor_map(pad)
    img.save(pad)
    print("Gemaakt:", pad)


# ============================================================
#  ITEM-ICONEN: drie keien
# ============================================================
def maak_kei_icoon(pad, grootte):
    """grootte 0 = klein kiezeltje, 1 = kei, 2 = mega brok."""
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    marge = [5, 3, 1][grootte]
    boven = marge + [2, 1, 0][grootte]
    d.rounded_rectangle([marge, boven, 15 - marge, 14], radius=3, fill=STEEN)
    d.rounded_rectangle([marge, boven, 15 - marge, boven + 2], radius=2, fill=STEEN_LICHT)
    d.rounded_rectangle([marge, 12, 15 - marge, 14], radius=2, fill=STEEN_DONKER)

    random.seed(3 + grootte)
    for _ in range(14 + grootte * 8):
        x = random.randint(marge + 1, 14 - marge)
        y = random.randint(boven + 1, 13)
        d.point((x, y), fill=random.choice([STEEN_DONKER, STEEN_LICHT, STEEN_ZEER_DONKER]))

    # oogjes, zodat je ziet dat het JIJ bent
    oy = boven + 3
    d.point((marge + 2, oy), fill=OOG_WIT)
    d.point((13 - marge, oy), fill=OOG_WIT)

    zorg_voor_map(pad)
    img.save(pad)
    print("Gemaakt:", pad)


# ============================================================
#  PACK-ICOON
# ============================================================
def maak_pack_icoon(pad):
    img = Image.new("RGBA", (128, 128), (38, 40, 46, 255))
    d = ImageDraw.Draw(img)

    # de steen
    d.rounded_rectangle([18, 46, 110, 112], radius=18, fill=STEEN)
    d.rounded_rectangle([18, 46, 110, 62], radius=14, fill=STEEN_LICHT)
    d.rounded_rectangle([18, 100, 110, 112], radius=12, fill=STEEN_DONKER)

    random.seed(11)
    for _ in range(420):
        x = random.randint(20, 108)
        y = random.randint(48, 110)
        d.point((x, y), fill=random.choice([STEEN_DONKER, STEEN_LICHT, STEEN_ZEER_DONKER]))

    # oogjes
    d.rectangle([40, 72, 54, 86], fill=OOG_WIT)
    d.rectangle([74, 72, 88, 86], fill=OOG_WIT)
    d.rectangle([46, 78, 54, 86], fill=ZWART)
    d.rectangle([80, 78, 88, 86], fill=ZWART)
    d.rectangle([44, 96, 84, 100], fill=ZWART)  # mondje

    # pikhouweel die eraan komt
    d.line([(86, 10), (118, 42)], fill=(120, 80, 48), width=7)
    d.line([(74, 8), (104, 8)], fill=(200, 205, 212), width=8)
    d.line([(74, 8), (70, 20)], fill=(160, 165, 172), width=6)
    d.line([(104, 8), (110, 20)], fill=(160, 165, 172), width=6)

    zorg_voor_map(pad)
    img.save(pad)
    print("Gemaakt:", pad)


# ============================================================
#  DE UPGRADE-KNOP
#  Een stenen knop met een dikke groene pijl omhoog: daarmee open
#  je in het spel het menu met de aanval- en groei-knop.
# ============================================================
GROEN = (86, 206, 92)
GROEN_DONKER = (46, 150, 58)


def maak_upgrade_icoon(pad):
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)

    # het stenen knopje
    d.rounded_rectangle([1, 1, 14, 14], radius=3, fill=STEEN)
    d.rounded_rectangle([1, 1, 14, 3], radius=2, fill=STEEN_LICHT)
    d.rounded_rectangle([1, 12, 14, 14], radius=2, fill=STEEN_DONKER)
    random.seed(21)
    for _ in range(26):
        x = random.randint(2, 13)
        y = random.randint(2, 13)
        d.point((x, y), fill=random.choice([STEEN_DONKER, STEEN_LICHT, STEEN_ZEER_DONKER]))

    # de pijl omhoog: eerst de donkere rand, dan het groen erin
    punt = [(8, 2), (13, 8), (10, 8), (10, 13), (6, 13), (6, 8), (3, 8)]
    d.polygon(punt, fill=GROEN_DONKER)
    binnen = [(8, 4), (11, 8), (9, 8), (9, 12), (7, 12), (7, 8), (5, 8)]
    d.polygon(binnen, fill=GROEN)

    zorg_voor_map(pad)
    img.save(pad)
    print("Gemaakt:", pad)


def main():
    maak_mijnwerker(os.path.join(BASE, "RP", "textures", "entity", "mijnwerker.png"))
    maak_steen_pak(os.path.join(BASE, "RP", "textures", "entity", "steen_pak.png"))
    for i, naam in enumerate(["klein", "groot", "mega"]):
        maak_kei_icoon(os.path.join(BASE, "RP", "textures", "items", "steen_pak_%s.png" % naam), i)
    maak_upgrade_icoon(os.path.join(BASE, "RP", "textures", "items", "steen_upgrade.png"))
    maak_pack_icoon(os.path.join(BASE, "BP", "pack_icon.png"))
    maak_pack_icoon(os.path.join(BASE, "RP", "pack_icon.png"))


if __name__ == "__main__":
    main()
