"""Generator voor de mod 'Baas van het Dorp' (dorpsbaas_mod).

Maakt:
  * build_dorp.mcfunction        -> een compact dorp rondom de speler (huizen + wegen
                                    + dorpelingen). GEEN 'hollow' fills (die laden niet
                                    betrouwbaar) - alle muren worden expliciet gebouwd.
  * huis_<materiaal>.mcfunction  -> je eigen huis (ijzer/diamant/goud/emerald/regenboog)
  * huis_verdieping.mcfunction   -> extra verdieping (huizen groter maken)
  * RP/models/entity/auto.geo.json          -> model bestuurbare auto
  * RP/models/entity/pak_blauw.geo.json     -> blauw pak (attachable) met rode strik op de buik
  * textures (herobrine, stoute villager, muntje, pak, auto's, pack icons)

Alles wordt RELATIEF t.o.v. de speler gebouwd (~), zodat het dorp om de speler
heen verschijnt. Het dorp is compact (binnen ~44 blokken) zodat de chunks geladen
zijn en alles direct verschijnt.
"""

import os
import json
from PIL import Image, ImageDraw

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MOD = os.path.join(ROOT, "dorpsbaas_mod")
FUNC = os.path.join(MOD, "BP", "functions")
MODELS = os.path.join(MOD, "RP", "models", "entity")
TEX_ENT = os.path.join(MOD, "RP", "textures", "entity")
TEX_ITEM = os.path.join(MOD, "RP", "textures", "items")

for d in (FUNC, MODELS, TEX_ENT, TEX_ITEM):
    os.makedirs(d, exist_ok=True)

STEP = 28  # tegels van 28^3 << 32768 (Bedrock /fill limiet)


def chunk_fill(L, x1, y1, z1, x2, y2, z2, block):
    for xa in range(x1, x2 + 1, STEP):
        xb = min(xa + STEP - 1, x2)
        for ya in range(y1, y2 + 1, STEP):
            yb = min(ya + STEP - 1, y2)
            for za in range(z1, z2 + 1, STEP):
                zb = min(za + STEP - 1, z2)
                L.append(f"fill ~{xa} ~{ya} ~{za} ~{xb} ~{yb} ~{zb} {block}")


def box_walls(L, x1, y1, z1, x2, y2, z2, block):
    """Vier expliciete muren (geen hollow)."""
    L.append(f"fill ~{x1} ~{y1} ~{z1} ~{x2} ~{y2} ~{z1} {block}")
    L.append(f"fill ~{x1} ~{y1} ~{z2} ~{x2} ~{y2} ~{z2} {block}")
    L.append(f"fill ~{x1} ~{y1} ~{z1} ~{x1} ~{y2} ~{z2} {block}")
    L.append(f"fill ~{x2} ~{y1} ~{z1} ~{x2} ~{y2} ~{z2} {block}")


# =====================================================================
# 1. HET DORP (compact, betrouwbaar)
# =====================================================================

