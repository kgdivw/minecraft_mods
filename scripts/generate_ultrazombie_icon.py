"""Genereert het pack-icoon voor de Ultrazombie mod: zombiekop met gouden kroon."""
from PIL import Image, ImageDraw

S = 128
img = Image.new("RGBA", (S, S), (30, 10, 50, 255))  # donkerpaarse achtergrond
d = ImageDraw.Draw(img)

# Paarse "ultra" gloed
d.ellipse([8, 20, 120, 124], fill=(80, 30, 120, 255))

# Zombiehoofd (blokkerig, groen)
d.rectangle([28, 44, 100, 116], fill=(70, 140, 60, 255))
d.rectangle([28, 44, 100, 60], fill=(58, 120, 50, 255))   # donker haar/voorhoofd
# Ogen
d.rectangle([38, 68, 54, 82], fill=(20, 30, 20, 255))
d.rectangle([74, 68, 90, 82], fill=(20, 30, 20, 255))
d.rectangle([44, 72, 50, 78], fill=(200, 40, 40, 255))    # rode gloed
d.rectangle([80, 72, 86, 78], fill=(200, 40, 40, 255))
# Neus en mond
d.rectangle([60, 84, 68, 92], fill=(50, 100, 45, 255))
d.rectangle([46, 98, 82, 106], fill=(25, 40, 25, 255))
d.rectangle([50, 98, 56, 102], fill=(220, 220, 200, 255))  # tanden
d.rectangle([66, 98, 72, 102], fill=(220, 220, 200, 255))

# Gouden kroon (want ULTRA)
d.rectangle([32, 28, 96, 44], fill=(240, 190, 40, 255))
for px in (32, 52, 72, 88):
    d.polygon([(px, 28), (px + 8, 10), (px + 16, 28)], fill=(240, 190, 40, 255))
d.rectangle([44, 32, 52, 40], fill=(220, 40, 40, 255))   # robijn
d.rectangle([62, 32, 70, 40], fill=(40, 90, 220, 255))   # saffier
d.rectangle([80, 32, 88, 40], fill=(40, 200, 90, 255))   # smaragd

# Gele bliksem (praten = kracht!)
d.polygon([(108, 50), (96, 78), (104, 78), (92, 108), (112, 72), (103, 72), (114, 50)],
          fill=(255, 230, 60, 255))

img.save("ultrazombie/BP/pack_icon.png")
print("Icoon opgeslagen: ultrazombie/BP/pack_icon.png")
