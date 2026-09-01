"""Genereert alle textures voor de Robot Mod.

De robot gebruikt geometry.humanoid (64x64 skin-layout). We vullen alleen de
BASIS-lagen met metaal (de tweede laag/hoed blijft doorzichtig), en tekenen
daarna het gezicht op de kop-voorkant en een redstone-lampje op de borst.

Skin-UV spiekbriefje (64x64):
- kop        (0,0)-(31,15)    voorkant (8,8)-(15,15)
- lichaam    (16,16)-(39,31)  voorkant (20,20)-(27,31)
- rechterarm (40,16)-(55,31)  voorkant (44,20)-(47,31)
- rechterbeen(0,16)-(15,31)   voorkant (4,20)-(7,31)
- linkerarm  (32,48)-(47,63)  voorkant (36,52)-(39,63)
- linkerbeen (16,48)-(31,63)  voorkant (20,52)-(23,63)
"""

from PIL import Image, ImageDraw
import os

BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "robot_mod")

STAAL = (150, 156, 165)
STAAL_DONKER = (104, 110, 120)
STAAL_LICHT = (196, 202, 210)
VOEG = (74, 79, 88)
ZWART = (28, 30, 34)
CYAAN = (90, 230, 255)
CYAAN_DONKER = (30, 150, 190)
ROOD = (225, 45, 45)
ROOD_DONKER = (140, 20, 20)
GOUD = (240, 190, 60)
ORANJE = (255, 140, 40)

# Basis-vlakken van de humanoid-skin: (x1, y1, x2, y2)
BASIS_VLAKKEN = [
    (0, 0, 31, 15),    # kop
    (16, 16, 39, 31),  # lichaam
    (40, 16, 55, 31),  # rechterarm
    (0, 16, 15, 31),   # rechterbeen
    (32, 48, 47, 63),  # linkerarm
    (16, 48, 31, 63),  # linkerbeen
]


def paneel(d, x1, y1, x2, y2, kleur, rand):
    """Metalen plaat met een donkere rand (naad tussen de platen)."""
    d.rectangle([x1, y1, x2, y2], fill=kleur)
    d.rectangle([x1, y1, x2, y2], outline=rand)


def maak_robot_texture(pad, kapot=False):
    """64x64 robot-skin. kapot=True geeft een roestige, beschadigde robot."""
    romp = (150, 110, 95) if kapot else STAAL
    donker = (100, 68, 58) if kapot else STAAL_DONKER
    licht = (190, 150, 130) if kapot else STAAL_LICHT
    oog = ROOD if kapot else CYAAN
    oog_donker = ROOD_DONKER if kapot else CYAAN_DONKER

    img = Image.new("RGBA", (64, 64), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)

    # Alle basis-vlakken metaalgrijs met naden en klinknagels
    for (x1, y1, x2, y2) in BASIS_VLAKKEN:
        paneel(d, x1, y1, x2, y2, romp, VOEG)
        for x in range(x1 + 2, x2, 6):
            for y in range(y1 + 2, y2, 6):
                d.point((x, y), fill=donker)

    # ---- KOP voorkant (8,8)-(15,15): vizier met ogen en mondrooster ----
    d.rectangle([8, 8, 15, 15], fill=romp)
    d.rectangle([8, 9, 15, 12], fill=ZWART)          # zwart vizier
    d.rectangle([9, 10, 10, 11], fill=oog)           # linkeroog
    d.rectangle([13, 10, 14, 11], fill=oog)          # rechteroog
    d.point((10, 11), fill=oog_donker)
    d.point((14, 11), fill=oog_donker)
    for x in range(9, 15, 2):                        # mondrooster
        d.line([(x, 13), (x, 14)], fill=donker)
    d.line([(8, 15), (15, 15)], fill=licht)          # kin
    if kapot:
        d.line([(9, 8), (12, 12)], fill=ZWART)       # barst over het vizier
        d.point((13, 13), fill=ZWART)

    # Kop bovenkant (8,0)-(15,7): antenne-plaatje
    d.rectangle([8, 0, 15, 7], fill=donker)
    d.rectangle([11, 2, 12, 4], fill=ROOD if not kapot else ZWART)

    # Zijkanten van de kop: oorschijfjes
    d.ellipse([2, 10, 5, 13], fill=donker, outline=VOEG)
    d.ellipse([18, 10, 21, 13], fill=donker, outline=VOEG)

    # ---- LICHAAM voorkant (20,20)-(27,31): borstpaneel ----
    d.rectangle([20, 20, 27, 31], fill=romp)
    d.rectangle([21, 22, 26, 28], fill=donker, outline=VOEG)
    # redstone-lampje in het midden
    d.rectangle([23, 24, 24, 25], fill=ROOD if not kapot else ZWART)
    d.point((23, 24), fill=ORANJE if not kapot else ZWART)
    # knopjes
    d.point((22, 27), fill=GOUD)
    d.point((25, 27), fill=oog)
    d.line([(20, 30), (27, 30)], fill=VOEG)
    if kapot:
        d.line([(21, 21), (26, 29)], fill=ZWART)
        d.line([(22, 29), (25, 22)], fill=ZWART)

    # ---- Armen en benen: scharnieren ----
    for (x1, y1, x2, y2) in [(40, 16, 55, 31), (32, 48, 47, 63), (0, 16, 15, 31), (16, 48, 31, 63)]:
        d.line([(x1, y1 + 6), (x2, y1 + 6)], fill=VOEG)
        d.line([(x1, y1 + 7), (x2, y1 + 7)], fill=donker)
        d.line([(x1, y2 - 1), (x2, y2 - 1)], fill=donker)

    img.save(pad)
    print("Gemaakt:", pad)


