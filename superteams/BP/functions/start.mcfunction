# ==========================================
# SUPERTEAMS - START PLATFORM
# Bouwt het hub platform op vaste positie (0, 80, 0)
# zodat het niet botst met de teameilanden op y=70
# Gebruik: /function start
# ==========================================

# --- Scoreboards aanmaken (mislukt zonder warning als ze al bestaan) ---
scoreboard objectives add shards dummy "Sjards"
scoreboard objectives add aura_t dummy "Aura Timer"

# --- Speler eerst naar vaste hub-positie ---
tp @s 0 80 0

# --- Maak ruimte (31x31x10) ---
fill ~-15 ~ ~-15 ~15 ~10 ~15 air

# --- Platform vloer (stenen tegels) ---
fill ~-15 ~-1 ~-15 ~15 ~-1 ~15 stone_bricks

# --- Buitenrand van mossy stone bricks voor sfeer ---
fill ~-15 ~ ~-15 ~15 ~ ~-15 mossy_stone_bricks
fill ~-15 ~ ~15 ~15 ~ ~15 mossy_stone_bricks
fill ~-15 ~ ~-15 ~-15 ~ ~15 mossy_stone_bricks
fill ~15 ~ ~-15 ~15 ~ ~15 mossy_stone_bricks

# --- Middenfontein als spawnpunt ---
fill ~-2 ~ ~-2 ~2 ~ ~2 polished_andesite
setblock ~0 ~ ~0 beacon
setblock ~0 ~-1 ~0 diamond_block
setblock ~-1 ~ ~0 sea_lantern
setblock ~1 ~ ~0 sea_lantern
setblock ~0 ~ ~-1 sea_lantern
setblock ~0 ~ ~1 sea_lantern

# === PORTAL NOORD (FIRE / VUUR) at ~0 ~ ~-12 ===
# Vloer plaat (5x5 rood beton)
fill ~-2 ~-1 ~-14 ~2 ~-1 ~-10 red_concrete
# Verlichting
setblock ~-2 ~ ~-14 fire
setblock ~2 ~ ~-14 fire
setblock ~-2 ~ ~-10 fire
setblock ~2 ~ ~-10 fire
# 4 obsidian pilaren (4 hoog)
fill ~-2 ~ ~-13 ~-2 ~4 ~-13 obsidian
fill ~2 ~ ~-13 ~2 ~4 ~-13 obsidian
fill ~-2 ~ ~-11 ~-2 ~4 ~-11 obsidian
fill ~2 ~ ~-11 ~2 ~4 ~-11 obsidian
# Bovenste boog
fill ~-2 ~4 ~-13 ~2 ~4 ~-11 obsidian
# Achterwand met rood glas
fill ~-1 ~1 ~-13 ~1 ~3 ~-13 red_stained_glass
# Magma onder de glas plaat
fill ~-1 ~ ~-13 ~1 ~ ~-13 magma
# Hoek lantaarns
setblock ~-2 ~4 ~-13 soul_lantern
setblock ~2 ~4 ~-13 soul_lantern
# Hangend bord uitleg (achterkant op de magma — speler kijkt vanaf zuid)
setblock ~0 ~3 ~-14 standing_sign
# Portal marker entity in het midden van de plaat
summon superteams:portal_marker ~0 ~ ~-12 superteams:become_fire fire_portal

# === PORTAL ZUID (LIGHTNING / BLIKSEM) at ~0 ~ ~12 ===
fill ~-2 ~-1 ~10 ~2 ~-1 ~14 yellow_concrete
setblock ~-2 ~ ~10 fire
setblock ~2 ~ ~10 fire
setblock ~-2 ~ ~14 fire
setblock ~2 ~ ~14 fire
fill ~-2 ~ ~11 ~-2 ~4 ~11 obsidian
fill ~2 ~ ~11 ~2 ~4 ~11 obsidian
fill ~-2 ~ ~13 ~-2 ~4 ~13 obsidian
fill ~2 ~ ~13 ~2 ~4 ~13 obsidian
fill ~-2 ~4 ~11 ~2 ~4 ~13 obsidian
fill ~-1 ~1 ~13 ~1 ~3 ~13 yellow_stained_glass
fill ~-1 ~ ~13 ~1 ~ ~13 sea_lantern
setblock ~-2 ~4 ~13 sea_lantern
setblock ~2 ~4 ~13 sea_lantern
setblock ~0 ~3 ~14 standing_sign
summon superteams:portal_marker ~0 ~ ~12 superteams:become_lightning lightning_portal

