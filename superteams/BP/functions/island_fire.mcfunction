# ==========================================
# VUUR EILAND bouwen rond (500, 70, 0)
# ==========================================

# --- Ruimte maken (35x35 area, y=65 tot 95 -> 30 hoog) ---
# --- Kill oude neutrals zodat we niet opstapelen bij rebuild ---
kill @e[type=superteams:neutral_villager,r=30]

fill ~-17 ~-10 ~-17 ~17 ~5 ~17 air
fill ~-17 ~6 ~-17 ~17 ~20 ~17 air

# --- Water rondom op zeespiegel (35x35 area, y=63-64) ---
fill ~-17 ~-12 ~-17 ~17 ~-11 ~17 water

# --- Strand (sand 30x30) ---
fill ~-15 ~-12 ~-15 ~15 ~-10 ~15 sand
# --- Eiland binnenkant (red sand / red concrete powder voor vuur sfeer) ---
fill ~-13 ~-9 ~-13 ~13 ~-9 ~13 red_sand
# --- Vloer met patronen van blackstone ---
fill ~-11 ~-9 ~-11 ~11 ~-9 ~11 red_sand
setblock ~ ~-9 ~ blackstone
fill ~-2 ~-9 ~-2 ~2 ~-9 ~2 blackstone
fill ~-1 ~-9 ~-1 ~1 ~-9 ~1 magma

# --- Decoratieve basalt zuilen (4 hoog) ---
fill ~-13 ~-8 ~-13 ~-13 ~-5 ~-13 basalt
fill ~13 ~-8 ~-13 ~13 ~-5 ~-13 basalt
fill ~-13 ~-8 ~13 ~-13 ~-5 ~13 basalt
fill ~13 ~-8 ~13 ~13 ~-5 ~13 basalt
setblock ~-13 ~-4 ~-13 fire
setblock ~13 ~-4 ~-13 fire
setblock ~-13 ~-4 ~13 fire
setblock ~13 ~-4 ~13 fire

# --- Welkomstpoort (zuid, kant van waar speler arriveert) ---
fill ~-2 ~-9 ~-15 ~-2 ~-6 ~-15 nether_brick_fence
fill ~2 ~-9 ~-15 ~2 ~-6 ~-15 nether_brick_fence
fill ~-1 ~-5 ~-15 ~1 ~-5 ~-15 nether_brick
setblock ~ ~-6 ~-15 standing_sign

# --- Spawn pad (waar speler verschijnt) ---
fill ~-1 ~-9 ~-1 ~1 ~-9 ~1 polished_blackstone
setblock ~ ~-8 ~ lantern

# --- Wat vuur-sfeer (vervangen met fire/lava blokken voor stabiliteit) ---
setblock ~-8 ~-8 ~-8 fire
setblock ~-5 ~-8 ~7 fire
setblock ~6 ~-8 ~-7 fire
setblock ~8 ~-8 ~5 fire

# --- Tickingarea om eiland geladen te houden ---
tickingarea add ~-20 ~-15 ~-20 ~20 ~15 ~20 island_fire true

# --- Spawn 5 neutrale villagers (geven respawn_token bij dood) ---
summon superteams:neutral_villager ~-5 ~-8 ~-8
summon superteams:neutral_villager ~5 ~-8 ~5
summon superteams:neutral_villager ~-3 ~-8 ~10
summon superteams:neutral_villager ~8 ~-8 ~-7
summon superteams:neutral_villager ~-8 ~-8 ~3
