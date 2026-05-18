# ==========================================
# AARDE EILAND bouwen rond (0, 70, -500)
# ==========================================

# --- Ruimte maken ---
# --- Kill oude neutrals zodat we niet opstapelen bij rebuild ---
kill @e[type=superteams:neutral_villager,r=30]

fill ~-17 ~-10 ~-17 ~17 ~5 ~17 air
fill ~-17 ~6 ~-17 ~17 ~20 ~17 air

# --- Water rondom ---
fill ~-17 ~-12 ~-17 ~17 ~-11 ~17 water

# --- Strand ---
fill ~-15 ~-12 ~-15 ~15 ~-10 ~15 sand
# --- Eiland binnenkant (gras + dirt) ---
fill ~-13 ~-10 ~-13 ~13 ~-10 ~13 dirt
fill ~-13 ~-9 ~-13 ~13 ~-9 ~13 grass_block
# --- Vloer met patronen ---
setblock ~ ~-9 ~ mossy_cobblestone
fill ~-2 ~-9 ~-2 ~2 ~-9 ~2 mossy_cobblestone
fill ~-1 ~-9 ~-1 ~1 ~-9 ~1 moss_block

# --- Decoratieve stenen zuilen ---
fill ~-13 ~-8 ~13 ~-13 ~-5 ~13 mossy_cobblestone
fill ~13 ~-8 ~13 ~13 ~-5 ~13 mossy_cobblestone
fill ~-13 ~-8 ~-13 ~-13 ~-5 ~-13 mossy_cobblestone
fill ~13 ~-8 ~-13 ~13 ~-5 ~-13 mossy_cobblestone
setblock ~-13 ~-4 ~13 lantern
setblock ~13 ~-4 ~13 lantern
setblock ~-13 ~-4 ~-13 lantern
setblock ~13 ~-4 ~-13 lantern

# --- Welkomstpoort ---
fill ~-2 ~-9 ~15 ~-2 ~-6 ~15 mossy_cobblestone
fill ~2 ~-9 ~15 ~2 ~-6 ~15 mossy_cobblestone
fill ~-1 ~-5 ~15 ~1 ~-5 ~15 mossy_cobblestone
setblock ~ ~-6 ~15 standing_sign

# --- Spawn pad ---
fill ~-1 ~-9 ~-1 ~1 ~-9 ~1 moss_block
setblock ~ ~-8 ~ lantern

# --- Eik bomen sfeer ---
setblock ~-8 ~-8 ~8 oak_sapling
setblock ~7 ~-8 ~5 oak_sapling
setblock ~-7 ~-8 ~-6 oak_sapling
setblock ~5 ~-8 ~-8 oak_sapling

tickingarea add ~-20 ~-15 ~-20 ~20 ~15 ~20 island_earth true

# --- Spawn 5 neutrale villagers (geven respawn_token bij dood) ---
summon superteams:neutral_villager ~-8 ~-8 ~5
summon superteams:neutral_villager ~5 ~-8 ~-5
summon superteams:neutral_villager ~10 ~-8 ~3
summon superteams:neutral_villager ~-7 ~-8 ~-8
summon superteams:neutral_villager ~3 ~-8 ~8
