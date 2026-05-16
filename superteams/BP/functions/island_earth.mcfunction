# ==========================================
# AARDE EILAND bouwen rond (0, 70, -500)
# ==========================================

# --- Ruimte maken ---
fill -17 65 -517 17 80 -483 air
fill -17 81 -517 17 95 -483 air

# --- Water rondom ---
fill -17 63 -517 17 64 -483 water

# --- Strand ---
fill -15 63 -515 15 65 -485 sand
# --- Eiland binnenkant (gras + dirt) ---
fill -13 65 -513 13 65 -487 dirt
fill -13 66 -513 13 66 -487 grass_block
# --- Vloer met patronen ---
setblock 0 66 -500 mossy_cobblestone
fill -2 66 -502 2 66 -498 mossy_cobblestone
fill -1 66 -501 1 66 -499 moss_block

# --- Decoratieve stenen zuilen ---
fill -13 67 -487 -13 70 -487 mossy_cobblestone
fill 13 67 -487 13 70 -487 mossy_cobblestone
fill -13 67 -513 -13 70 -513 mossy_cobblestone
fill 13 67 -513 13 70 -513 mossy_cobblestone
setblock -13 71 -487 lantern
setblock 13 71 -487 lantern
setblock -13 71 -513 lantern
setblock 13 71 -513 lantern

# --- Welkomstpoort ---
fill -2 66 -485 -2 69 -485 mossy_cobblestone
fill 2 66 -485 2 69 -485 mossy_cobblestone
fill -1 70 -485 1 70 -485 mossy_cobblestone
setblock 0 69 -485 standing_sign

# --- Spawn pad ---
fill -1 66 -501 1 66 -499 moss_block
setblock 0 67 -500 lantern

# --- Eik bomen sfeer ---
setblock -8 67 -492 oak_sapling
setblock 7 67 -495 oak_sapling
setblock -7 67 -506 oak_sapling
setblock 5 67 -508 oak_sapling

tickingarea add -20 60 -520 20 90 -480 island_earth true

# --- Spawn 5 neutrale villagers (geven respawn_token bij dood) ---
summon superteams:neutral_villager -8 67 -495
summon superteams:neutral_villager 5 67 -505
summon superteams:neutral_villager 10 67 -497
summon superteams:neutral_villager -7 67 -508
summon superteams:neutral_villager 3 67 -492
