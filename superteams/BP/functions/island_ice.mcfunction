# ==========================================
# IJS EILAND bouwen rond (-500, 70, 0)
# ==========================================

# --- Ruimte maken ---
fill ~-17 ~-10 ~-17 ~17 ~5 ~17 air
fill ~-17 ~6 ~-17 ~17 ~20 ~17 air

# --- Water rondom ---
fill ~-17 ~-12 ~-17 ~17 ~-11 ~17 water

# --- IJs strand ---
fill ~-15 ~-12 ~-15 ~15 ~-10 ~15 packed_ice
# --- Eiland binnenkant (sneeuw blokken) ---
fill ~-13 ~-9 ~-13 ~13 ~-9 ~13 packed_ice
# --- Vloer met patronen ---
setblock ~ ~-9 ~ blue_ice
fill ~-2 ~-9 ~-2 ~2 ~-9 ~2 blue_ice
fill ~-1 ~-9 ~-1 ~1 ~-9 ~1 packed_ice

# --- Decoratieve ijs zuilen ---
fill ~-13 ~-8 ~-13 ~-13 ~-5 ~-13 packed_ice
fill ~13 ~-8 ~-13 ~13 ~-5 ~-13 packed_ice
fill ~-13 ~-8 ~13 ~-13 ~-5 ~13 packed_ice
fill ~13 ~-8 ~13 ~13 ~-5 ~13 packed_ice
setblock ~-13 ~-4 ~-13 sea_lantern
setblock ~13 ~-4 ~-13 sea_lantern
setblock ~-13 ~-4 ~13 sea_lantern
setblock ~13 ~-4 ~13 sea_lantern

# --- Welkomstpoort ---
fill ~-2 ~-9 ~-15 ~-2 ~-6 ~-15 packed_ice
fill ~2 ~-9 ~-15 ~2 ~-6 ~-15 packed_ice
fill ~-1 ~-5 ~-15 ~1 ~-5 ~-15 blue_ice
setblock ~ ~-6 ~-15 standing_sign

# --- Spawn pad ---
fill ~-1 ~-9 ~-1 ~1 ~-9 ~1 blue_ice
setblock ~ ~-8 ~ sea_lantern

# --- Sparren bomen sfeer ---
setblock ~8 ~-8 ~-8 spruce_sapling
setblock ~5 ~-8 ~7 spruce_sapling
setblock ~-6 ~-8 ~-7 spruce_sapling
setblock ~-8 ~-8 ~5 spruce_sapling

tickingarea add ~-20 ~-15 ~-20 ~20 ~15 ~20 island_ice true

# --- Spawn 5 neutrale villagers (geven respawn_token bij dood) ---
summon superteams:neutral_villager ~5 ~-8 ~-8
summon superteams:neutral_villager ~-5 ~-8 ~5
summon superteams:neutral_villager ~3 ~-8 ~10
summon superteams:neutral_villager ~-8 ~-8 ~-7
summon superteams:neutral_villager ~8 ~-8 ~3
