# ==========================================
# BLIKSEM EILAND bouwen rond (0, 70, 500)
# ==========================================

# --- Ruimte maken ---
# --- Kill oude neutrals zodat we niet opstapelen bij rebuild ---
kill @e[type=superteams:neutral_villager,r=30]

fill ~-17 ~-10 ~-17 ~17 ~5 ~17 air
fill ~-17 ~6 ~-17 ~17 ~20 ~17 air

# --- Water rondom ---
fill ~-17 ~-12 ~-17 ~17 ~-11 ~17 water

# --- Geel zand strand ---
fill ~-15 ~-12 ~-15 ~15 ~-10 ~15 sand
# --- Eiland binnenkant (sandstone met gold accents) ---
fill ~-13 ~-9 ~-13 ~13 ~-9 ~13 smooth_sandstone
# --- Vloer met goud accents ---
setblock ~ ~-9 ~ raw_gold_block
fill ~-2 ~-9 ~-2 ~2 ~-9 ~2 raw_gold_block
fill ~-1 ~-9 ~-1 ~1 ~-9 ~1 gold_block

# --- Decoratieve sandstone zuilen ---
fill ~-13 ~-8 ~-13 ~-13 ~-5 ~-13 chiseled_sandstone
fill ~13 ~-8 ~-13 ~13 ~-5 ~-13 chiseled_sandstone
fill ~-13 ~-8 ~13 ~-13 ~-5 ~13 chiseled_sandstone
fill ~13 ~-8 ~13 ~13 ~-5 ~13 chiseled_sandstone
setblock ~-13 ~-4 ~-13 sea_lantern
setblock ~13 ~-4 ~-13 sea_lantern
setblock ~-13 ~-4 ~13 sea_lantern
setblock ~13 ~-4 ~13 sea_lantern

# --- Welkomstpoort ---
fill ~-2 ~-9 ~-15 ~-2 ~-6 ~-15 chiseled_sandstone
fill ~2 ~-9 ~-15 ~2 ~-6 ~-15 chiseled_sandstone
fill ~-1 ~-5 ~-15 ~1 ~-5 ~-15 smooth_sandstone
setblock ~ ~-6 ~-15 standing_sign

# --- Spawn pad ---
fill ~-1 ~-9 ~-1 ~1 ~-9 ~1 gold_block
setblock ~ ~-8 ~ sea_lantern

# --- Wat acacia bomen sfeer ---
setblock ~-8 ~-8 ~-8 acacia_sapling
setblock ~7 ~-8 ~-5 acacia_sapling
setblock ~-7 ~-8 ~6 acacia_sapling
setblock ~5 ~-8 ~8 acacia_sapling

tickingarea add ~-20 ~-15 ~-20 ~20 ~15 ~20 island_lightning true

# --- Spawn 5 neutrale villagers (geven respawn_token bij dood) ---
summon superteams:neutral_villager ~-8 ~-8 ~-5
summon superteams:neutral_villager ~5 ~-8 ~5
summon superteams:neutral_villager ~10 ~-8 ~-3
summon superteams:neutral_villager ~-7 ~-8 ~8
summon superteams:neutral_villager ~3 ~-8 ~-8
