# ==========================================
# VUUR EILAND bouwen rond (500, 70, 0)
# ==========================================

# --- Ruimte maken (35x35 area, y=65 tot 95 -> 30 hoog) ---
fill 483 65 -17 517 80 17 air
fill 483 81 -17 517 95 17 air

# --- Water rondom op zeespiegel (35x35 area, y=63-64) ---
fill 483 63 -17 517 64 17 water

# --- Strand (sand 30x30) ---
fill 485 63 -15 515 65 15 sand
# --- Eiland binnenkant (red sand / red concrete powder voor vuur sfeer) ---
fill 487 66 -13 513 66 13 red_sand
# --- Vloer met patronen van blackstone ---
fill 489 66 -11 511 66 11 red_sand
setblock 500 66 0 blackstone
fill 498 66 -2 502 66 2 blackstone
fill 499 66 -1 501 66 1 magma

# --- Decoratieve basalt zuilen (4 hoog) ---
fill 487 67 -13 487 70 -13 basalt
fill 513 67 -13 513 70 -13 basalt
fill 487 67 13 487 70 13 basalt
fill 513 67 13 513 70 13 basalt
setblock 487 71 -13 fire
setblock 513 71 -13 fire
setblock 487 71 13 fire
setblock 513 71 13 fire

# --- Welkomstpoort (zuid, kant van waar speler arriveert) ---
fill 498 66 -15 498 69 -15 nether_brick_fence
fill 502 66 -15 502 69 -15 nether_brick_fence
fill 499 70 -15 501 70 -15 nether_bricks
setblock 500 69 -15 standing_sign

# --- Spawn pad (waar speler verschijnt) ---
fill 499 66 -1 501 66 1 polished_blackstone
setblock 500 67 0 lantern

# --- Wat vuur-sfeer planten ---
setblock 492 67 -8 dead_bush
setblock 495 67 7 dead_bush
setblock 506 67 -7 dead_bush
setblock 508 67 5 dead_bush

# --- Tickingarea om eiland geladen te houden ---
tickingarea add 480 60 -20 520 90 20 island_fire true

# --- Spawn 5 neutrale villagers (geven respawn_token bij dood) ---
summon superteams:neutral_villager 495 67 -8
summon superteams:neutral_villager 505 67 5
summon superteams:neutral_villager 497 67 10
summon superteams:neutral_villager 508 67 -7
summon superteams:neutral_villager 492 67 3
