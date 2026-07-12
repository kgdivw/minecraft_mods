# ==========================================================
# BAAS VAN HET DORP - START
# Bouwt het dorp + een dorpsplein met echte WINKELS rondom.
# Gebruik: /function start
# ==========================================================

# --- Scoreboards ---
scoreboard objectives add db_geld dummy "§b€ EUR"
scoreboard objectives add db_state dummy
scoreboard objectives setdisplay sidebar db_geld
scoreboard players add @a db_geld 0
scoreboard players set heroAlive db_state 0
scoreboard players set heroSpawn db_state 0
scoreboard players set praat db_state 0

# --- Houd de omgeving geladen (zodat het dorp meteen verschijnt) ---
tickingarea remove dorp_hub
tickingarea add ~-64 ~-10 ~-64 ~64 ~40 ~64 dorp_hub true

# --- Bouw het dorp (huizen + wegen + dorpelingen) ---
function build_dorp

# --- Dorpsplein ---
fill ~-13 ~-1 ~-13 ~13 ~-1 ~13 stone_bricks
fill ~-13 ~0 ~-13 ~13 ~6 ~13 air
fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 quartz_block
fill ~-1 ~0 ~-1 ~1 ~1 ~1 quartz_block
setblock ~0 ~0 ~0 water
setblock ~0 ~2 ~0 sea_lantern

# ============================================================
# WINKEL 1 - KLEERMAKER (blauw pak), noordkant, open naar plein
# ============================================================
fill ~-5 ~-1 ~-23 ~5 ~-1 ~-16 blue_terracotta
fill ~-5 ~0 ~-23 ~5 ~4 ~-23 blue_terracotta
fill ~-5 ~0 ~-23 ~-5 ~4 ~-16 blue_terracotta
fill ~5 ~0 ~-23 ~5 ~4 ~-16 blue_terracotta
fill ~-5 ~5 ~-23 ~5 ~5 ~-16 light_blue_concrete
fill ~-3 ~0 ~-20 ~3 ~1 ~-20 spruce_fence
setblock ~0 ~2 ~-16 sea_lantern
summon dorpsbaas:dorpeling "§9Kleermaker" ~0 ~1 ~-22
fill ~-1 ~-1 ~-18 ~1 ~-1 ~-18 blue_wool
summon dorpsbaas:keuze ~0 ~0 ~-18 0 0 dorpsbaas:pak mk
summon armor_stand "§9§lKLEERMAKER\n§r§7Stap op de mat voor een\n§9blauw pak met rode strik" ~0 ~2 ~-18

# ============================================================
# WINKEL 2 - GARAGE (auto's), westkant, open naar plein (+x)
# ============================================================
fill ~-23 ~-1 ~-5 ~-16 ~-1 ~5 gray_concrete
fill ~-23 ~0 ~-5 ~-23 ~4 ~5 gray_concrete
fill ~-23 ~0 ~-5 ~-16 ~4 ~-5 gray_concrete
fill ~-23 ~0 ~5 ~-16 ~4 ~5 gray_concrete
fill ~-23 ~5 ~-5 ~-16 ~5 ~5 iron_block
setblock ~-16 ~2 ~0 sea_lantern
summon dorpsbaas:dorpeling "§7Monteur" ~-22 ~1 ~0
fill ~-19 ~-1 ~-3 ~-19 ~-1 ~-3 light_blue_wool
summon dorpsbaas:keuze ~-19 ~0 ~-3 0 0 dorpsbaas:auto_diamant mk
summon armor_stand "§b§lDIAMANTEN AUTO" ~-19 ~2 ~-3
fill ~-19 ~-1 ~0 ~-19 ~-1 ~0 yellow_wool
summon dorpsbaas:keuze ~-19 ~0 ~0 0 0 dorpsbaas:auto_goud mk
summon armor_stand "§e§lGOUDEN AUTO §7(Herobrine's keuze)" ~-19 ~2 ~0
fill ~-19 ~-1 ~3 ~-19 ~-1 ~3 green_wool
summon dorpsbaas:keuze ~-19 ~0 ~3 0 0 dorpsbaas:auto_emerald mk
summon armor_stand "§a§lEMERALD AUTO" ~-19 ~2 ~3

