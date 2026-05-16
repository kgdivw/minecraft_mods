# ==========================================
# BLIKSEM EILAND bouwen rond (0, 70, 500)
# ==========================================

# --- Ruimte maken ---
fill -17 65 483 17 80 517 air
fill -17 81 483 17 95 517 air

# --- Water rondom ---
fill -17 63 483 17 64 517 water

# --- Geel zand strand ---
fill -15 63 485 15 65 515 sand
# --- Eiland binnenkant (sandstone met gold accents) ---
fill -13 66 487 13 66 513 smooth_sandstone
# --- Vloer met goud accents ---
setblock 0 66 500 raw_gold_block
fill -2 66 498 2 66 502 raw_gold_block
fill -1 66 499 1 66 501 gold_block

# --- Decoratieve sandstone zuilen ---
fill -13 67 487 -13 70 487 chiseled_sandstone
fill 13 67 487 13 70 487 chiseled_sandstone
fill -13 67 513 -13 70 513 chiseled_sandstone
fill 13 67 513 13 70 513 chiseled_sandstone
setblock -13 71 487 sea_lantern
setblock 13 71 487 sea_lantern
setblock -13 71 513 sea_lantern
setblock 13 71 513 sea_lantern

# --- Welkomstpoort ---
fill -2 66 485 -2 69 485 chiseled_sandstone
fill 2 66 485 2 69 485 chiseled_sandstone
fill -1 70 485 1 70 485 smooth_sandstone
setblock 0 69 485 standing_sign

# --- Spawn pad ---
fill -1 66 499 1 66 501 gold_block
setblock 0 67 500 sea_lantern

# --- Wat acacia bomen sfeer ---
setblock -8 67 492 acacia_sapling
setblock 7 67 495 acacia_sapling
setblock -7 67 506 acacia_sapling
setblock 5 67 508 acacia_sapling

tickingarea add -20 60 480 20 90 520 island_lightning true

# --- Spawn 5 neutrale villagers (geven respawn_token bij dood) ---
summon superteams:neutral_villager -8 67 495
summon superteams:neutral_villager 5 67 505
summon superteams:neutral_villager 10 67 497
summon superteams:neutral_villager -7 67 508
summon superteams:neutral_villager 3 67 492
