"""Genereert de block-texture en pack icons voor de TNT Donut mod."""
import math
import os
from PIL import Image, ImageDraw

BASIS = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tnt_donut_mod")

ROOD = (190, 40, 35)
ROOD_DONKER = (140, 25, 22)
DEEG = (205, 150, 85)
GLAZUUR = (235, 105, 140)
GLAZUUR_LICHT = (255, 150, 180)
SPIKKELS = [(255, 240, 120), (120, 220, 255), (255, 255, 255), (150, 255, 160)]


def donut_icoon(maat):
    """Een donut met roze glazuur op een TNT-rode achtergrond."""
    img = Image.new("RGBA", (maat, maat), ROOD)
    d = ImageDraw.Draw(img)
    # donkere rand zodat het op een TNT-blok lijkt
    d.rectangle([0, 0, maat - 1, maat - 1], outline=ROOD_DONKER)

    midden = (maat - 1) / 2
    buiten = maat * 0.44
    binnen = maat * 0.15
    for y in range(maat):
        for x in range(maat):
            afstand = math.hypot(x - midden, y - midden)
            if binnen <= afstand <= buiten:
                if afstand <= buiten * 0.82:
                    kleur = GLAZUUR_LICHT if (x + y) % 7 == 0 else GLAZUUR
                else:
                    kleur = DEEG
                img.putpixel((x, y), kleur)

    # spikkels
    stap = max(1, maat // 8)
    i = 0
    for y in range(0, maat, stap):
        for x in range(0, maat, stap):
            afstand = math.hypot(x - midden, y - midden)
            if binnen + maat * 0.04 <= afstand <= buiten * 0.78:
                img.putpixel((x, y), SPIKKELS[i % len(SPIKKELS)])
                i += 1
    return img


def opslaan(img, pad):
    os.makedirs(os.path.dirname(pad), exist_ok=True)
    img.save(pad)
    print("geschreven:", pad)


if __name__ == "__main__":
    opslaan(donut_icoon(16), os.path.join(BASIS, "RP", "textures", "blocks", "tnt_donut_blok.png"))
    icoon = donut_icoon(16).resize((128, 128), Image.NEAREST)
    opslaan(icoon, os.path.join(BASIS, "BP", "pack_icon.png"))
    opslaan(icoon, os.path.join(BASIS, "RP", "pack_icon.png"))