# === PORTAL OOST (EARTH / AARDE) at ~12 ~ ~0 ===
fill ~10 ~-1 ~-2 ~14 ~-1 ~2 green_concrete
setblock ~10 ~ ~-2 fire
setblock ~14 ~ ~-2 fire
setblock ~10 ~ ~2 fire
setblock ~14 ~ ~2 fire
fill ~11 ~ ~-2 ~11 ~4 ~-2 obsidian
fill ~13 ~ ~-2 ~13 ~4 ~-2 obsidian
fill ~11 ~ ~2 ~11 ~4 ~2 obsidian
fill ~13 ~ ~2 ~13 ~4 ~2 obsidian
fill ~11 ~4 ~-2 ~13 ~4 ~2 obsidian
fill ~13 ~1 ~-1 ~13 ~3 ~1 lime_stained_glass
fill ~13 ~ ~-1 ~13 ~ ~1 moss_block
setblock ~13 ~4 ~-2 lantern
setblock ~13 ~4 ~2 lantern
setblock ~14 ~3 ~0 standing_sign
summon superteams:portal_marker ~12 ~ ~0 superteams:become_earth earth_portal

# === PORTAL WEST (ICE / IJS) at ~-12 ~ ~0 ===
fill ~-14 ~-1 ~-2 ~-10 ~-1 ~2 light_blue_concrete
setblock ~-14 ~ ~-2 fire
setblock ~-10 ~ ~-2 fire
setblock ~-14 ~ ~2 fire
setblock ~-10 ~ ~2 fire
fill ~-13 ~ ~-2 ~-13 ~4 ~-2 obsidian
fill ~-11 ~ ~-2 ~-11 ~4 ~-2 obsidian
fill ~-13 ~ ~2 ~-13 ~4 ~2 obsidian
fill ~-11 ~ ~2 ~-11 ~4 ~2 obsidian
fill ~-13 ~4 ~-2 ~-11 ~4 ~2 obsidian
fill ~-13 ~1 ~-1 ~-13 ~3 ~1 light_blue_stained_glass
fill ~-13 ~ ~-1 ~-13 ~ ~1 packed_ice
setblock ~-13 ~4 ~-2 soul_lantern
setblock ~-13 ~4 ~2 soul_lantern
setblock ~-14 ~3 ~0 standing_sign
summon superteams:portal_marker ~-12 ~ ~0 superteams:become_ice ice_portal

# --- Houd hub geladen ---
tickingarea add ~-20 ~-2 ~-20 ~20 ~10 ~20 superteams_hub true

# --- Bouw ook alle 4 eilanden alvast op vaste coordinaten ---
function island_fire
function island_ice
function island_lightning
function island_earth

# --- Speler op spawnpunt zetten (boven de beacon op het center) ---
tp @s 0 82 0

# --- Welkomstbericht ---
title @s clear
title @s title §6§lSUPERTEAMS
title @s subtitle §eKies een portal om je team te starten!
tellraw @s {"rawtext":[{"text":"§6==========================="}]}
tellraw @s {"rawtext":[{"text":"§e§lWELKOM BIJ SUPERTEAMS!"}]}
tellraw @s {"rawtext":[{"text":"§6==========================="}]}
tellraw @s {"rawtext":[{"text":"§cN: §lTEAM VUUR §r§7- Vuurresistentie & sterkte"}]}
tellraw @s {"rawtext":[{"text":"§bW: §lTEAM IJS §r§7- Sneeuwlopen & vertraging immuun"}]}
tellraw @s {"rawtext":[{"text":"§eZ: §lTEAM BLIKSEM §r§7- Snelheid & sprongkracht"}]}
tellraw @s {"rawtext":[{"text":"§aO: §lTEAM AARDE §r§7- Resistance & extra leven"}]}
tellraw @s {"rawtext":[{"text":"§6==========================="}]}
tellraw @s {"rawtext":[{"text":"§7Loop naar de gekleurde portal en stap erop!"}]}
