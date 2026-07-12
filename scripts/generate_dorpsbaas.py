"""Generator voor de mod 'Baas van het Dorp' (dorpsbaas_mod).

Maakt:
  * build_dorp.mcfunction        -> een MEGA dorp rondom de speler (huizen + wegen)
  * huis_<materiaal>.mcfunction  -> je eigen huis (ijzer/diamant/goud/emerald/regenboog)
  * huis_verdieping.mcfunction   -> extra verdieping (huizen groter maken)
  * RP/models/entity/auto.geo.json    -> model voor de bestuurbare auto
  * textures (herobrine, stoute villager, muntje, strik, auto's, pack icons)

Alles wordt RELATIEF t.o.v. de speler gebouwd (~), net als de ridder-mod, zodat
het dorp om de speler heen verschijnt (geen verre teleport).
"""

import os
from PIL import Image, ImageDraw

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MOD = os.path.join(ROOT, "dorpsbaas_mod")
FUNC = os.path.join(MOD, "BP", "functions")
MODELS = os.path.join(MOD, "RP", "models", "entity")
TEX_ENT = os.path.join(MOD, "RP", "textures", "entity")
TEX_ITEM = os.path.join(MOD, "RP", "textures", "items")

for d in (FUNC, MODELS, TEX_ENT, TEX_ITEM):
    os.makedirs(d, exist_ok=True)

FILL_LIMIT_STEP = 28  # tegels van 28^3 << 32768 blokken


def chunk_fill(x1, y1, z1, x2, y2, z2, block):
    """Splits een grote fill in tegels binnen de Bedrock /fill limiet (32768)."""
    out = []
    for xa in range(x1, x2 + 1, FILL_LIMIT_STEP):
        xb = min(xa + FILL_LIMIT_STEP - 1, x2)
        for ya in range(y1, y2 + 1, FILL_LIMIT_STEP):
            yb = min(ya + FILL_LIMIT_STEP - 1, y2)
            for za in range(z1, z2 + 1, FILL_LIMIT_STEP):
                zb = min(za + FILL_LIMIT_STEP - 1, z2)
                out.append(f"fill ~{xa} ~{ya} ~{za} ~{xb} ~{yb} ~{zb} {block}")
    return out


# =====================================================================
# 1. HET MEGA DORP
# =====================================================================

