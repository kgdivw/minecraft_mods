"""Genereert alle textures voor de Golem Mod.

De Ultra Golem gebruikt geometry.humanoid (64x64 skin-layout) op scale 2.0, dus
een grote, brede stenen kerel. We vullen alleen de BASIS-lagen (de tweede laag
blijft doorzichtig) met donkere basaltsteen, trekken daar gloeiende
diamant-aders overheen en tekenen een boos gezicht met een diamanten kern.

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

BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "golem_mod")

STEEN = (76, 80, 90)
STEEN_DONKER = (48, 51, 59)
STEEN_LICHT = (108, 113, 124)
VOEG = (34, 36, 42)
ZWART = (20, 21, 25)
DIAMANT = (90, 230, 255)
DIAMANT_DONKER = (30, 150, 190)
GOUD = (240, 190, 60)

BASIS_VLAKKEN = [
    (0, 0, 31, 15),    # kop
    (16, 16, 39, 31),  # lichaam
    (40, 16, 55, 31),  # rechterarm
    (0, 16, 15, 31),   # rechterbeen
    (32, 48, 47, 63),  # linkerarm
    (16, 48, 31, 63),  # linkerbeen
]

# Gloeiende aders: (vlak-index, [(x, y), ...]) relatief aan de linkerbovenhoek
ADERS = [
    (0, [(3, 4), (4, 5), (4, 6), (5, 7)]),
    (1, [(2, 3), (2, 4), (3, 5), (3, 6), (4, 7), (18, 4), (18, 5), (17, 6)]),
    (2, [(3, 9), (4, 10), (4, 11), (5, 12)]),
    (3, [(10, 8), (10, 9), (9, 10), (9, 11)]),
    (4, [(3, 9), (4, 10), (4, 11), (5, 12)]),
    (5, [(10, 8), (10, 9), (9, 10), (9, 11)]),
]


def steenvlak(d, x1, y1, x2, y2):
    """Ruw steenvlak met naden en donkere brokken."""
    d.rectangle([x1, y1, x2, y2], fill=STEEN)
    d.rectangle([x1, y1, x2, y2], outline=VOEG)
    for x in range(x1 + 1, x2, 3):
        for y in range(y1 + 1, y2, 4):
            d.point((x, y), fill=STEEN_DONKER)
            d.point((x + 1, y + 2), fill=STEEN_LICHT)


def maak_golem_texture(pad):
    """64x64 skin van de Ultra Golem: basalt met diamanten aders."""
    img = Image.new("RGBA", (64, 64), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)

    for vlak in BASIS_VLAKKEN:
        steenvlak(d, *vlak)

    # Gloeiende diamant-aders over het hele lijf
    for index, punten in ADERS:
        x1, y1 = BASIS_VLAKKEN[index][0], BASIS_VLAKKEN[index][1]
        for (dx, dy) in punten:
            d.point((x1 + dx, y1 + dy), fill=DIAMANT)
            d.point((x1 + dx, y1 + dy + 1), fill=DIAMANT_DONKER)

    # ---- KOP voorkant (8,8)-(15,15): boos gezicht ----
    d.rectangle([8, 8, 15, 15], fill=STEEN)
    d.rectangle([8, 8, 15, 15], outline=VOEG)
    d.rectangle([9, 10, 10, 11], fill=DIAMANT)          # linkeroog
    d.rectangle([13, 10, 14, 11], fill=DIAMANT)         # rechteroog
    d.point((9, 11), fill=DIAMANT_DONKER)
    d.point((14, 11), fill=DIAMANT_DONKER)
    d.line([(9, 9), (10, 9)], fill=ZWART)               # boze wenkbrauwen
    d.line([(13, 9), (14, 9)], fill=ZWART)
    d.line([(10, 13), (13, 13)], fill=ZWART)            # strakke mond
    d.line([(10, 14), (13, 14)], fill=STEEN_DONKER)
    d.point((11, 14), fill=STEEN_LICHT)                 # tanden
    d.point((12, 14), fill=STEEN_LICHT)

    # Kop bovenkant (8,0)-(15,7): stenen kroonrand
    d.rectangle([8, 0, 15, 7], fill=STEEN_DONKER)
    for x in range(8, 16, 2):
        d.point((x, 3), fill=GOUD)

    # ---- LICHAAM voorkant (20,20)-(27,31): diamanten kern ----
    d.rectangle([20, 20, 27, 31], fill=STEEN)
    d.rectangle([20, 20, 27, 31], outline=VOEG)
    d.rectangle([22, 23, 25, 27], fill=DIAMANT_DONKER, outline=VOEG)
    d.rectangle([23, 24, 24, 26], fill=DIAMANT)
    d.point((23, 24), fill=(230, 255, 255))
    d.line([(20, 21), (22, 21)], fill=GOUD)             # gouden riembeslag
    d.line([(25, 21), (27, 21)], fill=GOUD)
    d.line([(20, 29), (27, 29)], fill=GOUD)

    # ---- Armen en benen: gewrichtsnaden ----
    for (x1, y1, x2, y2) in [(40, 16, 55, 31), (32, 48, 47, 63), (0, 16, 15, 31), (16, 48, 31, 63)]:
        d.line([(x1, y1 + 6), (x2, y1 + 6)], fill=VOEG)
        d.line([(x1, y1 + 7), (x2, y1 + 7)], fill=STEEN_DONKER)
        d.line([(x1, y2 - 1), (x2, y2 - 1)], fill=STEEN_DONKER)

    img.save(pad)
    print("Gemaakt:", pad)


def maak_hart_icoon(pad):
    """16x16 icoon: gloeiend golemhart in een stenen vatting."""
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    d.rectangle([2, 2, 13, 13], fill=STEEN, outline=VOEG)      # stenen vatting
    d.point((3, 3), fill=STEEN_LICHT)
    d.point((12, 12), fill=STEEN_DONKER)
    # hartvorm
    d.rectangle([4, 5, 6, 7], fill=DIAMANT_DONKER)
    d.rectangle([9, 5, 11, 7], fill=DIAMANT_DONKER)
    d.rectangle([4, 7, 11, 9], fill=DIAMANT_DONKER)
    d.rectangle([5, 9, 10, 10], fill=DIAMANT_DONKER)
    d.rectangle([6, 10, 9, 11], fill=DIAMANT_DONKER)
    d.rectangle([7, 11, 8, 12], fill=DIAMANT_DONKER)
    d.rectangle([5, 6, 6, 8], fill=DIAMANT)
    d.rectangle([9, 6, 10, 8], fill=DIAMANT)
    d.rectangle([6, 8, 9, 10], fill=DIAMANT)
    d.point((5, 6), fill=(230, 255, 255))
    d.point((10, 6), fill=(230, 255, 255))
    d.point((1, 1), fill=GOUD)
    d.point((14, 14), fill=GOUD)
    img.save(pad)
    print("Gemaakt:", pad)


def maak_pack_icoon(pad):
    """128x128 pack-icoon: grote golemkop met gloeiende ogen."""
    img = Image.new("RGBA", (128, 128), (30, 32, 38, 255))
    d = ImageDraw.Draw(img)
    d.rectangle([20, 24, 108, 108], fill=STEEN, outline=VOEG, width=4)
    for x in range(24, 108, 14):
        for y in range(28, 106, 16):
            d.rectangle([x, y, x + 8, y + 8], fill=STEEN_DONKER)
    d.rectangle([34, 48, 56, 64], fill=DIAMANT)                 # ogen
    d.rectangle([72, 48, 94, 64], fill=DIAMANT)
    d.rectangle([34, 42, 56, 46], fill=ZWART)                   # wenkbrauwen
    d.rectangle([72, 42, 94, 46], fill=ZWART)
    d.rectangle([44, 82, 84, 90], fill=ZWART)                   # mond
    for x in range(48, 84, 10):
        d.rectangle([x, 82, x + 5, 90], fill=STEEN_LICHT)
    d.rectangle([54, 4, 74, 20], fill=GOUD)                     # kroonpunt
    img.save(pad)
    print("Gemaakt:", pad)


def main():
    maak_golem_texture(os.path.join(BASE, "RP", "textures", "entity", "ultragolem.png"))
    maak_hart_icoon(os.path.join(BASE, "RP", "textures", "items", "golem_hart.png"))
    maak_pack_icoon(os.path.join(BASE, "BP", "pack_icon.png"))
    maak_pack_icoon(os.path.join(BASE, "RP", "pack_icon.png"))


if __name__ == "__main__":
    main()
