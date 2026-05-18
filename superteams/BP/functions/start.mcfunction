# ==========================================
# SUPERTEAMS - START PLATFORM
# Bouwt het hub platform RONDOM de speler met relatieve coords.
# Bedrock kan geen fills doen op niet-geladen chunks, dus we
# bouwen op de plek waar de speler nu staat (chunks zeker geladen).
# Gebruik: /function start
# ==========================================

# --- Scoreboards aanmaken ---
scoreboard objectives add shards dummy "Sjards"
scoreboard objectives add aura_t dummy "Aura Timer"
scoreboard objectives add world_state dummy

# --- Maak ruimte (31x31x11) ---
fill ~-15 ~ ~-15 ~15 ~10 ~15 air

# --- Platform vloer ---
fill ~-15 ~-1 ~-15 ~15 ~-1 ~15 stone_bricks

# --- Buitenrand (mossy stone bricks) ---
fill ~-15 ~ ~-15 ~15 ~ ~-15 mossy_stone_bricks
fill ~-15 ~ ~15 ~15 ~ ~15 mossy_stone_bricks
fill ~-15 ~ ~-15 ~-15 ~ ~15 mossy_stone_bricks
fill ~15 ~ ~-15 ~15 ~ ~15 mossy_stone_bricks

# --- Middenfontein ---
fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 polished_andesite
setblock ~-1 ~ ~0 sea_lantern
setblock ~1 ~ ~0 sea_lantern
setblock ~0 ~ ~-1 sea_lantern
setblock ~0 ~ ~1 sea_lantern

# === PORTAL NOORD (FIRE / VUUR) at relatief 0, 0, -12 ===
fill ~-2 ~-1 ~-14 ~2 ~-1 ~-10 red_concrete
setblock ~-2 ~ ~-14 fire
setblock ~2 ~ ~-14 fire
setblock ~-2 ~ ~-10 fire
setblock ~2 ~ ~-10 fire
fill ~-2 ~ ~-13 ~-2 ~4 ~-13 obsidian
fill ~2 ~ ~-13 ~2 ~4 ~-13 obsidian
fill ~-2 ~ ~-11 ~-2 ~4 ~-11 obsidian
fill ~2 ~ ~-11 ~2 ~4 ~-11 obsidian
fill ~-2 ~4 ~-13 ~2 ~4 ~-11 obsidian
fill ~-1 ~1 ~-13 ~1 ~3 ~-13 red_stained_glass
fill ~-1 ~ ~-13 ~1 ~ ~-13 magma
setblock ~-2 ~4 ~-13 soul_lantern
setblock ~2 ~4 ~-13 soul_lantern
summon superteams:portal_marker ~0 ~ ~-12 0 0 superteams:become_fire fire_portal
summon armor_stand "§c§l🔥 TEAM VUUR\n§r§7Stap erop voor:\n§6Vuurresistentie + Sterkte" ~0 ~3 ~-12

# === PORTAL ZUID (LIGHTNING / BLIKSEM) at relatief 0, 0, 12 ===
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
summon superteams:portal_marker ~0 ~ ~12 0 0 superteams:become_lightning lightning_portal
summon armor_stand "§e§l⚡ TEAM BLIKSEM\n§r§7Stap erop voor:\n§6Snelheid + Sprongkracht" ~0 ~3 ~12

# === PORTAL OOST (EARTH / AARDE) at relatief 12, 0, 0 ===
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
summon superteams:portal_marker ~12 ~ ~0 0 0 superteams:become_earth earth_portal
summon armor_stand "§a§l🪨 TEAM AARDE\n§r§7Stap erop voor:\n§2Resistance + Extra Leven" ~12 ~3 ~0

# === PORTAL WEST (ICE / IJS) at relatief -12, 0, 0 ===
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
summon superteams:portal_marker ~-12 ~ ~0 0 0 superteams:become_ice ice_portal
summon armor_stand "§b§l❄️ TEAM IJS\n§r§7Stap erop voor:\n§3Water Ademen + Conduit Power" ~-12 ~3 ~0

# --- Centrale instructie-armor-stand bij de beacon ---
summon armor_stand "§6§lSUPERTEAMS HUB\n§r§eTyp §6/function help §evoor alle commandos\n§7Loop naar een gekleurde portal!" ~0 ~3 ~0

# --- Houd hub geladen (relatief om speler-positie) ---
tickingarea add ~-20 ~-2 ~-20 ~20 ~10 ~20 superteams_hub true

# --- Speler iets boven het midden ---
tp @s ~0 ~2 ~0

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
