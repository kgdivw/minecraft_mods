# ==========================================
# SUPERTEAMS - START PLATFORM
# Bouwt het hub platform op vaste positie (0, 80, 0) met absolute coords
# (anders worden ~ relatief gerekend tov speler-positie BIJ FUNCTIE-START,
# niet tov de tp-bestemming)
# Gebruik: /function start
# ==========================================

# --- Scoreboards aanmaken (idempotent) ---
scoreboard objectives add shards dummy "Sjards"
scoreboard objectives add aura_t dummy "Aura Timer"

# --- KRITIEK: speler EERST naar de hub teleporteren ---
# Hierdoor laden de chunks rond (0,80,0). Anders mislukken alle fills
# stilletjes omdat ze op niet-geladen chunks proberen te bouwen.
tp @s 0 95 0

# --- Tickingarea voor hub VOOR het bouwen ---
tickingarea add -20 78 -20 20 90 20 superteams_hub true

# --- Maak ruimte (31x31x11) ---
fill -15 80 -15 15 90 15 air

# --- Platform vloer ---
fill -15 79 -15 15 79 15 stone_bricks

# --- Buitenrand (mossy stone bricks) ---
fill -15 80 -15 15 80 -15 mossy_stone_bricks
fill -15 80 15 15 80 15 mossy_stone_bricks
fill -15 80 -15 -15 80 15 mossy_stone_bricks
fill 15 80 -15 15 80 15 mossy_stone_bricks

# --- Middenfontein als spawnpunt ---
fill -2 79 -2 2 79 2 polished_andesite
setblock 0 80 0 beacon
setblock 0 78 0 diamond_block
setblock -1 80 0 sea_lantern
setblock 1 80 0 sea_lantern
setblock 0 80 -1 sea_lantern
setblock 0 80 1 sea_lantern

# === PORTAL NOORD (FIRE / VUUR) at (0, 80, -12) ===
fill -2 79 -14 2 79 -10 red_concrete
setblock -2 80 -14 fire
setblock 2 80 -14 fire
setblock -2 80 -10 fire
setblock 2 80 -10 fire
fill -2 80 -13 -2 84 -13 obsidian
fill 2 80 -13 2 84 -13 obsidian
fill -2 80 -11 -2 84 -11 obsidian
fill 2 80 -11 2 84 -11 obsidian
fill -2 84 -13 2 84 -11 obsidian
fill -1 81 -13 1 83 -13 red_stained_glass
fill -1 80 -13 1 80 -13 magma
setblock -2 84 -13 soul_lantern
setblock 2 84 -13 soul_lantern
setblock 0 83 -14 standing_sign
summon superteams:portal_marker 0 80 -12 0 0 superteams:become_fire fire_portal

# === PORTAL ZUID (LIGHTNING / BLIKSEM) at (0, 80, 12) ===
fill -2 79 10 2 79 14 yellow_concrete
setblock -2 80 10 fire
setblock 2 80 10 fire
setblock -2 80 14 fire
setblock 2 80 14 fire
fill -2 80 11 -2 84 11 obsidian
fill 2 80 11 2 84 11 obsidian
fill -2 80 13 -2 84 13 obsidian
fill 2 80 13 2 84 13 obsidian
fill -2 84 11 2 84 13 obsidian
fill -1 81 13 1 83 13 yellow_stained_glass
fill -1 80 13 1 80 13 sea_lantern
setblock -2 84 13 sea_lantern
setblock 2 84 13 sea_lantern
setblock 0 83 14 standing_sign
summon superteams:portal_marker 0 80 12 0 0 superteams:become_lightning lightning_portal

# === PORTAL OOST (EARTH / AARDE) at (12, 80, 0) ===
fill 10 79 -2 14 79 2 green_concrete
setblock 10 80 -2 fire
setblock 14 80 -2 fire
setblock 10 80 2 fire
setblock 14 80 2 fire
fill 11 80 -2 11 84 -2 obsidian
fill 13 80 -2 13 84 -2 obsidian
fill 11 80 2 11 84 2 obsidian
fill 13 80 2 13 84 2 obsidian
fill 11 84 -2 13 84 2 obsidian
fill 13 81 -1 13 83 1 lime_stained_glass
fill 13 80 -1 13 80 1 moss_block
setblock 13 84 -2 lantern
setblock 13 84 2 lantern
setblock 14 83 0 standing_sign
summon superteams:portal_marker 12 80 0 0 0 superteams:become_earth earth_portal

# === PORTAL WEST (ICE / IJS) at (-12, 80, 0) ===
fill -14 79 -2 -10 79 2 light_blue_concrete
setblock -14 80 -2 fire
setblock -10 80 -2 fire
setblock -14 80 2 fire
setblock -10 80 2 fire
fill -13 80 -2 -13 84 -2 obsidian
fill -11 80 -2 -11 84 -2 obsidian
fill -13 80 2 -13 84 2 obsidian
fill -11 80 2 -11 84 2 obsidian
fill -13 84 -2 -11 84 2 obsidian
fill -13 81 -1 -13 83 1 light_blue_stained_glass
fill -13 80 -1 -13 80 1 packed_ice
setblock -13 84 -2 soul_lantern
setblock -13 84 2 soul_lantern
setblock -14 83 0 standing_sign
summon superteams:portal_marker -12 80 0 0 0 superteams:become_ice ice_portal

# --- Wereld-state scoreboard voor lazy island building ---
scoreboard objectives add world_state dummy
# (eilanden worden gebouwd bij eerste portal-doorgang, zie enter_*.mcfunction)

# --- Speler op spawnpunt zetten (boven de beacon) ---
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