def generate_dorp():
    L = []
    L.append("# ==========================================================")
    L.append("# BAAS VAN HET DORP - bouwt een MEGA dorp rondom de speler")
    L.append("# Gegenereerd door scripts/generate_dorpsbaas.py - niet handmatig aanpassen")
    L.append("# ==========================================================")
    R = 96  # halve breedte -> 193x193 dorp

    # --- Alles vrijmaken (lucht) en een grasvloer leggen ---
    L.append("# Ruimte vrijmaken")
    L += chunk_fill(-R, 0, -R, R, 24, R, "air")
    L.append("# Grasvloer")
    L += chunk_fill(-R, -1, -R, R, -1, R, "grass_block")
    # onderlaag zodat er geen gaten vallen
    L += chunk_fill(-R, -2, -R, R, -2, R, "dirt")

    # --- Wegen: stenen paden op een raster (om de 20 blokken) ---
    L.append("# Wegen (raster)")
    for gx in range(-R + 10, R - 9, 20):
        L += chunk_fill(gx - 1, -1, -R, gx + 1, -1, R, "stone")
    for gz in range(-R + 10, R - 9, 20):
        L += chunk_fill(-R, -1, gz - 1, R, -1, gz + 1, "stone")
    # straatlantaarns op kruispunten
    for gx in range(-R + 10, R - 9, 20):
        for gz in range(-R + 10, R - 9, 20):
            if abs(gx) < 16 and abs(gz) < 16:
                continue
            L.append(f"setblock ~{gx+2} ~0 ~{gz+2} oak_fence")
            L.append(f"setblock ~{gx+2} ~1 ~{gz+2} oak_fence")
            L.append(f"setblock ~{gx+2} ~2 ~{gz+2} lit_pumpkin")

    # --- Dorpshuisjes op de plots (raster om de 20, huis 9x9) ---
    L.append("# Dorpshuisjes")
    house_spots = []
    for cx in range(-R + 20, R - 8, 20):
        for cz in range(-R + 20, R - 8, 20):
            # centrum vrijhouden voor het plein + platforms
            if abs(cx) < 18 and abs(cz) < 18:
                continue
            house_spots.append((cx, cz))

    palette = ["oak_planks", "spruce_planks", "birch_planks", "white_terracotta",
               "light_gray_terracotta", "brown_terracotta"]
    roofs = ["dark_oak_planks", "brick_block", "nether_brick", "spruce_planks"]
    for i, (cx, cz) in enumerate(house_spots):
        wall = palette[i % len(palette)]
        roof = roofs[i % len(roofs)]
        x1, z1 = cx - 3, cz - 3
        x2, z2 = cx + 3, cz + 3
        # vloer
        L.append(f"fill ~{x1} ~-1 ~{z1} ~{x2} ~-1 ~{z2} {wall}")
        # muren (hol)
        L.append(f"fill ~{x1} ~0 ~{z1} ~{x2} ~3 ~{z2} {wall} hollow")
        # dak
        L.append(f"fill ~{x1} ~4 ~{z1} ~{x2} ~4 ~{z2} {roof}")
        # deur + raampjes + fakkel
        L.append(f"setblock ~{cx} ~0 ~{z1} air")
        L.append(f"setblock ~{cx} ~1 ~{z1} air")
        L.append(f"setblock ~{x2} ~2 ~{cz} glass")
        L.append(f"setblock ~{x1} ~2 ~{cz} glass")
        L.append(f"setblock ~{cx} ~3 ~{cz} torch")

    # --- Dorpelingen (gewone villagers) verspreid ---
    L.append("# Dorpelingen")
    for i, (cx, cz) in enumerate(house_spots):
        if i % 2 == 0:
            L.append(f"summon villager_v2 ~{cx} ~1 ~{cz+4}")

    L.append("# klaar")
    with open(os.path.join(FUNC, "build_dorp.mcfunction"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")
    print(f"build_dorp.mcfunction: {len(L)} regels, {len(house_spots)} huizen")


# =====================================================================
# 2. JOUW EIGEN HUIS (per materiaal)
# =====================================================================

def house_lines(block, floor_block, with_pool=False, rainbow=False):
    """Bouwt jouw huis VOOR de speler (kant +z), footprint ~9x11."""
    L = []
    # bouwterrein vrijmaken en vlak maken
    L += chunk_fill(-5, 0, 2, 5, 10, 14, "air")
    L.append("fill ~-5 ~-1 ~2 ~5 ~-1 ~14 " + floor_block)
    if rainbow:
        # regenboog: elke muurlaag een andere wolkleur
        colors = ["red_wool", "orange_wool", "yellow_wool", "lime_wool",
                  "light_blue_wool", "purple_wool"]
        for i, col in enumerate(colors):
            y = i
            if y > 4:
                break
            L.append(f"fill ~-4 ~{y} ~3 ~4 ~{y} ~13 {col} hollow")
        L.append("fill ~-4 ~5 ~3 ~4 ~5 ~13 magenta_wool")
    else:
        L.append(f"fill ~-4 ~0 ~3 ~4 ~4 ~13 {block} hollow")
        L.append(f"fill ~-4 ~5 ~3 ~4 ~5 ~13 {block}")
    # vloer binnen
    L.append(f"fill ~-4 ~-1 ~3 ~4 ~-1 ~13 {floor_block}")
    # deur (voorkant, +z is naar buiten -> deur op ~3 kant richting speler)
    L.append("setblock ~0 ~0 ~3 air")
    L.append("setblock ~0 ~1 ~3 air")
    # ramen
    L.append("setblock ~-4 ~2 ~8 glass")
    L.append("setblock ~4 ~2 ~8 glass")
    L.append("setblock ~-2 ~2 ~13 glass")
    L.append("setblock ~2 ~2 ~13 glass")
    # binnen: bed (rood wol), tafel, verlichting
    L.append("setblock ~-3 ~0 ~12 red_wool")
    L.append("setblock ~-2 ~0 ~12 red_wool")
    L.append("setblock ~3 ~0 ~12 crafting_table")
    L.append("setblock ~0 ~4 ~8 glowstone")
    L.append("setblock ~0 ~3 ~8 lantern")
    # buiten fakkels
    L.append("setblock ~-4 ~1 ~3 torch")
    L.append("setblock ~4 ~1 ~3 torch")
    if with_pool:
        # zwembad naast het huis (kant +x)
        L.append("fill ~6 ~-1 ~4 ~10 ~-1 ~10 quartz_block")
        L.append("fill ~6 ~0 ~4 ~10 ~2 ~10 light_blue_stained_glass hollow")
        L.append("fill ~7 ~0 ~5 ~9 ~1 ~9 water")
        L.append("setblock ~6 ~3 ~4 sea_lantern")
        L.append("setblock ~10 ~3 ~10 sea_lantern")
    return L


def generate_houses():
    materials = {
        "ijzer": ("iron_block", "polished_andesite"),
        "diamant": ("diamond_block", "light_blue_concrete"),
        "goud": ("gold_block", "yellow_concrete"),
        "emerald": ("emerald_block", "lime_concrete"),
    }
    for name, (block, floor) in materials.items():
        L = [f"# Jouw huis van {name} - gegenereerd"]
        L += house_lines(block, floor)
        L.append(f'title @s actionbar §aJe {name}-huis is gebouwd!')
        with open(os.path.join(FUNC, f"huis_{name}.mcfunction"), "w", encoding="utf-8") as f:
            f.write("\n".join(L) + "\n")

    # regenboog huis MET zwembad (1000 EUR)
    L = ["# Regenboog huis met zwembad (rijk!)"]
    L += house_lines("magenta_wool", "quartz_block", with_pool=True, rainbow=True)
    L.append('title @s actionbar §dREGENBOOG-huis met zwembad!')
    with open(os.path.join(FUNC, "huis_regenboog.mcfunction"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    # extra verdieping (huizen groter maken) - bovenop het huis
    L = ["# Extra verdieping bovenop je huis (groter maken)"]
    L += chunk_fill(-4, 6, 3, 4, 11, 13, "air")
    L.append("fill ~-4 ~6 ~3 ~4 ~10 ~13 quartz_block hollow")
    L.append("fill ~-4 ~11 ~3 ~4 ~11 ~13 quartz_block")
    L.append("setblock ~-4 ~8 ~8 glass")
    L.append("setblock ~4 ~8 ~8 glass")
    L.append("setblock ~0 ~10 ~8 glowstone")
    # trap naar boven
    L.append("fill ~3 ~5 ~12 ~3 ~5 ~12 quartz_stairs")
    L.append('title @s actionbar §bJe huis is groter gemaakt (extra verdieping)!')
    with open(os.path.join(FUNC, "huis_verdieping.mcfunction"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")
    print("huizen: ijzer/diamant/goud/emerald/regenboog + verdieping")


# =====================================================================
# 3. AUTO MODEL (bestuurbaar voertuig)
# =====================================================================

def generate_car_model():
    # Simpel automodel: onderstel + cabine + 4 wielen, texture 64x32
    geo = {
        "format_version": "1.16.0",
        "minecraft:geometry": [
            {
                "description": {
                    "identifier": "geometry.dorpsbaas_auto",
                    "texture_width": 64,
                    "texture_height": 32,
                    "visible_bounds_width": 3,
                    "visible_bounds_height": 2,
                    "visible_bounds_offset": [0, 0.5, 0]
                },
                "bones": [
                    {
                        "name": "body",
                        "pivot": [0, 0, 0],
                        "cubes": [
                            {"origin": [-8, 3, -14], "size": [16, 6, 28], "uv": [0, 0]},
                            {"origin": [-7, 9, -4], "size": [14, 6, 12], "uv": [0, 16]}
                        ]
                    },
                    {
                        "name": "wheels",
                        "pivot": [0, 0, 0],
                        "cubes": [
                            {"origin": [-9, 0, -12], "size": [2, 4, 4], "uv": [40, 0]},
                            {"origin": [7, 0, -12], "size": [2, 4, 4], "uv": [40, 0]},
                            {"origin": [-9, 0, 8], "size": [2, 4, 4], "uv": [40, 0]},
                            {"origin": [7, 0, 8], "size": [2, 4, 4], "uv": [40, 0]}
                        ]
                    }
                ]
            }
        ]
    }
    import json
    with open(os.path.join(MODELS, "auto.geo.json"), "w", encoding="utf-8") as f:
        json.dump(geo, f, indent=2)
    print("auto.geo.json")


# =====================================================================
# 4. TEXTURES
# =====================================================================

def _skin_base(skin=(201, 152, 106), shirt=(120, 120, 120), pants=(70, 70, 90)):
    """Bouwt een 64x64 humanoid skin (zoals Steve-layout) in gegeven kleuren."""
    img = Image.new("RGBA", (64, 64), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    # HEAD (8..15 top, 8..15 face) -> face front = (8,8)-(15,15)
    d.rectangle([8, 8, 15, 15], fill=skin)      # face
    d.rectangle([24, 8, 31, 15], fill=skin)     # head back
    d.rectangle([16, 8, 23, 15], fill=skin)     # head right
    d.rectangle([0, 8, 7, 15], fill=skin)       # head left (uv row)
    d.rectangle([8, 0, 15, 7], fill=skin)       # head top
    d.rectangle([16, 0, 23, 7], fill=(90, 60, 40))  # head bottom-ish hair
    # BODY (20,20)-(27,31) front
    d.rectangle([20, 20, 27, 31], fill=shirt)
    d.rectangle([32, 20, 39, 31], fill=shirt)   # body back
    # ARMS
    d.rectangle([44, 20, 47, 31], fill=shirt)   # right arm front
    d.rectangle([40, 20, 43, 31], fill=skin)    # right arm side (hand tone)
    d.rectangle([36, 52, 39, 63], fill=shirt)   # left arm
    # LEGS
    d.rectangle([4, 20, 7, 31], fill=pants)     # right leg
    d.rectangle([20, 52, 23, 63], fill=pants)   # left leg
    return img, d


def generate_herobrine():
    # Herobrine: grijs pak, witte gloeiende ogen
    img, d = _skin_base(skin=(178, 150, 120), shirt=(110, 110, 110), pants=(60, 60, 60))
    # gloeiende witte ogen op de face (8,8)-(15,15)
    d.rectangle([9, 11, 10, 12], fill=(255, 255, 255))
    d.rectangle([13, 11, 14, 12], fill=(255, 255, 255))
    # bruin/donker haar bovenop face
    d.rectangle([8, 8, 15, 9], fill=(60, 45, 30))
    img.save(os.path.join(TEX_ENT, "herobrine.png"))
    print("herobrine.png")


def generate_stoute_villager():
    # Stoute villager: bruin gewaad, groene neus-tint, boze rode ogen
    img, d = _skin_base(skin=(160, 120, 95), shirt=(90, 60, 40), pants=(70, 50, 35))
    # grote villager neus (donker) midden op face
    d.rectangle([11, 12, 12, 14], fill=(120, 90, 70))
    # boze rode ogen
    d.rectangle([9, 11, 10, 11], fill=(200, 30, 30))
    d.rectangle([13, 11, 14, 11], fill=(200, 30, 30))
    # unibrow
    d.rectangle([9, 10, 14, 10], fill=(40, 30, 20))
    img.save(os.path.join(TEX_ENT, "stoute_villager.png"))
    print("stoute_villager.png")


def generate_car_textures():
    colors = {
        "diamant": (110, 220, 235),
        "goud": (245, 205, 60),
        "emerald": (60, 200, 110),
    }
    for name, col in colors.items():
        img = Image.new("RGBA", (64, 32), (0, 0, 0, 0))
        d = ImageDraw.Draw(img)
        # body uv (0,0) 16x6 groot vlak -> vul een ruime zone met kleur
        d.rectangle([0, 0, 39, 15], fill=col)
        # cabine uv (0,16) -> vensters donker
        d.rectangle([0, 16, 39, 27], fill=(40, 50, 70))
        d.rectangle([2, 18, 37, 25], fill=(150, 200, 230))  # ramen
        # wielen uv (40,0)
        d.rectangle([40, 0, 47, 7], fill=(30, 30, 30))
        img.save(os.path.join(TEX_ENT, f"auto_{name}.png"))
    print("auto textures (diamant/goud/emerald)")


def generate_items():
    # muntje: gouden munt met euroteken
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    d.ellipse([2, 2, 13, 13], fill=(240, 205, 60), outline=(180, 140, 20))
    d.ellipse([4, 4, 11, 11], outline=(255, 235, 150))
    # euroteken-achtig streepje
    d.line([6, 5, 6, 10], fill=(150, 110, 10), width=1)
    d.line([5, 7, 9, 7], fill=(150, 110, 10), width=1)
    img.save(os.path.join(TEX_ITEM, "muntje.png"))

    # strik: rode strik/vlinderdas
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    d.polygon([(2, 5), (7, 8), (2, 11)], fill=(200, 30, 30))
    d.polygon([(14, 5), (9, 8), (14, 11)], fill=(200, 30, 30))
    d.rectangle([7, 6, 9, 10], fill=(150, 20, 20))
    img.save(os.path.join(TEX_ITEM, "strik.png"))
    print("item textures (muntje, strik)")


def generate_pack_icons():
    for sub in ("BP", "RP"):
        img = Image.new("RGBA", (128, 128), (35, 35, 55, 255))
        d = ImageDraw.Draw(img)
        d.rectangle([0, 0, 127, 127], outline=(240, 205, 60), width=4)
        # kroon
        d.polygon([(30, 85), (30, 45), (48, 65), (64, 40), (80, 65), (98, 45), (98, 85)],
                  fill=(240, 205, 60))
        d.rectangle([30, 85, 98, 95], fill=(240, 205, 60))
        d.ellipse([58, 30, 70, 42], fill=(220, 40, 40))
        img.save(os.path.join(MOD, sub, "pack_icon.png"))
    print("pack icons (BP + RP)")


if __name__ == "__main__":
    generate_dorp()
    generate_houses()
    generate_car_model()
    generate_herobrine()
    generate_stoute_villager()
    generate_car_textures()
    generate_items()
    generate_pack_icons()
    print("KLAAR - dorpsbaas assets gegenereerd")
