# ==========================================================
# RIDDER MOD - START / KEUZE-HAL
# Bouwt een kleine stenen hal RONDOM de speler met 3 portals:
# Ridder (west), Prins/Prinses (noord), Koning/Koningin (oost).
# Gebruik: /function start
# ==========================================================

# --- Scoreboards (rm_state houdt bij of kasteel/leger al gebouwd zijn) ---
scoreboard objectives add rm_state dummy

# --- Laad beide kasteel-locaties alvast (chunks moeten geladen zijn voor we
#     ze bouwen als je straks een rol kiest) ---
tickingarea add 1895 40 1895 2105 200 2105 ridder_kasteel true
tickingarea add 1895 40 1595 2105 200 1805 rood_kasteel true

# --- Ruimte + vloer van de keuze-hal (21x21) ---
fill ~-10 ~ ~-10 ~10 ~7 ~10 air
fill ~-10 ~-1 ~-10 ~10 ~-1 ~10 stone_bricks
fill ~-10 ~ ~-10 ~10 ~ ~10 polished_andesite

# --- Muren rondom ---
fill ~-10 ~ ~-10 ~10 ~5 ~-10 stone_bricks
fill ~-10 ~ ~10 ~10 ~5 ~10 stone_bricks
fill ~-10 ~ ~-10 ~-10 ~5 ~10 stone_bricks
fill ~10 ~ ~-10 ~10 ~5 ~10 stone_bricks
fill ~-10 ~6 ~-10 ~10 ~6 ~10 stone_bricks

# --- Fakkels rondom (kasteelsfeer) ---
setblock ~-9 ~3 ~-9 torch
setblock ~9 ~3 ~-9 torch
setblock ~-9 ~3 ~9 torch
setblock ~9 ~3 ~9 torch
setblock ~0 ~5 ~0 lantern

# === PORTAL WEST: RIDDER (ijzeren frame) ===
fill ~-9 ~-1 ~-2 ~-7 ~-1 ~2 iron_block
fill ~-8 ~ ~-1 ~-8 ~3 ~-1 iron_bars
fill ~-8 ~ ~1 ~-8 ~3 ~1 iron_bars
fill ~-8 ~3 ~-1 ~-8 ~3 ~1 iron_bars
fill ~-8 ~ ~0 ~-8 ~2 ~0 light_gray_stained_glass
setblock ~-9 ~4 ~0 sea_lantern
summon ridder_mod:keuze_portal ~-8 ~ ~0 90 0 ridder_mod:word_ridder ridder_portal
summon armor_stand "§7§l⚔ RIDDER\n§r§7Stap erop voor:\n§fHarnas, zwaard, schild,\n§fboog, speer, kruisboog & pijlen" ~-8 ~3 ~0

# === PORTAL NOORD: PRINS / PRINSES (diamanten frame) ===
fill ~-2 ~-1 ~-9 ~2 ~-1 ~-7 diamond_block
fill ~-1 ~ ~-8 ~-1 ~3 ~-8 light_blue_stained_glass
fill ~1 ~ ~-8 ~1 ~3 ~-8 light_blue_stained_glass
fill ~-1 ~3 ~-8 ~1 ~3 ~-8 diamond_block
fill ~0 ~ ~-8 ~0 ~2 ~-8 light_blue_stained_glass
setblock ~0 ~4 ~-9 sea_lantern
summon ridder_mod:keuze_portal ~0 ~ ~-8 180 0 ridder_mod:word_prins prins_portal
summon armor_stand "§b§l♦ PRINS / PRINSES\n§r§7Stap erop voor:\n§bDiamanten harnas\n§b+ diamanten troon" ~0 ~3 ~-8

# === PORTAL OOST: KONING / KONINGIN (gouden frame) ===
fill ~7 ~-1 ~-2 ~9 ~-1 ~2 gold_block
fill ~8 ~ ~-1 ~8 ~3 ~-1 yellow_stained_glass
fill ~8 ~ ~1 ~8 ~3 ~1 yellow_stained_glass
fill ~8 ~3 ~-1 ~8 ~3 ~1 gold_block
fill ~8 ~ ~0 ~8 ~2 ~0 yellow_stained_glass
setblock ~9 ~4 ~0 sea_lantern
summon ridder_mod:keuze_portal ~8 ~ ~0 270 0 ridder_mod:word_koning koning_portal
summon armor_stand "§6§l♚ KONING / KONINGIN\n§r§7Stap erop voor:\n§6Gouden harnas, kroon\n§6+ gouden troon" ~8 ~3 ~0

# --- Centrale uitleg ---
summon armor_stand "§6§lRIDDER MOD\n§r§eLoop naar een portal en stap erop!\n§7/function help voor hulp" ~0 ~3 ~0

# --- Houd de hal geladen ---
tickingarea add ~-14 ~-2 ~-14 ~14 ~10 ~14 ridder_hub true

# --- Speler in het midden ---
tp @s ~0 ~1 ~0

# --- Welkom ---
title @s clear
title @s title §6§lRIDDER MOD
title @s subtitle §eKies: Ridder, Prins of Koning!
tellraw @s {"rawtext":[{"text":"§6==============================="}]}
tellraw @s {"rawtext":[{"text":"§e§lWELKOM BIJ DE RIDDER MOD!"}]}
tellraw @s {"rawtext":[{"text":"§6==============================="}]}
tellraw @s {"rawtext":[{"text":"§7◀ WEST: §f⚔ RIDDER §7- sterkste wapens"}]}
tellraw @s {"rawtext":[{"text":"§7▲ NOORD: §b♦ PRINS/PRINSES §7- diamanten troon"}]}
tellraw @s {"rawtext":[{"text":"§7▶ OOST: §6♚ KONING/KONINGIN §7- gouden troon"}]}
tellraw @s {"rawtext":[{"text":"§6==============================="}]}
tellraw @s {"rawtext":[{"text":"§7Loop naar een portal en stap erop om te kiezen!"}]}