def generate_dorp():
    L = ["# ==========================================================",
         "# BAAS VAN HET DORP - compact dorp rondom de speler",
         "# Gegenereerd door scripts/generate_dorpsbaas.py",
         "# =========================================================="]
    R = 44

    L.append("# Ruimte vrijmaken + grond")
    chunk_fill(L, -R, 0, -R, R, 20, R, "air")
    chunk_fill(L, -R, -1, -R, R, -1, R, "grass_block")
    chunk_fill(L, -R, -2, -R, R, -2, R, "dirt")

    # Wegen: PLAT, geen obstakels in de rijbaan (auto kan overal rijden)
    L.append("# Wegen (plat, vrij voor de auto)")
    for g in range(-R + 8, R - 7, 16):
        chunk_fill(L, g - 1, -1, -R, g + 1, -1, R, "stone")
        chunk_fill(L, -R, -1, g - 1, R, -1, g + 1, "stone")

    # Dorpshuisjes op de plots (raster om de 16), centrum vrij voor het plein
    L.append("# Dorpshuisjes (met winkelgevels)")
    spots = []
    for cx in range(-R + 14, R - 6, 16):
        for cz in range(-R + 14, R - 6, 16):
            if abs(cx) <= 18 and abs(cz) <= 18:
                continue  # centrum = plein + winkels (in start.mcfunction)
            spots.append((cx, cz))

    walls = ["oak_planks", "spruce_planks", "birch_planks", "white_terracotta",
             "light_gray_terracotta", "brown_terracotta"]
    roofs = ["dark_oak_planks", "brick_block", "nether_brick", "stone_bricks"]
    awnings = ["red_wool", "blue_wool", "green_wool", "yellow_wool", "orange_wool"]
    for i, (cx, cz) in enumerate(spots):
        wall = walls[i % len(walls)]
        roof = roofs[i % len(roofs)]
        awn = awnings[i % len(awnings)]
        x1, z1, x2, z2 = cx - 3, cz - 3, cx + 3, cz + 3
        L.append(f"fill ~{x1} ~-1 ~{z1} ~{x2} ~-1 ~{z2} {wall}")   # vloer
        box_walls(L, x1, 0, z1, x2, 3, z2, wall)                    # muren (expliciet)
        L.append(f"fill ~{x1} ~4 ~{z1} ~{x2} ~4 ~{z2} {roof}")     # dak
        L.append(f"fill ~{x1} ~5 ~{z1} ~{x2} ~5 ~{z2} {roof}")     # dak top
        # deur (naar de weg, zuidkant)
        L.append(f"setblock ~{cx} ~0 ~{z2} air")
        L.append(f"setblock ~{cx} ~1 ~{z2} air")
        # etalage-raam + luifel (winkelgevel)
        L.append(f"setblock ~{cx-2} ~1 ~{z2} glass")
        L.append(f"setblock ~{cx+2} ~1 ~{z2} glass")
        L.append(f"fill ~{x1} ~2 ~{z2+1} ~{x2} ~2 ~{z2+1} {awn}")  # luifel boven de gevel
        # licht op de hoeken (NIET op de weg)
        L.append(f"setblock ~{x1} ~3 ~{z1} torch")
        L.append(f"setblock ~{x2} ~3 ~{z1} torch")
        L.append(f"setblock ~{cx} ~3 ~{cz} lantern")

    # Dorpelingen (lopen rond, geven complimenten via tick.mcfunction)
    L.append("# Dorpelingen")
    for i, (cx, cz) in enumerate(spots):
        L.append(f"summon villager_v2 ~{cx} ~1 ~{cz - 5}")

    L.append("# klaar")
    with open(os.path.join(FUNC, "build_dorp.mcfunction"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")
    print(f"build_dorp.mcfunction: {len(L)} regels, {len(spots)} huizen/winkels")


# =====================================================================
# 2. JOUW EIGEN HUIS (expliciete muren, geen hollow)
# =====================================================================

def house_lines(block, floor_block, with_pool=False, rainbow=False):
    L = []
    chunk_fill(L, -5, 0, 2, 5, 11, 14, "air")
    L.append(f"fill ~-5 ~-1 ~2 ~5 ~-1 ~14 {floor_block}")
    if rainbow:
        colors = ["red_wool", "orange_wool", "yellow_wool", "lime_wool", "light_blue_wool"]
        for y, col in enumerate(colors):
            box_walls(L, -4, y, 3, 4, y, 13, col)
        L.append("fill ~-4 ~5 ~3 ~4 ~5 ~13 magenta_wool")
    else:
        box_walls(L, -4, 0, 3, 4, 4, 13, block)
        L.append(f"fill ~-4 ~5 ~3 ~4 ~5 ~13 {block}")
    L.append(f"fill ~-4 ~-1 ~3 ~4 ~-1 ~13 {floor_block}")
    # deur naar de speler (zuidkant, z=3)
    L.append("setblock ~0 ~0 ~3 air")
    L.append("setblock ~0 ~1 ~3 air")
    # ramen
    for rx, rz in [(-4, 8), (4, 8), (-2, 13), (2, 13)]:
        L.append(f"setblock ~{rx} ~2 ~{rz} glass")
    # binnen: bed, tafel, licht
    L.append("setblock ~-3 ~0 ~12 red_wool")
    L.append("setblock ~-2 ~0 ~12 red_wool")
    L.append("setblock ~3 ~0 ~12 crafting_table")
    L.append("setblock ~0 ~4 ~8 glowstone")
    L.append("setblock ~0 ~3 ~8 lantern")
    L.append("setblock ~-4 ~1 ~3 torch")
    L.append("setblock ~4 ~1 ~3 torch")
    if with_pool:
        L.append("fill ~6 ~-1 ~4 ~10 ~-1 ~10 quartz_block")
        box_walls(L, 6, 0, 4, 10, 1, 10, "light_blue_stained_glass")
        L.append("fill ~7 ~0 ~5 ~9 ~1 ~9 water")
        L.append("setblock ~6 ~3 ~4 sea_lantern")
        L.append("setblock ~10 ~3 ~10 sea_lantern")
    return L


def generate_houses():
    mats = {
        "ijzer": ("iron_block", "polished_andesite"),
        "diamant": ("diamond_block", "light_blue_concrete"),
        "goud": ("gold_block", "yellow_concrete"),
        "emerald": ("emerald_block", "lime_concrete"),
    }
    for name, (block, floor) in mats.items():
        L = [f"# Jouw huis van {name}"]
        L += house_lines(block, floor)
        L.append(f"title @s actionbar §aJe {name}-huis is gebouwd!")
        with open(os.path.join(FUNC, f"huis_{name}.mcfunction"), "w", encoding="utf-8") as f:
            f.write("\n".join(L) + "\n")

    L = ["# Regenboog huis met zwembad"]
    L += house_lines("magenta_wool", "quartz_block", with_pool=True, rainbow=True)
    L.append("title @s actionbar §dREGENBOOG-huis met zwembad!")
    with open(os.path.join(FUNC, "huis_regenboog.mcfunction"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    L = ["# Extra verdieping bovenop je huis"]
    chunk_fill(L, -4, 6, 3, 4, 12, 13, "air")
    box_walls(L, -4, 6, 3, 4, 10, 13, "quartz_block")
    L.append("fill ~-4 ~11 ~3 ~4 ~11 ~13 quartz_block")
    L.append("setblock ~-4 ~8 ~8 glass")
    L.append("setblock ~4 ~8 ~8 glass")
    L.append("setblock ~0 ~10 ~8 glowstone")
    L.append("title @s actionbar §bJe huis is groter gemaakt!")
    with open(os.path.join(FUNC, "huis_verdieping.mcfunction"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")
    print("huizen: ijzer/diamant/goud/emerald/regenboog + verdieping")


# =====================================================================
# 3. AUTO MODEL
# =====================================================================

def generate_car_model():
    geo = {"format_version": "1.16.0", "minecraft:geometry": [{
        "description": {"identifier": "geometry.dorpsbaas_auto", "texture_width": 64,
                        "texture_height": 32, "visible_bounds_width": 3,
                        "visible_bounds_height": 2, "visible_bounds_offset": [0, 0.5, 0]},
        "bones": [
            {"name": "body", "pivot": [0, 0, 0], "cubes": [
                {"origin": [-8, 3, -14], "size": [16, 6, 28], "uv": [0, 0]},
                {"origin": [-7, 9, -4], "size": [14, 6, 12], "uv": [0, 16]}]},
            {"name": "wheels", "pivot": [0, 0, 0], "cubes": [
                {"origin": [-9, 0, -12], "size": [2, 4, 4], "uv": [40, 0]},
                {"origin": [7, 0, -12], "size": [2, 4, 4], "uv": [40, 0]},
                {"origin": [-9, 0, 8], "size": [2, 4, 4], "uv": [40, 0]},
                {"origin": [7, 0, 8], "size": [2, 4, 4], "uv": [40, 0]}]}]}]}
    with open(os.path.join(MODELS, "auto.geo.json"), "w", encoding="utf-8") as f:
        json.dump(geo, f, indent=2)
    print("auto.geo.json")


# =====================================================================
# 4. BLAUW PAK (attachable) MET RODE STRIK OP DE BUIK
# =====================================================================

def generate_pak_model():
    geo = {"format_version": "1.16.0", "minecraft:geometry": [{
        "description": {"identifier": "geometry.pak_blauw", "texture_width": 64,
                        "texture_height": 64},
        "bones": [
            {"name": "body", "pivot": [0, 24, 0], "cubes": [
                {"origin": [-4.5, 11.5, -2.5], "size": [9, 13, 5], "uv": [0, 0], "inflate": 0.5}]},
            {"name": "leftarm", "parent": "body", "pivot": [5, 22, 0], "cubes": [
                {"origin": [4, 11.5, -2], "size": [4, 12, 4], "uv": [0, 32], "inflate": 0.45}]},
            {"name": "rightarm", "parent": "body", "pivot": [-5, 22, 0], "cubes": [
                {"origin": [-8, 11.5, -2], "size": [4, 12, 4], "uv": [24, 32], "inflate": 0.45}]},
            # RODE STRIK op de buik (drie kubusjes: 2 vleugels + knoop)
            {"name": "strik", "parent": "body", "pivot": [0, 16, -3], "cubes": [
                {"origin": [-3, 15, -3.3], "size": [2.5, 2.5, 1], "uv": [40, 0]},
                {"origin": [0.5, 15, -3.3], "size": [2.5, 2.5, 1], "uv": [40, 0]},
                {"origin": [-0.5, 15.4, -3.5], "size": [1, 1.6, 1], "uv": [48, 0]}]}]}]}
    with open(os.path.join(MODELS, "pak_blauw.geo.json"), "w", encoding="utf-8") as f:
        json.dump(geo, f, indent=2)

    # attachable
    att = {"format_version": "1.10.0", "minecraft:attachable": {"description": {
        "identifier": "dorpsbaas:pak_blauw",
        "materials": {"default": "entity_alphatest"},
        "textures": {"default": "textures/entity/pak_blauw"},
        "geometry": {"default": "geometry.pak_blauw"},
        "render_controllers": ["controller.render.default"]}}}
    ATT = os.path.join(MOD, "RP", "attachables")
    os.makedirs(ATT, exist_ok=True)
    with open(os.path.join(ATT, "pak_blauw.json"), "w", encoding="utf-8") as f:
        json.dump(att, f, indent=2)
    print("pak_blauw.geo.json + attachable")


# =====================================================================
# 5. TEXTURES
# =====================================================================

def _skin_base(skin=(201, 152, 106), shirt=(120, 120, 120), pants=(70, 70, 90)):
    img = Image.new("RGBA", (64, 64), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    d.rectangle([8, 8, 15, 15], fill=skin)
    d.rectangle([24, 8, 31, 15], fill=skin)
    d.rectangle([16, 8, 23, 15], fill=skin)
    d.rectangle([0, 8, 7, 15], fill=skin)
    d.rectangle([8, 0, 15, 7], fill=skin)
    d.rectangle([16, 0, 23, 7], fill=(90, 60, 40))
    d.rectangle([20, 20, 27, 31], fill=shirt)
    d.rectangle([32, 20, 39, 31], fill=shirt)
    d.rectangle([44, 20, 47, 31], fill=shirt)
    d.rectangle([40, 20, 43, 31], fill=skin)
    d.rectangle([36, 52, 39, 63], fill=shirt)
    d.rectangle([4, 20, 7, 31], fill=pants)
    d.rectangle([20, 52, 23, 63], fill=pants)
    return img, d


def generate_herobrine():
    img, d = _skin_base(skin=(178, 150, 120), shirt=(110, 110, 110), pants=(60, 60, 60))
    d.rectangle([9, 11, 10, 12], fill=(255, 255, 255))
    d.rectangle([13, 11, 14, 12], fill=(255, 255, 255))
    d.rectangle([8, 8, 15, 9], fill=(60, 45, 30))
    img.save(os.path.join(TEX_ENT, "herobrine.png"))
    print("herobrine.png")


def generate_stoute_villager():
    img, d = _skin_base(skin=(160, 120, 95), shirt=(90, 60, 40), pants=(70, 50, 35))
    d.rectangle([11, 12, 12, 14], fill=(120, 90, 70))
    d.rectangle([9, 11, 10, 11], fill=(200, 30, 30))
    d.rectangle([13, 11, 14, 11], fill=(200, 30, 30))
    d.rectangle([9, 10, 14, 10], fill=(40, 30, 20))
    img.save(os.path.join(TEX_ENT, "stoute_villager.png"))
    print("stoute_villager.png")


def generate_pak_texture():
    # Blauw pak + rode strik (voor de attachable)
    img = Image.new("RGBA", (64, 64), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    blue = (35, 70, 170)
    dblue = (25, 50, 130)
    # body (uv 0,0 -> net ~ 0..28 x 0..24) helemaal blauw
    d.rectangle([0, 0, 34, 30], fill=blue)
    # knopen + witte overhemdstreep in het midden van de borst-voorkant
    d.rectangle([12, 4, 15, 22], fill=(235, 235, 240))
    d.rectangle([13, 6, 13, 20], fill=(120, 120, 130))
    # armen (uv 0,32 en 24,32) blauw
    d.rectangle([0, 32, 20, 55], fill=dblue)
    d.rectangle([24, 32, 44, 55], fill=dblue)
    # strik (uv 40,0) rood + knoop (uv 48,0) donkerrood
    d.rectangle([40, 0, 47, 6], fill=(205, 30, 30))
    d.rectangle([48, 0, 52, 5], fill=(150, 15, 15))
    img.save(os.path.join(TEX_ENT, "pak_blauw.png"))
    print("pak_blauw.png")


def generate_car_textures():
    colors = {"diamant": (110, 220, 235), "goud": (245, 205, 60), "emerald": (60, 200, 110)}
    for name, col in colors.items():
        img = Image.new("RGBA", (64, 32), (0, 0, 0, 0))
        d = ImageDraw.Draw(img)
        d.rectangle([0, 0, 39, 15], fill=col)
        d.rectangle([0, 16, 39, 27], fill=(40, 50, 70))
        d.rectangle([2, 18, 37, 25], fill=(150, 200, 230))
        d.rectangle([40, 0, 47, 7], fill=(30, 30, 30))
        img.save(os.path.join(TEX_ENT, f"auto_{name}.png"))
    print("auto textures")


def generate_items():
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    d.ellipse([2, 2, 13, 13], fill=(240, 205, 60), outline=(180, 140, 20))
    d.ellipse([4, 4, 11, 11], outline=(255, 235, 150))
    d.line([6, 5, 6, 10], fill=(150, 110, 10), width=1)
    d.line([5, 7, 9, 7], fill=(150, 110, 10), width=1)
    img.save(os.path.join(TEX_ITEM, "muntje.png"))

    # pak-icoon (voor in het inventaris-slot): blauw jasje met rode strik
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    d.rectangle([3, 4, 12, 14], fill=(35, 70, 170))
    d.rectangle([7, 5, 8, 13], fill=(235, 235, 240))
    d.polygon([(4, 8), (7, 9), (4, 10)], fill=(205, 30, 30))
    d.polygon([(11, 8), (8, 9), (11, 10)], fill=(205, 30, 30))
    d.rectangle([7, 8, 8, 10], fill=(150, 15, 15))
    img.save(os.path.join(TEX_ITEM, "pak_icon.png"))
    print("item textures (muntje, pak_icon)")


def generate_pack_icons():
    for sub in ("BP", "RP"):
        img = Image.new("RGBA", (128, 128), (35, 35, 55, 255))
        d = ImageDraw.Draw(img)
        d.rectangle([0, 0, 127, 127], outline=(240, 205, 60), width=4)
        d.polygon([(30, 85), (30, 45), (48, 65), (64, 40), (80, 65), (98, 45), (98, 85)],
                  fill=(240, 205, 60))
        d.rectangle([30, 85, 98, 95], fill=(240, 205, 60))
        d.ellipse([58, 30, 70, 42], fill=(220, 40, 40))
        img.save(os.path.join(MOD, sub, "pack_icon.png"))
    print("pack icons")


if __name__ == "__main__":
    generate_dorp()
    generate_houses()
    generate_car_model()
    generate_pak_model()
    generate_herobrine()
    generate_stoute_villager()
    generate_pak_texture()
    generate_car_textures()
    generate_items()
    generate_pack_icons()
    print("KLAAR - dorpsbaas assets gegenereerd")