def maak_bouwpakket_icoon(pad):
    """16x16 icoon: een robotkop-in-een-doos."""
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    d.rectangle([1, 3, 14, 14], fill=(160, 120, 70), outline=(96, 70, 40))  # kist
    d.line([(1, 8), (14, 8)], fill=(96, 70, 40))
    d.rectangle([4, 4, 11, 10], fill=STAAL, outline=VOEG)                   # robotkop
    d.rectangle([4, 5, 11, 7], fill=ZWART)
    d.point((6, 6), fill=CYAAN)
    d.point((9, 6), fill=CYAAN)
    d.line([(7, 1), (7, 3)], fill=STAAL_DONKER)                             # antenne
    d.point((7, 0), fill=ROOD)
    d.point((13, 12), fill=ROOD)                                            # redstone-stipje
    img.save(pad)
    print("Gemaakt:", pad)


def maak_afstandsbediening_icoon(pad):
    """16x16 icoon: afstandsbediening met rode knop en antenne."""
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    d.rectangle([4, 4, 11, 15], fill=STAAL_DONKER, outline=ZWART)  # kastje
    d.rectangle([5, 6, 10, 8], fill=CYAAN_DONKER, outline=ZWART)   # schermpje
    d.rectangle([5, 10, 6, 11], fill=ROOD)                         # knoppen
    d.rectangle([9, 10, 10, 11], fill=GOUD)
    d.rectangle([5, 13, 6, 14], fill=CYAAN)
    d.rectangle([9, 13, 10, 14], fill=STAAL_LICHT)
    d.line([(10, 3), (12, 0)], fill=STAAL)                         # antenne
    d.point((12, 0), fill=ROOD)
    img.save(pad)
    print("Gemaakt:", pad)


def maak_pack_icoon(pad):
    """128x128 pack-icoon: grote robotkop."""
    img = Image.new("RGBA", (128, 128), (52, 58, 68, 255))
    d = ImageDraw.Draw(img)
    d.rectangle([24, 30, 104, 104], fill=STAAL, outline=VOEG, width=3)
    d.rectangle([32, 44, 96, 68], fill=ZWART)
    d.rectangle([42, 50, 56, 62], fill=CYAAN)
    d.rectangle([72, 50, 86, 62], fill=CYAAN)
    for x in range(40, 90, 12):
        d.rectangle([x, 80, x + 6, 92], fill=STAAL_DONKER)
    d.line([(64, 30), (64, 12)], fill=STAAL_DONKER, width=4)
    d.ellipse([56, 4, 72, 20], fill=ROOD)
    img.save(pad)
    print("Gemaakt:", pad)


def main():
    maak_robot_texture(os.path.join(BASE, "RP", "textures", "entity", "robot.png"))
    maak_robot_texture(os.path.join(BASE, "RP", "textures", "entity", "robot_kapot.png"), kapot=True)
    maak_bouwpakket_icoon(os.path.join(BASE, "RP", "textures", "items", "robot_bouwpakket.png"))
    maak_afstandsbediening_icoon(os.path.join(BASE, "RP", "textures", "items", "afstandsbediening.png"))
    maak_pack_icoon(os.path.join(BASE, "BP", "pack_icon.png"))
    maak_pack_icoon(os.path.join(BASE, "RP", "pack_icon.png"))


if __name__ == "__main__":
    main()
