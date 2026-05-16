# ==========================================
# IJS EILAND bouwen rond (-500, 70, 0)
# ==========================================

# --- Ruimte maken ---
fill -517 65 -17 -483 80 17 air
fill -517 81 -17 -483 95 17 air

# --- Water rondom ---
fill -517 63 -17 -483 64 17 water

# --- IJs strand ---
fill -515 63 -15 -485 65 15 packed_ice
# --- Eiland binnenkant (sneeuw blokken) ---
fill -513 66 -13 -487 66 13 snow_block
# --- Vloer met patronen ---
setblock -500 66 0 blue_ice
fill -502 66 -2 -498 66 2 blue_ice
fill -501 66 -1 -499 66 1 packed_ice

# --- Decoratieve ijs zuilen ---
fill -513 67 -13 -513 70 -13 packed_ice
fill -487 67 -13 -487 70 -13 packed_ice
fill -513 67 13 -513 70 13 packed_ice
fill -487 67 13 -487 70 13 packed_ice
setblock -513 71 -13 sea_lantern
setblock -487 71 -13 sea_lantern
setblock -513 71 13 sea_lantern
setblock -487 71 13 sea_lantern

# --- Welkomstpoort ---
fill -502 66 -15 -502 69 -15 packed_ice
fill -498 66 -15 -498 69 -15 packed_ice
fill -501 70 -15 -499 70 -15 blue_ice
setblock -500 69 -15 standing_sign

# --- Spawn pad ---
fill -501 66 -1 -499 66 1 blue_ice
setblock -500 67 0 sea_lantern

# --- Sparren bomen sfeer ---
setblock -492 67 -8 spruce_sapling
setblock -495 67 7 spruce_sapling
setblock -506 67 -7 spruce_sapling
setblock -508 67 5 spruce_sapling

tickingarea add -520 60 -20 -480 90 20 island_ice true

# --- Spawn 5 neutrale villagers (geven respawn_token bij dood) ---
summon superteams:neutral_villager -495 67 -8
summon superteams:neutral_villager -505 67 5
summon superteams:neutral_villager -497 67 10
summon superteams:neutral_villager -508 67 -7
summon superteams:neutral_villager -492 67 3
