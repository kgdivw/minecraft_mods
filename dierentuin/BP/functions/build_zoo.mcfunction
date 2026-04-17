# ==========================================
# DIERENTUIN BOUWER
# Bouwt een complete dierentuin op je huidige positie
# Gebruik: /function build_zoo
# ==========================================

# --- Grondvlak opruimen (31x31, relatief aan speler) ---
fill ~-15 ~ ~-15 ~15 ~5 ~15 air

# --- Grondvlak leggen ---
fill ~-15 ~-1 ~-15 ~15 ~-1 ~15 grass_block

# --- Paden (gravel hoofdpaden) ---
# Hoofdpad noord-zuid (midden)
fill ~-1 ~ ~-15 ~1 ~ ~15 gravel
# Hoofdpad oost-west (midden)
fill ~-15 ~ ~-1 ~15 ~ ~1 gravel
# Ingang pad
fill ~-1 ~ ~-15 ~1 ~ ~-13 gravel

# --- Buitenmuur (houten hekken) ---
# Noord muur
fill ~-15 ~ ~-15 ~15 ~1 ~-15 oak_fence
# Zuid muur
fill ~-15 ~ ~15 ~15 ~1 ~15 oak_fence
# West muur
fill ~-15 ~ ~-15 ~-15 ~1 ~15 oak_fence
# Oost muur
fill ~15 ~ ~-15 ~15 ~1 ~15 oak_fence

# --- Ingangspoort (zuidkant, midden) ---
setblock ~-1 ~ ~-15 air
setblock ~0 ~ ~-15 air
setblock ~1 ~ ~-15 air
setblock ~-1 ~1 ~-15 air
setblock ~0 ~1 ~-15 air
setblock ~1 ~1 ~-15 air
# Poort pilaren
setblock ~-2 ~ ~-15 stone_bricks
setblock ~-2 ~1 ~-15 stone_bricks
setblock ~-2 ~2 ~-15 stone_bricks
setblock ~2 ~ ~-15 stone_bricks
setblock ~2 ~1 ~-15 stone_bricks
setblock ~2 ~2 ~-15 stone_bricks
# Poort boog
fill ~-2 ~3 ~-15 ~2 ~3 ~-15 stone_bricks
# Bord boven poort
setblock ~0 ~3 ~-16 wall_sign

# --- Hok 1: Leeuw (noordwest) ---
fill ~-14 ~ ~2 ~-3 ~1 ~2 oak_fence
fill ~-14 ~ ~14 ~-3 ~1 ~14 oak_fence
fill ~-14 ~ ~2 ~-14 ~1 ~14 oak_fence
fill ~-3 ~ ~2 ~-3 ~1 ~14 oak_fence
# Hok ingang
setblock ~-3 ~ ~8 air
setblock ~-3 ~1 ~8 air
# Zand vloer
fill ~-13 ~-1 ~3 ~-4 ~-1 ~13 sand
# Naambordje
setblock ~-3 ~ ~7 wall_sign

# --- Hok 2: Panda (noordoost) ---
fill ~3 ~ ~2 ~14 ~1 ~2 oak_fence
fill ~3 ~ ~14 ~14 ~1 ~14 oak_fence
fill ~3 ~ ~2 ~3 ~1 ~14 oak_fence
fill ~14 ~ ~2 ~14 ~1 ~14 oak_fence
# Hok ingang
setblock ~3 ~ ~8 air
setblock ~3 ~1 ~8 air
# Gras + bamboo vloer
fill ~4 ~-1 ~3 ~13 ~-1 ~13 podzol
# Naambordje
setblock ~3 ~ ~7 wall_sign

# --- Hok 3: Papegaai (zuidwest) ---
fill ~-14 ~ ~-14 ~-3 ~1 ~-14 oak_fence
fill ~-14 ~ ~-3 ~-3 ~1 ~-3 oak_fence
fill ~-14 ~ ~-14 ~-14 ~1 ~-3 oak_fence
fill ~-3 ~ ~-14 ~-3 ~1 ~-3 oak_fence
# Hok ingang
setblock ~-3 ~ ~-8 air
setblock ~-3 ~1 ~-8 air
# Jungle vloer
fill ~-13 ~-1 ~-13 ~-4 ~-1 ~-4 moss_block
# Bomen
setblock ~-10 ~ ~-10 jungle_log
setblock ~-10 ~1 ~-10 jungle_log
setblock ~-10 ~2 ~-10 jungle_leaves
setblock ~-7 ~ ~-7 jungle_log
setblock ~-7 ~1 ~-7 jungle_leaves
# Naambordje
setblock ~-3 ~ ~-7 wall_sign

# --- Hok 4: Olifant (zuidoost) ---
fill ~3 ~ ~-14 ~14 ~1 ~-14 oak_fence
fill ~3 ~ ~-3 ~14 ~1 ~-3 oak_fence
fill ~3 ~ ~-14 ~3 ~1 ~-3 oak_fence
fill ~14 ~ ~-14 ~14 ~1 ~-3 oak_fence
# Hok ingang
setblock ~3 ~ ~-8 air
setblock ~3 ~1 ~-8 air
# Savanne vloer
fill ~4 ~-1 ~-13 ~13 ~-1 ~-4 coarse_dirt
# Waterplaats
fill ~8 ~-1 ~-10 ~11 ~-1 ~-8 water
# Naambordje
setblock ~3 ~ ~-7 wall_sign

# --- Karretje parkeerplaats bij ingang ---
fill ~-4 ~-1 ~-18 ~4 ~-1 ~-16 stone_bricks
fill ~-4 ~ ~-18 ~-4 ~1 ~-16 stone_brick_wall
fill ~4 ~ ~-18 ~4 ~1 ~-16 stone_brick_wall

# --- Decoratie: lantaarns langs paden ---
setblock ~-1 ~2 ~7 lantern
setblock ~1 ~2 ~7 lantern
setblock ~-1 ~2 ~-7 lantern
setblock ~1 ~2 ~-7 lantern
setblock ~7 ~2 ~-1 lantern
setblock ~7 ~2 ~1 lantern
setblock ~-7 ~2 ~-1 lantern
setblock ~-7 ~2 ~1 lantern

# --- Bevestiging ---
say Dierentuin is gebouwd! Vang wilde dieren met kooien en breng ze hierheen!
