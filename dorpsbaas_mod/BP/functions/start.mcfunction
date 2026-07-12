# ==========================================================
# BAAS VAN HET DORP - START
# Bouwt een mega dorp rondom de speler + een centraal plein
# met alle keuze-platforms. Gebruik: /function start
# ==========================================================

# --- Scoreboards ---
scoreboard objectives add db_geld dummy "§b€ EUR"
scoreboard objectives add db_state dummy
scoreboard objectives setdisplay sidebar db_geld
scoreboard players add @a db_geld 0
scoreboard players set heroAlive db_state 0
scoreboard players set heroSpawn db_state 0

# --- Houd de omgeving geladen ---
tickingarea remove dorp_hub
tickingarea add ~-100 ~-10 ~-100 ~100 ~40 ~100 dorp_hub true

# --- Bouw het mega dorp (huizen + wegen) ---
function build_dorp

# --- Centraal plein ---
fill ~-16 ~-1 ~-16 ~16 ~-1 ~16 polished_andesite
fill ~-16 ~0 ~-16 ~16 ~6 ~16 air
# fontein in het midden
fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 quartz_block
fill ~-1 ~0 ~-1 ~1 ~1 ~1 quartz_block hollow
setblock ~0 ~1 ~0 water
setblock ~0 ~3 ~0 sea_lantern

# ============ PAK-PLATFORMS (rij noord, z=-13) ============
fill ~-6 ~-1 ~-14 ~-4 ~-1 ~-12 black_wool
summon dorpsbaas:keuze ~-5 ~0 ~-13 0 0 dorpsbaas:pak_zwart mk
summon armor_stand "§0§lZWART PAK\n§r§7Stap erop voor een\n§7zwart pak + rode strik" ~-5 ~1 ~-13
fill ~-1 ~-1 ~-14 ~1 ~-1 ~-12 light_gray_wool
summon dorpsbaas:keuze ~0 ~0 ~-13 0 0 dorpsbaas:pak_grijs mk
summon armor_stand "§7§lGRIJS PAK\n§r§7(dit is ook Herobrine's kleur!)" ~0 ~1 ~-13
fill ~4 ~-1 ~-14 ~6 ~-1 ~-12 blue_wool
summon dorpsbaas:keuze ~5 ~0 ~-13 0 0 dorpsbaas:pak_blauw mk
summon armor_stand "§9§lBLAUW PAK\n§r§7Stap erop voor een\n§7blauw pak + rode strik" ~5 ~1 ~-13

# ============ AUTO-PLATFORMS (rij, z=-5) ============
fill ~-7 ~-1 ~-6 ~-5 ~-1 ~-4 light_blue_wool
summon dorpsbaas:keuze ~-6 ~0 ~-5 0 0 dorpsbaas:auto_diamant mk
summon armor_stand "§b§lDIAMANTEN AUTO\n§r§7Bestuurbaar! Stap erop" ~-6 ~1 ~-5
fill ~-1 ~-1 ~-6 ~1 ~-1 ~-4 yellow_wool
summon dorpsbaas:keuze ~0 ~0 ~-5 0 0 dorpsbaas:auto_goud mk
summon armor_stand "§e§lGOUDEN AUTO\n§r§7(Herobrine kiest deze!)" ~0 ~1 ~-5
fill ~5 ~-1 ~-6 ~7 ~-1 ~-4 green_wool
summon dorpsbaas:keuze ~6 ~0 ~-5 0 0 dorpsbaas:auto_emerald mk
summon armor_stand "§a§lEMERALD AUTO\n§r§7Bestuurbaar! Stap erop" ~6 ~1 ~-5

# ============ HUIS-PLATFORMS (rij, z=5) ============
fill ~-10 ~-1 ~4 ~-8 ~-1 ~6 white_wool
summon dorpsbaas:keuze ~-9 ~0 ~5 0 0 dorpsbaas:huis_ijzer mk
summon armor_stand "§f§lIJZEREN HUIS" ~-9 ~1 ~5
fill ~-4 ~-1 ~4 ~-2 ~-1 ~6 cyan_wool
summon dorpsbaas:keuze ~-3 ~0 ~5 0 0 dorpsbaas:huis_diamant mk
summon armor_stand "§b§lDIAMANTEN HUIS" ~-3 ~1 ~5
fill ~2 ~-1 ~4 ~4 ~-1 ~6 orange_wool
summon dorpsbaas:keuze ~3 ~0 ~5 0 0 dorpsbaas:huis_goud mk
summon armor_stand "§6§lGOUDEN HUIS" ~3 ~1 ~5
fill ~8 ~-1 ~4 ~10 ~-1 ~6 lime_wool
summon dorpsbaas:keuze ~9 ~0 ~5 0 0 dorpsbaas:huis_emerald mk
summon armor_stand "§a§lEMERALD HUIS" ~9 ~1 ~5

# ============ HEROBRINE + GROTER (rij, z=13) ============
fill ~-5 ~-1 ~12 ~-3 ~-1 ~14 red_wool
summon dorpsbaas:keuze ~-4 ~0 ~13 0 0 dorpsbaas:hero mk
summon armor_stand "§c§lVERSLA HEROBRINE\n§r§7Stap erop als je een\n§7pak, auto en huis hebt!" ~-4 ~1 ~13
fill ~3 ~-1 ~12 ~5 ~-1 ~14 purple_wool
summon dorpsbaas:keuze ~4 ~0 ~13 0 0 dorpsbaas:groter mk
summon armor_stand "§5§lHUIS GROTER MAKEN\n§r§7Kan na Herobrine verslaan" ~4 ~1 ~13

# --- Centrale uitleg ---
summon armor_stand "§6§lBAAS VAN HET DORP\n§r§eDoe de opdrachten om de BAAS te worden!\n§71) Pak  2) Auto  3) Huis\n§74) Versla Herobrine  5) Groter  6) Rijk & Beroemd" ~0 ~4 ~0

# --- Speler in het midden ---
tp @s ~0 ~1 ~0
gamerule showcoordinates true

# --- Welkom ---
title @s clear
title @s title §6§lBAAS VAN HET DORP
title @s subtitle §eWord jij de baas van het dorp?
tellraw @a {"rawtext":[{"text":"§6==================================="}]}
tellraw @a {"rawtext":[{"text":"§e§lWELKOM IN HET MEGA DORP!"}]}
tellraw @a {"rawtext":[{"text":"§7Word de BAAS voordat §8§lHerobrine§r§7 het wordt!"}]}
tellraw @a {"rawtext":[{"text":"§6==================================="}]}
tellraw @a {"rawtext":[{"text":"§fOpdrachten (stap op de platforms):"}]}
tellraw @a {"rawtext":[{"text":"§71. §fKoop een PAK (met rode strik)"}]}
tellraw @a {"rawtext":[{"text":"§72. §fKoop een AUTO (bestuurbaar!)"}]}
tellraw @a {"rawtext":[{"text":"§73. §fKoop een HUIS"}]}
tellraw @a {"rawtext":[{"text":"§74. §fVersla §8§lHEROBRINE"}]}
tellraw @a {"rawtext":[{"text":"§75. §fMaak je huis GROTER"}]}
tellraw @a {"rawtext":[{"text":"§76. §fWord RIJK (100 EUR = emerald, 1000 EUR = regenboog + zwembad) en BEROEMD"}]}
tellraw @a {"rawtext":[{"text":"§7Geld verdien je met opdrachten §fén §7door Herobrine's mobs te verslaan!"}]}