# ============================================================
# WINKEL 3 - MAKELAAR (huizen), oostkant, open naar plein (-x)
# ============================================================
fill ~16 ~-1 ~-8 ~23 ~-1 ~8 brown_terracotta
fill ~23 ~0 ~-8 ~23 ~4 ~8 brown_terracotta
fill ~16 ~0 ~-8 ~23 ~4 ~-8 brown_terracotta
fill ~16 ~0 ~8 ~23 ~4 ~8 brown_terracotta
fill ~16 ~5 ~-8 ~23 ~5 ~8 dark_oak_planks
setblock ~16 ~2 ~0 sea_lantern
summon dorpsbaas:dorpeling "§6Makelaar" ~22 ~1 ~0
fill ~19 ~-1 ~-6 ~19 ~-1 ~-6 white_wool
summon dorpsbaas:keuze ~19 ~0 ~-6 0 0 dorpsbaas:huis_ijzer mk
summon armor_stand "§f§lIJZEREN HUIS" ~19 ~2 ~-6
fill ~19 ~-1 ~-2 ~19 ~-1 ~-2 cyan_wool
summon dorpsbaas:keuze ~19 ~0 ~-2 0 0 dorpsbaas:huis_diamant mk
summon armor_stand "§b§lDIAMANTEN HUIS" ~19 ~2 ~-2
fill ~19 ~-1 ~2 ~19 ~-1 ~2 orange_wool
summon dorpsbaas:keuze ~19 ~0 ~2 0 0 dorpsbaas:huis_goud mk
summon armor_stand "§6§lGOUDEN HUIS" ~19 ~2 ~2
fill ~19 ~-1 ~6 ~19 ~-1 ~6 lime_wool
summon dorpsbaas:keuze ~19 ~0 ~6 0 0 dorpsbaas:huis_emerald mk
summon armor_stand "§a§lEMERALD HUIS" ~19 ~2 ~6

# ============================================================
# WINKEL 4 - GEMEENTEHUIS (Herobrine + groter), zuidkant
# ============================================================
fill ~-6 ~-1 ~16 ~6 ~-1 ~23 quartz_block
fill ~-6 ~0 ~23 ~6 ~4 ~23 quartz_block
fill ~-6 ~0 ~16 ~-6 ~4 ~23 quartz_block
fill ~6 ~0 ~16 ~6 ~4 ~23 quartz_block
fill ~-6 ~5 ~16 ~6 ~5 ~23 chiseled_quartz_block
setblock ~0 ~2 ~16 sea_lantern
summon dorpsbaas:dorpeling "§eBurgemeester" ~0 ~1 ~22
fill ~-2 ~-1 ~19 ~-2 ~-1 ~19 red_wool
summon dorpsbaas:keuze ~-2 ~0 ~19 0 0 dorpsbaas:hero mk
summon armor_stand "§c§lVERSLA HEROBRINE\n§r§7Kan met pak + auto + huis" ~-2 ~2 ~19
fill ~2 ~-1 ~19 ~2 ~-1 ~19 purple_wool
summon dorpsbaas:keuze ~2 ~0 ~19 0 0 dorpsbaas:groter mk
summon armor_stand "§5§lHUIS GROTER\n§r§7Kan na Herobrine" ~2 ~2 ~19

# --- Centrale uitleg ---
summon armor_stand "§6§lBAAS VAN HET DORP\n§r§eDoe de opdrachten in de winkels!\n§7N: Kleermaker  W: Garage  O: Makelaar  Z: Gemeentehuis" ~0 ~3 ~0

# --- Speler in het midden ---
tp @s ~0 ~1 ~0
gamerule showcoordinates true

# --- Welkom ---
title @s clear
title @s title §6§lBAAS VAN HET DORP
title @s subtitle §eWord jij de baas van het dorp?
tellraw @a {"rawtext":[{"text":"§6==================================="}]}
tellraw @a {"rawtext":[{"text":"§e§lWELKOM IN HET DORP!"}]}
tellraw @a {"rawtext":[{"text":"§7Word de BAAS voordat §8§lHerobrine§r§7 het wordt!"}]}
tellraw @a {"rawtext":[{"text":"§6==================================="}]}
tellraw @a {"rawtext":[{"text":"§fGa naar de winkels op het plein:"}]}
tellraw @a {"rawtext":[{"text":"§7• §9Kleermaker§7 (noord): blauw pak met strik"}]}
tellraw @a {"rawtext":[{"text":"§7• §8Garage§7 (west): bestuurbare auto"}]}
tellraw @a {"rawtext":[{"text":"§7• §6Makelaar§7 (oost): een eigen huis"}]}
tellraw @a {"rawtext":[{"text":"§7• §eGemeentehuis§7 (zuid): versla Herobrine + huis groter"}]}
tellraw @a {"rawtext":[{"text":"§7Geld verdien je met opdrachten §fén §7door Herobrine's mobs te verslaan!"}]}
