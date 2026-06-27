# ==========================================================
# BOUW HET KASTEEL (rood) op 2000,80,1700
# ==========================================================
gamerule commandblockoutput false
gamerule dofiretick false
gamerule mobgriefing false
scoreboard objectives add rm_state dummy
tickingarea remove rood_kasteel
tickingarea add ~-104 ~-12 ~-104 ~104 ~118 ~104 rood_kasteel true
# Binnenplaats leegmaken (tot muurhoogte) en de grond vlak leggen
fill ~-100 ~0 ~-100 ~-71 ~7 ~-71 air
fill ~-100 ~0 ~-70 ~-71 ~7 ~-41 air
fill ~-100 ~0 ~-40 ~-71 ~7 ~-11 air
fill ~-100 ~0 ~-10 ~-71 ~7 ~19 air
fill ~-100 ~0 ~20 ~-71 ~7 ~49 air
fill ~-100 ~0 ~50 ~-71 ~7 ~79 air
fill ~-100 ~0 ~80 ~-71 ~7 ~100 air
fill ~-70 ~0 ~-100 ~-41 ~7 ~-71 air
fill ~-70 ~0 ~-70 ~-41 ~7 ~-41 air
fill ~-70 ~0 ~-40 ~-41 ~7 ~-11 air
fill ~-70 ~0 ~-10 ~-41 ~7 ~19 air
fill ~-70 ~0 ~20 ~-41 ~7 ~49 air
fill ~-70 ~0 ~50 ~-41 ~7 ~79 air
fill ~-70 ~0 ~80 ~-41 ~7 ~100 air
fill ~-40 ~0 ~-100 ~-11 ~7 ~-71 air
fill ~-40 ~0 ~-70 ~-11 ~7 ~-41 air
fill ~-40 ~0 ~-40 ~-11 ~7 ~-11 air
fill ~-40 ~0 ~-10 ~-11 ~7 ~19 air
fill ~-40 ~0 ~20 ~-11 ~7 ~49 air
fill ~-40 ~0 ~50 ~-11 ~7 ~79 air
fill ~-40 ~0 ~80 ~-11 ~7 ~100 air
fill ~-10 ~0 ~-100 ~19 ~7 ~-71 air
fill ~-10 ~0 ~-70 ~19 ~7 ~-41 air
fill ~-10 ~0 ~-40 ~19 ~7 ~-11 air
fill ~-10 ~0 ~-10 ~19 ~7 ~19 air
fill ~-10 ~0 ~20 ~19 ~7 ~49 air
fill ~-10 ~0 ~50 ~19 ~7 ~79 air
fill ~-10 ~0 ~80 ~19 ~7 ~100 air
fill ~20 ~0 ~-100 ~49 ~7 ~-71 air
fill ~20 ~0 ~-70 ~49 ~7 ~-41 air
fill ~20 ~0 ~-40 ~49 ~7 ~-11 air
fill ~20 ~0 ~-10 ~49 ~7 ~19 air
fill ~20 ~0 ~20 ~49 ~7 ~49 air
fill ~20 ~0 ~50 ~49 ~7 ~79 air
fill ~20 ~0 ~80 ~49 ~7 ~100 air
fill ~50 ~0 ~-100 ~79 ~7 ~-71 air
fill ~50 ~0 ~-70 ~79 ~7 ~-41 air
fill ~50 ~0 ~-40 ~79 ~7 ~-11 air
fill ~50 ~0 ~-10 ~79 ~7 ~19 air
fill ~50 ~0 ~20 ~79 ~7 ~49 air
fill ~50 ~0 ~50 ~79 ~7 ~79 air
fill ~50 ~0 ~80 ~79 ~7 ~100 air
fill ~80 ~0 ~-100 ~100 ~7 ~-71 air
fill ~80 ~0 ~-70 ~100 ~7 ~-41 air
fill ~80 ~0 ~-40 ~100 ~7 ~-11 air
fill ~80 ~0 ~-10 ~100 ~7 ~19 air
fill ~80 ~0 ~20 ~100 ~7 ~49 air
fill ~80 ~0 ~50 ~100 ~7 ~79 air
fill ~80 ~0 ~80 ~100 ~7 ~100 air
fill ~-100 ~-1 ~-100 ~-71 ~-1 ~-71 grass_block
fill ~-100 ~-1 ~-70 ~-71 ~-1 ~-41 grass_block
fill ~-100 ~-1 ~-40 ~-71 ~-1 ~-11 grass_block
fill ~-100 ~-1 ~-10 ~-71 ~-1 ~19 grass_block
fill ~-100 ~-1 ~20 ~-71 ~-1 ~49 grass_block
fill ~-100 ~-1 ~50 ~-71 ~-1 ~79 grass_block
fill ~-100 ~-1 ~80 ~-71 ~-1 ~100 grass_block
fill ~-70 ~-1 ~-100 ~-41 ~-1 ~-71 grass_block
fill ~-70 ~-1 ~-70 ~-41 ~-1 ~-41 grass_block
fill ~-70 ~-1 ~-40 ~-41 ~-1 ~-11 grass_block
fill ~-70 ~-1 ~-10 ~-41 ~-1 ~19 grass_block
fill ~-70 ~-1 ~20 ~-41 ~-1 ~49 grass_block
fill ~-70 ~-1 ~50 ~-41 ~-1 ~79 grass_block
fill ~-70 ~-1 ~80 ~-41 ~-1 ~100 grass_block
fill ~-40 ~-1 ~-100 ~-11 ~-1 ~-71 grass_block
fill ~-40 ~-1 ~-70 ~-11 ~-1 ~-41 grass_block
fill ~-40 ~-1 ~-40 ~-11 ~-1 ~-11 grass_block
fill ~-40 ~-1 ~-10 ~-11 ~-1 ~19 grass_block
fill ~-40 ~-1 ~20 ~-11 ~-1 ~49 grass_block
fill ~-40 ~-1 ~50 ~-11 ~-1 ~79 grass_block
fill ~-40 ~-1 ~80 ~-11 ~-1 ~100 grass_block
fill ~-10 ~-1 ~-100 ~19 ~-1 ~-71 grass_block
fill ~-10 ~-1 ~-70 ~19 ~-1 ~-41 grass_block
fill ~-10 ~-1 ~-40 ~19 ~-1 ~-11 grass_block
fill ~-10 ~-1 ~-10 ~19 ~-1 ~19 grass_block
fill ~-10 ~-1 ~20 ~19 ~-1 ~49 grass_block
fill ~-10 ~-1 ~50 ~19 ~-1 ~79 grass_block
fill ~-10 ~-1 ~80 ~19 ~-1 ~100 grass_block
fill ~20 ~-1 ~-100 ~49 ~-1 ~-71 grass_block
fill ~20 ~-1 ~-70 ~49 ~-1 ~-41 grass_block
fill ~20 ~-1 ~-40 ~49 ~-1 ~-11 grass_block
fill ~20 ~-1 ~-10 ~49 ~-1 ~19 grass_block
fill ~20 ~-1 ~20 ~49 ~-1 ~49 grass_block
fill ~20 ~-1 ~50 ~49 ~-1 ~79 grass_block
fill ~20 ~-1 ~80 ~49 ~-1 ~100 grass_block
fill ~50 ~-1 ~-100 ~79 ~-1 ~-71 grass_block
fill ~50 ~-1 ~-70 ~79 ~-1 ~-41 grass_block
fill ~50 ~-1 ~-40 ~79 ~-1 ~-11 grass_block
fill ~50 ~-1 ~-10 ~79 ~-1 ~19 grass_block
fill ~50 ~-1 ~20 ~79 ~-1 ~49 grass_block
fill ~50 ~-1 ~50 ~79 ~-1 ~79 grass_block
fill ~50 ~-1 ~80 ~79 ~-1 ~100 grass_block
fill ~80 ~-1 ~-100 ~100 ~-1 ~-71 grass_block
fill ~80 ~-1 ~-70 ~100 ~-1 ~-41 grass_block
fill ~80 ~-1 ~-40 ~100 ~-1 ~-11 grass_block
fill ~80 ~-1 ~-10 ~100 ~-1 ~19 grass_block
fill ~80 ~-1 ~20 ~100 ~-1 ~49 grass_block
fill ~80 ~-1 ~50 ~100 ~-1 ~79 grass_block
fill ~80 ~-1 ~80 ~100 ~-1 ~100 grass_block
fill ~-34 ~-1 ~-34 ~-5 ~-1 ~-5 red_nether_brick
fill ~-34 ~-1 ~-4 ~-5 ~-1 ~25 red_nether_brick
fill ~-34 ~-1 ~26 ~-5 ~-1 ~34 red_nether_brick
fill ~-4 ~-1 ~-34 ~25 ~-1 ~-5 red_nether_brick
fill ~-4 ~-1 ~-4 ~25 ~-1 ~25 red_nether_brick
fill ~-4 ~-1 ~26 ~25 ~-1 ~34 red_nether_brick
fill ~26 ~-1 ~-34 ~34 ~-1 ~-5 red_nether_brick
fill ~26 ~-1 ~-4 ~34 ~-1 ~25 red_nether_brick
fill ~26 ~-1 ~26 ~34 ~-1 ~34 red_nether_brick
# === BUITENMUUR ROND DE BINNENPLAATS (ong. 200 breed) ===
fill ~-100 ~0 ~-100 ~100 ~6 ~-100 red_concrete
fill ~-100 ~0 ~100 ~100 ~6 ~100 red_concrete
fill ~-100 ~0 ~-100 ~-100 ~6 ~100 red_concrete
fill ~100 ~0 ~-100 ~100 ~6 ~100 red_concrete
setblock ~-100 ~7 ~-100 stone_brick_wall
setblock ~-100 ~7 ~100 stone_brick_wall
setblock ~-96 ~7 ~-100 stone_brick_wall
setblock ~-96 ~7 ~100 stone_brick_wall
setblock ~-92 ~7 ~-100 stone_brick_wall
setblock ~-92 ~7 ~100 stone_brick_wall
setblock ~-88 ~7 ~-100 stone_brick_wall
setblock ~-88 ~7 ~100 stone_brick_wall
setblock ~-84 ~7 ~-100 stone_brick_wall
setblock ~-84 ~7 ~100 stone_brick_wall
setblock ~-80 ~7 ~-100 stone_brick_wall
setblock ~-80 ~7 ~100 stone_brick_wall
setblock ~-76 ~7 ~-100 stone_brick_wall
setblock ~-76 ~7 ~100 stone_brick_wall
setblock ~-72 ~7 ~-100 stone_brick_wall
setblock ~-72 ~7 ~100 stone_brick_wall
setblock ~-68 ~7 ~-100 stone_brick_wall
setblock ~-68 ~7 ~100 stone_brick_wall
setblock ~-64 ~7 ~-100 stone_brick_wall
setblock ~-64 ~7 ~100 stone_brick_wall
setblock ~-60 ~7 ~-100 stone_brick_wall
setblock ~-60 ~7 ~100 stone_brick_wall
setblock ~-56 ~7 ~-100 stone_brick_wall
setblock ~-56 ~7 ~100 stone_brick_wall
setblock ~-52 ~7 ~-100 stone_brick_wall
setblock ~-52 ~7 ~100 stone_brick_wall
setblock ~-48 ~7 ~-100 stone_brick_wall
setblock ~-48 ~7 ~100 stone_brick_wall
setblock ~-44 ~7 ~-100 stone_brick_wall
setblock ~-44 ~7 ~100 stone_brick_wall
setblock ~-40 ~7 ~-100 stone_brick_wall
setblock ~-40 ~7 ~100 stone_brick_wall
setblock ~-36 ~7 ~-100 stone_brick_wall
setblock ~-36 ~7 ~100 stone_brick_wall
setblock ~-32 ~7 ~-100 stone_brick_wall
setblock ~-32 ~7 ~100 stone_brick_wall
setblock ~-28 ~7 ~-100 stone_brick_wall
setblock ~-28 ~7 ~100 stone_brick_wall
setblock ~-24 ~7 ~-100 stone_brick_wall
setblock ~-24 ~7 ~100 stone_brick_wall
setblock ~-20 ~7 ~-100 stone_brick_wall
setblock ~-20 ~7 ~100 stone_brick_wall
setblock ~-16 ~7 ~-100 stone_brick_wall
setblock ~-16 ~7 ~100 stone_brick_wall
setblock ~-12 ~7 ~-100 stone_brick_wall
setblock ~-12 ~7 ~100 stone_brick_wall
setblock ~-8 ~7 ~-100 stone_brick_wall
setblock ~-8 ~7 ~100 stone_brick_wall
setblock ~-4 ~7 ~-100 stone_brick_wall
setblock ~-4 ~7 ~100 stone_brick_wall
setblock ~0 ~7 ~-100 stone_brick_wall
setblock ~0 ~7 ~100 stone_brick_wall
setblock ~4 ~7 ~-100 stone_brick_wall
setblock ~4 ~7 ~100 stone_brick_wall
setblock ~8 ~7 ~-100 stone_brick_wall
setblock ~8 ~7 ~100 stone_brick_wall
setblock ~12 ~7 ~-100 stone_brick_wall
setblock ~12 ~7 ~100 stone_brick_wall
setblock ~16 ~7 ~-100 stone_brick_wall
setblock ~16 ~7 ~100 stone_brick_wall
setblock ~20 ~7 ~-100 stone_brick_wall
setblock ~20 ~7 ~100 stone_brick_wall
setblock ~24 ~7 ~-100 stone_brick_wall
setblock ~24 ~7 ~100 stone_brick_wall
setblock ~28 ~7 ~-100 stone_brick_wall
setblock ~28 ~7 ~100 stone_brick_wall
setblock ~32 ~7 ~-100 stone_brick_wall
setblock ~32 ~7 ~100 stone_brick_wall
setblock ~36 ~7 ~-100 stone_brick_wall
setblock ~36 ~7 ~100 stone_brick_wall
setblock ~40 ~7 ~-100 stone_brick_wall
setblock ~40 ~7 ~100 stone_brick_wall
setblock ~44 ~7 ~-100 stone_brick_wall
setblock ~44 ~7 ~100 stone_brick_wall
setblock ~48 ~7 ~-100 stone_brick_wall
setblock ~48 ~7 ~100 stone_brick_wall
setblock ~52 ~7 ~-100 stone_brick_wall
setblock ~52 ~7 ~100 stone_brick_wall
setblock ~56 ~7 ~-100 stone_brick_wall
setblock ~56 ~7 ~100 stone_brick_wall
setblock ~60 ~7 ~-100 stone_brick_wall
setblock ~60 ~7 ~100 stone_brick_wall
setblock ~64 ~7 ~-100 stone_brick_wall
setblock ~64 ~7 ~100 stone_brick_wall
setblock ~68 ~7 ~-100 stone_brick_wall
setblock ~68 ~7 ~100 stone_brick_wall
setblock ~72 ~7 ~-100 stone_brick_wall
setblock ~72 ~7 ~100 stone_brick_wall
setblock ~76 ~7 ~-100 stone_brick_wall
setblock ~76 ~7 ~100 stone_brick_wall
setblock ~80 ~7 ~-100 stone_brick_wall
setblock ~80 ~7 ~100 stone_brick_wall
setblock ~84 ~7 ~-100 stone_brick_wall
setblock ~84 ~7 ~100 stone_brick_wall
setblock ~88 ~7 ~-100 stone_brick_wall
setblock ~88 ~7 ~100 stone_brick_wall
setblock ~92 ~7 ~-100 stone_brick_wall
setblock ~92 ~7 ~100 stone_brick_wall
setblock ~96 ~7 ~-100 stone_brick_wall
setblock ~96 ~7 ~100 stone_brick_wall
setblock ~100 ~7 ~-100 stone_brick_wall
setblock ~100 ~7 ~100 stone_brick_wall
setblock ~-100 ~7 ~-100 stone_brick_wall
setblock ~100 ~7 ~-100 stone_brick_wall
setblock ~-100 ~7 ~-96 stone_brick_wall
setblock ~100 ~7 ~-96 stone_brick_wall
setblock ~-100 ~7 ~-92 stone_brick_wall
setblock ~100 ~7 ~-92 stone_brick_wall
setblock ~-100 ~7 ~-88 stone_brick_wall
setblock ~100 ~7 ~-88 stone_brick_wall
setblock ~-100 ~7 ~-84 stone_brick_wall
setblock ~100 ~7 ~-84 stone_brick_wall
setblock ~-100 ~7 ~-80 stone_brick_wall
setblock ~100 ~7 ~-80 stone_brick_wall
setblock ~-100 ~7 ~-76 stone_brick_wall
setblock ~100 ~7 ~-76 stone_brick_wall
setblock ~-100 ~7 ~-72 stone_brick_wall
setblock ~100 ~7 ~-72 stone_brick_wall
setblock ~-100 ~7 ~-68 stone_brick_wall
setblock ~100 ~7 ~-68 stone_brick_wall
setblock ~-100 ~7 ~-64 stone_brick_wall
setblock ~100 ~7 ~-64 stone_brick_wall
setblock ~-100 ~7 ~-60 stone_brick_wall
setblock ~100 ~7 ~-60 stone_brick_wall
setblock ~-100 ~7 ~-56 stone_brick_wall
setblock ~100 ~7 ~-56 stone_brick_wall
setblock ~-100 ~7 ~-52 stone_brick_wall
setblock ~100 ~7 ~-52 stone_brick_wall
setblock ~-100 ~7 ~-48 stone_brick_wall
setblock ~100 ~7 ~-48 stone_brick_wall
setblock ~-100 ~7 ~-44 stone_brick_wall
setblock ~100 ~7 ~-44 stone_brick_wall
setblock ~-100 ~7 ~-40 stone_brick_wall
setblock ~100 ~7 ~-40 stone_brick_wall
setblock ~-100 ~7 ~-36 stone_brick_wall
setblock ~100 ~7 ~-36 stone_brick_wall
setblock ~-100 ~7 ~-32 stone_brick_wall
setblock ~100 ~7 ~-32 stone_brick_wall
setblock ~-100 ~7 ~-28 stone_brick_wall
setblock ~100 ~7 ~-28 stone_brick_wall
setblock ~-100 ~7 ~-24 stone_brick_wall
setblock ~100 ~7 ~-24 stone_brick_wall
setblock ~-100 ~7 ~-20 stone_brick_wall
setblock ~100 ~7 ~-20 stone_brick_wall
setblock ~-100 ~7 ~-16 stone_brick_wall
setblock ~100 ~7 ~-16 stone_brick_wall
setblock ~-100 ~7 ~-12 stone_brick_wall
setblock ~100 ~7 ~-12 stone_brick_wall
setblock ~-100 ~7 ~-8 stone_brick_wall
setblock ~100 ~7 ~-8 stone_brick_wall
setblock ~-100 ~7 ~-4 stone_brick_wall
setblock ~100 ~7 ~-4 stone_brick_wall
setblock ~-100 ~7 ~0 stone_brick_wall
setblock ~100 ~7 ~0 stone_brick_wall
setblock ~-100 ~7 ~4 stone_brick_wall
setblock ~100 ~7 ~4 stone_brick_wall
setblock ~-100 ~7 ~8 stone_brick_wall
setblock ~100 ~7 ~8 stone_brick_wall
setblock ~-100 ~7 ~12 stone_brick_wall
setblock ~100 ~7 ~12 stone_brick_wall
setblock ~-100 ~7 ~16 stone_brick_wall
setblock ~100 ~7 ~16 stone_brick_wall
setblock ~-100 ~7 ~20 stone_brick_wall
setblock ~100 ~7 ~20 stone_brick_wall
setblock ~-100 ~7 ~24 stone_brick_wall
setblock ~100 ~7 ~24 stone_brick_wall
setblock ~-100 ~7 ~28 stone_brick_wall
setblock ~100 ~7 ~28 stone_brick_wall
setblock ~-100 ~7 ~32 stone_brick_wall
setblock ~100 ~7 ~32 stone_brick_wall
setblock ~-100 ~7 ~36 stone_brick_wall
setblock ~100 ~7 ~36 stone_brick_wall
setblock ~-100 ~7 ~40 stone_brick_wall
setblock ~100 ~7 ~40 stone_brick_wall
setblock ~-100 ~7 ~44 stone_brick_wall
setblock ~100 ~7 ~44 stone_brick_wall
setblock ~-100 ~7 ~48 stone_brick_wall
setblock ~100 ~7 ~48 stone_brick_wall
setblock ~-100 ~7 ~52 stone_brick_wall
setblock ~100 ~7 ~52 stone_brick_wall
setblock ~-100 ~7 ~56 stone_brick_wall
setblock ~100 ~7 ~56 stone_brick_wall
setblock ~-100 ~7 ~60 stone_brick_wall
setblock ~100 ~7 ~60 stone_brick_wall
setblock ~-100 ~7 ~64 stone_brick_wall
setblock ~100 ~7 ~64 stone_brick_wall
setblock ~-100 ~7 ~68 stone_brick_wall
setblock ~100 ~7 ~68 stone_brick_wall
setblock ~-100 ~7 ~72 stone_brick_wall
setblock ~100 ~7 ~72 stone_brick_wall
setblock ~-100 ~7 ~76 stone_brick_wall
setblock ~100 ~7 ~76 stone_brick_wall
setblock ~-100 ~7 ~80 stone_brick_wall
setblock ~100 ~7 ~80 stone_brick_wall
setblock ~-100 ~7 ~84 stone_brick_wall
setblock ~100 ~7 ~84 stone_brick_wall
setblock ~-100 ~7 ~88 stone_brick_wall
setblock ~100 ~7 ~88 stone_brick_wall
setblock ~-100 ~7 ~92 stone_brick_wall
setblock ~100 ~7 ~92 stone_brick_wall
setblock ~-100 ~7 ~96 stone_brick_wall
setblock ~100 ~7 ~96 stone_brick_wall
setblock ~-100 ~7 ~100 stone_brick_wall
setblock ~100 ~7 ~100 stone_brick_wall
fill ~-3 ~0 ~100 ~3 ~4 ~100 air
setblock ~-4 ~4 ~100 soul_lantern
setblock ~4 ~4 ~100 soul_lantern
setblock ~-96 ~4 ~-99 torch
setblock ~-96 ~4 ~99 torch
setblock ~-84 ~4 ~-99 torch
setblock ~-84 ~4 ~99 torch
setblock ~-72 ~4 ~-99 torch
setblock ~-72 ~4 ~99 torch
setblock ~-60 ~4 ~-99 torch
setblock ~-60 ~4 ~99 torch
setblock ~-48 ~4 ~-99 torch
setblock ~-48 ~4 ~99 torch
setblock ~-36 ~4 ~-99 torch
setblock ~-36 ~4 ~99 torch
setblock ~-24 ~4 ~-99 torch
setblock ~-24 ~4 ~99 torch
setblock ~-12 ~4 ~-99 torch
setblock ~-12 ~4 ~99 torch
setblock ~0 ~4 ~-99 torch
setblock ~0 ~4 ~99 torch
setblock ~12 ~4 ~-99 torch
setblock ~12 ~4 ~99 torch
setblock ~24 ~4 ~-99 torch
setblock ~24 ~4 ~99 torch
setblock ~36 ~4 ~-99 torch
setblock ~36 ~4 ~99 torch
setblock ~48 ~4 ~-99 torch
setblock ~48 ~4 ~99 torch
setblock ~60 ~4 ~-99 torch
setblock ~60 ~4 ~99 torch
setblock ~72 ~4 ~-99 torch
setblock ~72 ~4 ~99 torch
setblock ~84 ~4 ~-99 torch
setblock ~84 ~4 ~99 torch
setblock ~96 ~4 ~-99 torch
setblock ~96 ~4 ~99 torch
# === DE KEEP - FUNDERING & 3 VERDIEPINGEN ===
fill ~-28 ~0 ~-28 ~1 ~18 ~1 air
fill ~-28 ~0 ~2 ~1 ~18 ~28 air
fill ~2 ~0 ~-28 ~28 ~18 ~1 air
fill ~2 ~0 ~2 ~28 ~18 ~28 air
fill ~-28 ~-2 ~-28 ~28 ~-1 ~28 red_nether_brick
fill ~-28 ~0 ~-28 ~28 ~18 ~-28 red_concrete
fill ~-28 ~0 ~28 ~28 ~18 ~28 red_concrete
fill ~-28 ~0 ~-28 ~-28 ~18 ~28 red_concrete
fill ~28 ~0 ~-28 ~28 ~18 ~28 red_concrete
fill ~-27 ~-1 ~-27 ~27 ~-1 ~27 red_concrete
fill ~-27 ~5 ~-27 ~27 ~5 ~27 red_concrete
fill ~-27 ~11 ~-27 ~27 ~11 ~27 red_concrete
fill ~-28 ~18 ~-28 ~28 ~18 ~28 red_concrete
fill ~-27 ~0 ~-27 ~27 ~0 ~27 red_nether_brick
setblock ~-24 ~2 ~-28 red_stained_glass
setblock ~-24 ~3 ~-28 red_stained_glass
setblock ~-24 ~2 ~28 red_stained_glass
setblock ~-24 ~3 ~28 red_stained_glass
setblock ~-18 ~2 ~-28 red_stained_glass
setblock ~-18 ~3 ~-28 red_stained_glass
setblock ~-18 ~2 ~28 red_stained_glass
setblock ~-18 ~3 ~28 red_stained_glass
setblock ~-12 ~2 ~-28 red_stained_glass
setblock ~-12 ~3 ~-28 red_stained_glass
setblock ~-12 ~2 ~28 red_stained_glass
setblock ~-12 ~3 ~28 red_stained_glass
setblock ~-6 ~2 ~-28 red_stained_glass
setblock ~-6 ~3 ~-28 red_stained_glass
setblock ~-6 ~2 ~28 red_stained_glass
setblock ~-6 ~3 ~28 red_stained_glass
setblock ~0 ~2 ~-28 red_stained_glass
setblock ~0 ~3 ~-28 red_stained_glass
setblock ~0 ~2 ~28 red_stained_glass
setblock ~0 ~3 ~28 red_stained_glass
setblock ~6 ~2 ~-28 red_stained_glass
setblock ~6 ~3 ~-28 red_stained_glass
setblock ~6 ~2 ~28 red_stained_glass
setblock ~6 ~3 ~28 red_stained_glass
setblock ~12 ~2 ~-28 red_stained_glass
setblock ~12 ~3 ~-28 red_stained_glass
setblock ~12 ~2 ~28 red_stained_glass
setblock ~12 ~3 ~28 red_stained_glass
setblock ~18 ~2 ~-28 red_stained_glass
setblock ~18 ~3 ~-28 red_stained_glass
setblock ~18 ~2 ~28 red_stained_glass
setblock ~18 ~3 ~28 red_stained_glass
setblock ~24 ~2 ~-28 red_stained_glass
setblock ~24 ~3 ~-28 red_stained_glass
setblock ~24 ~2 ~28 red_stained_glass
setblock ~24 ~3 ~28 red_stained_glass
setblock ~-28 ~2 ~-24 red_stained_glass
setblock ~-28 ~3 ~-24 red_stained_glass
setblock ~28 ~2 ~-24 red_stained_glass
setblock ~28 ~3 ~-24 red_stained_glass
setblock ~-28 ~2 ~-18 red_stained_glass
setblock ~-28 ~3 ~-18 red_stained_glass
setblock ~28 ~2 ~-18 red_stained_glass
setblock ~28 ~3 ~-18 red_stained_glass
setblock ~-28 ~2 ~-12 red_stained_glass
setblock ~-28 ~3 ~-12 red_stained_glass
setblock ~28 ~2 ~-12 red_stained_glass
setblock ~28 ~3 ~-12 red_stained_glass
setblock ~-28 ~2 ~-6 red_stained_glass
setblock ~-28 ~3 ~-6 red_stained_glass
setblock ~28 ~2 ~-6 red_stained_glass
setblock ~28 ~3 ~-6 red_stained_glass
setblock ~-28 ~2 ~0 red_stained_glass
setblock ~-28 ~3 ~0 red_stained_glass
setblock ~28 ~2 ~0 red_stained_glass
setblock ~28 ~3 ~0 red_stained_glass
setblock ~-28 ~2 ~6 red_stained_glass
setblock ~-28 ~3 ~6 red_stained_glass
setblock ~28 ~2 ~6 red_stained_glass
setblock ~28 ~3 ~6 red_stained_glass
setblock ~-28 ~2 ~12 red_stained_glass
setblock ~-28 ~3 ~12 red_stained_glass
setblock ~28 ~2 ~12 red_stained_glass
setblock ~28 ~3 ~12 red_stained_glass
setblock ~-28 ~2 ~18 red_stained_glass
setblock ~-28 ~3 ~18 red_stained_glass
setblock ~28 ~2 ~18 red_stained_glass
setblock ~28 ~3 ~18 red_stained_glass
setblock ~-28 ~2 ~24 red_stained_glass
setblock ~-28 ~3 ~24 red_stained_glass
setblock ~28 ~2 ~24 red_stained_glass
setblock ~28 ~3 ~24 red_stained_glass
setblock ~-24 ~8 ~-28 red_stained_glass
setblock ~-24 ~9 ~-28 red_stained_glass
setblock ~-24 ~8 ~28 red_stained_glass
setblock ~-24 ~9 ~28 red_stained_glass
setblock ~-18 ~8 ~-28 red_stained_glass
setblock ~-18 ~9 ~-28 red_stained_glass
setblock ~-18 ~8 ~28 red_stained_glass
setblock ~-18 ~9 ~28 red_stained_glass
setblock ~-12 ~8 ~-28 red_stained_glass
setblock ~-12 ~9 ~-28 red_stained_glass
setblock ~-12 ~8 ~28 red_stained_glass
setblock ~-12 ~9 ~28 red_stained_glass
setblock ~-6 ~8 ~-28 red_stained_glass
setblock ~-6 ~9 ~-28 red_stained_glass
setblock ~-6 ~8 ~28 red_stained_glass
setblock ~-6 ~9 ~28 red_stained_glass
setblock ~0 ~8 ~-28 red_stained_glass
setblock ~0 ~9 ~-28 red_stained_glass
setblock ~0 ~8 ~28 red_stained_glass
setblock ~0 ~9 ~28 red_stained_glass
setblock ~6 ~8 ~-28 red_stained_glass
setblock ~6 ~9 ~-28 red_stained_glass
setblock ~6 ~8 ~28 red_stained_glass
setblock ~6 ~9 ~28 red_stained_glass
setblock ~12 ~8 ~-28 red_stained_glass
setblock ~12 ~9 ~-28 red_stained_glass
setblock ~12 ~8 ~28 red_stained_glass
setblock ~12 ~9 ~28 red_stained_glass
setblock ~18 ~8 ~-28 red_stained_glass
setblock ~18 ~9 ~-28 red_stained_glass
setblock ~18 ~8 ~28 red_stained_glass
setblock ~18 ~9 ~28 red_stained_glass
setblock ~24 ~8 ~-28 red_stained_glass
setblock ~24 ~9 ~-28 red_stained_glass
setblock ~24 ~8 ~28 red_stained_glass
setblock ~24 ~9 ~28 red_stained_glass
setblock ~-28 ~8 ~-24 red_stained_glass
setblock ~-28 ~9 ~-24 red_stained_glass
setblock ~28 ~8 ~-24 red_stained_glass
setblock ~28 ~9 ~-24 red_stained_glass
setblock ~-28 ~8 ~-18 red_stained_glass
setblock ~-28 ~9 ~-18 red_stained_glass
setblock ~28 ~8 ~-18 red_stained_glass
setblock ~28 ~9 ~-18 red_stained_glass
setblock ~-28 ~8 ~-12 red_stained_glass
setblock ~-28 ~9 ~-12 red_stained_glass
setblock ~28 ~8 ~-12 red_stained_glass
setblock ~28 ~9 ~-12 red_stained_glass
setblock ~-28 ~8 ~-6 red_stained_glass
setblock ~-28 ~9 ~-6 red_stained_glass
setblock ~28 ~8 ~-6 red_stained_glass
setblock ~28 ~9 ~-6 red_stained_glass
setblock ~-28 ~8 ~0 red_stained_glass
setblock ~-28 ~9 ~0 red_stained_glass
setblock ~28 ~8 ~0 red_stained_glass
setblock ~28 ~9 ~0 red_stained_glass
setblock ~-28 ~8 ~6 red_stained_glass
setblock ~-28 ~9 ~6 red_stained_glass
setblock ~28 ~8 ~6 red_stained_glass
setblock ~28 ~9 ~6 red_stained_glass
setblock ~-28 ~8 ~12 red_stained_glass
setblock ~-28 ~9 ~12 red_stained_glass
setblock ~28 ~8 ~12 red_stained_glass
setblock ~28 ~9 ~12 red_stained_glass
setblock ~-28 ~8 ~18 red_stained_glass
setblock ~-28 ~9 ~18 red_stained_glass
setblock ~28 ~8 ~18 red_stained_glass
setblock ~28 ~9 ~18 red_stained_glass
setblock ~-28 ~8 ~24 red_stained_glass
setblock ~-28 ~9 ~24 red_stained_glass
setblock ~28 ~8 ~24 red_stained_glass
setblock ~28 ~9 ~24 red_stained_glass
setblock ~-24 ~14 ~-28 red_stained_glass
setblock ~-24 ~15 ~-28 red_stained_glass
setblock ~-24 ~14 ~28 red_stained_glass
setblock ~-24 ~15 ~28 red_stained_glass
setblock ~-18 ~14 ~-28 red_stained_glass
setblock ~-18 ~15 ~-28 red_stained_glass
setblock ~-18 ~14 ~28 red_stained_glass
setblock ~-18 ~15 ~28 red_stained_glass
setblock ~-12 ~14 ~-28 red_stained_glass
setblock ~-12 ~15 ~-28 red_stained_glass
setblock ~-12 ~14 ~28 red_stained_glass
setblock ~-12 ~15 ~28 red_stained_glass
setblock ~-6 ~14 ~-28 red_stained_glass
setblock ~-6 ~15 ~-28 red_stained_glass
setblock ~-6 ~14 ~28 red_stained_glass
setblock ~-6 ~15 ~28 red_stained_glass
setblock ~0 ~14 ~-28 red_stained_glass
setblock ~0 ~15 ~-28 red_stained_glass
setblock ~0 ~14 ~28 red_stained_glass
setblock ~0 ~15 ~28 red_stained_glass
setblock ~6 ~14 ~-28 red_stained_glass
setblock ~6 ~15 ~-28 red_stained_glass
setblock ~6 ~14 ~28 red_stained_glass
setblock ~6 ~15 ~28 red_stained_glass
setblock ~12 ~14 ~-28 red_stained_glass
setblock ~12 ~15 ~-28 red_stained_glass
setblock ~12 ~14 ~28 red_stained_glass
setblock ~12 ~15 ~28 red_stained_glass
setblock ~18 ~14 ~-28 red_stained_glass
setblock ~18 ~15 ~-28 red_stained_glass
setblock ~18 ~14 ~28 red_stained_glass
setblock ~18 ~15 ~28 red_stained_glass
setblock ~24 ~14 ~-28 red_stained_glass
setblock ~24 ~15 ~-28 red_stained_glass
setblock ~24 ~14 ~28 red_stained_glass
setblock ~24 ~15 ~28 red_stained_glass
setblock ~-28 ~14 ~-24 red_stained_glass
setblock ~-28 ~15 ~-24 red_stained_glass
setblock ~28 ~14 ~-24 red_stained_glass
setblock ~28 ~15 ~-24 red_stained_glass
setblock ~-28 ~14 ~-18 red_stained_glass
setblock ~-28 ~15 ~-18 red_stained_glass
setblock ~28 ~14 ~-18 red_stained_glass
setblock ~28 ~15 ~-18 red_stained_glass
setblock ~-28 ~14 ~-12 red_stained_glass
setblock ~-28 ~15 ~-12 red_stained_glass
setblock ~28 ~14 ~-12 red_stained_glass
setblock ~28 ~15 ~-12 red_stained_glass
setblock ~-28 ~14 ~-6 red_stained_glass
setblock ~-28 ~15 ~-6 red_stained_glass
setblock ~28 ~14 ~-6 red_stained_glass
setblock ~28 ~15 ~-6 red_stained_glass
setblock ~-28 ~14 ~0 red_stained_glass
setblock ~-28 ~15 ~0 red_stained_glass
setblock ~28 ~14 ~0 red_stained_glass
setblock ~28 ~15 ~0 red_stained_glass
setblock ~-28 ~14 ~6 red_stained_glass
setblock ~-28 ~15 ~6 red_stained_glass
setblock ~28 ~14 ~6 red_stained_glass
setblock ~28 ~15 ~6 red_stained_glass
setblock ~-28 ~14 ~12 red_stained_glass
setblock ~-28 ~15 ~12 red_stained_glass
setblock ~28 ~14 ~12 red_stained_glass
setblock ~28 ~15 ~12 red_stained_glass
setblock ~-28 ~14 ~18 red_stained_glass
setblock ~-28 ~15 ~18 red_stained_glass
setblock ~28 ~14 ~18 red_stained_glass
setblock ~28 ~15 ~18 red_stained_glass
setblock ~-28 ~14 ~24 red_stained_glass
setblock ~-28 ~15 ~24 red_stained_glass
setblock ~28 ~14 ~24 red_stained_glass
setblock ~28 ~15 ~24 red_stained_glass
setblock ~-28 ~19 ~-28 stone_brick_wall
setblock ~-28 ~19 ~28 stone_brick_wall
setblock ~-25 ~19 ~-28 stone_brick_wall
setblock ~-25 ~19 ~28 stone_brick_wall
setblock ~-22 ~19 ~-28 stone_brick_wall
setblock ~-22 ~19 ~28 stone_brick_wall
setblock ~-19 ~19 ~-28 stone_brick_wall
setblock ~-19 ~19 ~28 stone_brick_wall
setblock ~-16 ~19 ~-28 stone_brick_wall
setblock ~-16 ~19 ~28 stone_brick_wall
setblock ~-13 ~19 ~-28 stone_brick_wall
setblock ~-13 ~19 ~28 stone_brick_wall
setblock ~-10 ~19 ~-28 stone_brick_wall
setblock ~-10 ~19 ~28 stone_brick_wall
setblock ~-7 ~19 ~-28 stone_brick_wall
setblock ~-7 ~19 ~28 stone_brick_wall
setblock ~-4 ~19 ~-28 stone_brick_wall
setblock ~-4 ~19 ~28 stone_brick_wall
setblock ~-1 ~19 ~-28 stone_brick_wall
setblock ~-1 ~19 ~28 stone_brick_wall
setblock ~2 ~19 ~-28 stone_brick_wall
setblock ~2 ~19 ~28 stone_brick_wall
setblock ~5 ~19 ~-28 stone_brick_wall
setblock ~5 ~19 ~28 stone_brick_wall
setblock ~8 ~19 ~-28 stone_brick_wall
setblock ~8 ~19 ~28 stone_brick_wall
setblock ~11 ~19 ~-28 stone_brick_wall
setblock ~11 ~19 ~28 stone_brick_wall
setblock ~14 ~19 ~-28 stone_brick_wall
setblock ~14 ~19 ~28 stone_brick_wall
setblock ~17 ~19 ~-28 stone_brick_wall
setblock ~17 ~19 ~28 stone_brick_wall
setblock ~20 ~19 ~-28 stone_brick_wall
setblock ~20 ~19 ~28 stone_brick_wall
setblock ~23 ~19 ~-28 stone_brick_wall
setblock ~23 ~19 ~28 stone_brick_wall
setblock ~26 ~19 ~-28 stone_brick_wall
setblock ~26 ~19 ~28 stone_brick_wall
setblock ~-28 ~19 ~-28 stone_brick_wall
setblock ~28 ~19 ~-28 stone_brick_wall
setblock ~-28 ~19 ~-25 stone_brick_wall
setblock ~28 ~19 ~-25 stone_brick_wall
setblock ~-28 ~19 ~-22 stone_brick_wall
setblock ~28 ~19 ~-22 stone_brick_wall
setblock ~-28 ~19 ~-19 stone_brick_wall
setblock ~28 ~19 ~-19 stone_brick_wall
setblock ~-28 ~19 ~-16 stone_brick_wall
setblock ~28 ~19 ~-16 stone_brick_wall
setblock ~-28 ~19 ~-13 stone_brick_wall
setblock ~28 ~19 ~-13 stone_brick_wall
setblock ~-28 ~19 ~-10 stone_brick_wall
setblock ~28 ~19 ~-10 stone_brick_wall
setblock ~-28 ~19 ~-7 stone_brick_wall
setblock ~28 ~19 ~-7 stone_brick_wall
setblock ~-28 ~19 ~-4 stone_brick_wall
setblock ~28 ~19 ~-4 stone_brick_wall
setblock ~-28 ~19 ~-1 stone_brick_wall
setblock ~28 ~19 ~-1 stone_brick_wall
setblock ~-28 ~19 ~2 stone_brick_wall
setblock ~28 ~19 ~2 stone_brick_wall
setblock ~-28 ~19 ~5 stone_brick_wall
setblock ~28 ~19 ~5 stone_brick_wall
setblock ~-28 ~19 ~8 stone_brick_wall
setblock ~28 ~19 ~8 stone_brick_wall
setblock ~-28 ~19 ~11 stone_brick_wall
setblock ~28 ~19 ~11 stone_brick_wall
setblock ~-28 ~19 ~14 stone_brick_wall
setblock ~28 ~19 ~14 stone_brick_wall
setblock ~-28 ~19 ~17 stone_brick_wall
setblock ~28 ~19 ~17 stone_brick_wall
setblock ~-28 ~19 ~20 stone_brick_wall
setblock ~28 ~19 ~20 stone_brick_wall
setblock ~-28 ~19 ~23 stone_brick_wall
setblock ~28 ~19 ~23 stone_brick_wall
setblock ~-28 ~19 ~26 stone_brick_wall
setblock ~28 ~19 ~26 stone_brick_wall
fill ~-2 ~0 ~28 ~2 ~3 ~28 air
setblock ~-3 ~4 ~28 soul_lantern
setblock ~3 ~4 ~28 soul_lantern
setblock ~-27 ~2 ~-27 torch
setblock ~-27 ~2 ~27 torch
setblock ~-23 ~2 ~-27 torch
setblock ~-23 ~2 ~27 torch
setblock ~-19 ~2 ~-27 torch
setblock ~-19 ~2 ~27 torch
setblock ~-15 ~2 ~-27 torch
setblock ~-15 ~2 ~27 torch
setblock ~-11 ~2 ~-27 torch
setblock ~-11 ~2 ~27 torch
setblock ~-7 ~2 ~-27 torch
setblock ~-7 ~2 ~27 torch
setblock ~-3 ~2 ~-27 torch
setblock ~-3 ~2 ~27 torch
setblock ~1 ~2 ~-27 torch
setblock ~1 ~2 ~27 torch
setblock ~5 ~2 ~-27 torch
setblock ~5 ~2 ~27 torch
setblock ~9 ~2 ~-27 torch
setblock ~9 ~2 ~27 torch
setblock ~13 ~2 ~-27 torch
setblock ~13 ~2 ~27 torch
setblock ~17 ~2 ~-27 torch
setblock ~17 ~2 ~27 torch
setblock ~21 ~2 ~-27 torch
setblock ~21 ~2 ~27 torch
setblock ~25 ~2 ~-27 torch
setblock ~25 ~2 ~27 torch
setblock ~-27 ~2 ~-27 torch
setblock ~27 ~2 ~-27 torch
setblock ~-27 ~2 ~-23 torch
setblock ~27 ~2 ~-23 torch
setblock ~-27 ~2 ~-19 torch
setblock ~27 ~2 ~-19 torch
setblock ~-27 ~2 ~-15 torch
setblock ~27 ~2 ~-15 torch
setblock ~-27 ~2 ~-11 torch
setblock ~27 ~2 ~-11 torch
setblock ~-27 ~2 ~-7 torch
setblock ~27 ~2 ~-7 torch
setblock ~-27 ~2 ~-3 torch
setblock ~27 ~2 ~-3 torch
setblock ~-27 ~2 ~1 torch
setblock ~27 ~2 ~1 torch
setblock ~-27 ~2 ~5 torch
setblock ~27 ~2 ~5 torch
setblock ~-27 ~2 ~9 torch
setblock ~27 ~2 ~9 torch
setblock ~-27 ~2 ~13 torch
setblock ~27 ~2 ~13 torch
setblock ~-27 ~2 ~17 torch
setblock ~27 ~2 ~17 torch
setblock ~-27 ~2 ~21 torch
setblock ~27 ~2 ~21 torch
setblock ~-27 ~2 ~25 torch
setblock ~27 ~2 ~25 torch
setblock ~-27 ~4 ~-27 torch
setblock ~-27 ~4 ~27 torch
setblock ~-23 ~4 ~-27 torch
setblock ~-23 ~4 ~27 torch
setblock ~-19 ~4 ~-27 torch
setblock ~-19 ~4 ~27 torch
setblock ~-15 ~4 ~-27 torch
setblock ~-15 ~4 ~27 torch
setblock ~-11 ~4 ~-27 torch
setblock ~-11 ~4 ~27 torch
setblock ~-7 ~4 ~-27 torch
setblock ~-7 ~4 ~27 torch
setblock ~-3 ~4 ~-27 torch
setblock ~-3 ~4 ~27 torch
setblock ~1 ~4 ~-27 torch
setblock ~1 ~4 ~27 torch
setblock ~5 ~4 ~-27 torch
setblock ~5 ~4 ~27 torch
setblock ~9 ~4 ~-27 torch
setblock ~9 ~4 ~27 torch
setblock ~13 ~4 ~-27 torch
setblock ~13 ~4 ~27 torch
setblock ~17 ~4 ~-27 torch
setblock ~17 ~4 ~27 torch
setblock ~21 ~4 ~-27 torch
setblock ~21 ~4 ~27 torch
setblock ~25 ~4 ~-27 torch
setblock ~25 ~4 ~27 torch
setblock ~-27 ~4 ~-27 torch
setblock ~27 ~4 ~-27 torch
setblock ~-27 ~4 ~-23 torch
setblock ~27 ~4 ~-23 torch
setblock ~-27 ~4 ~-19 torch
setblock ~27 ~4 ~-19 torch
setblock ~-27 ~4 ~-15 torch
setblock ~27 ~4 ~-15 torch
setblock ~-27 ~4 ~-11 torch
setblock ~27 ~4 ~-11 torch
setblock ~-27 ~4 ~-7 torch
setblock ~27 ~4 ~-7 torch
setblock ~-27 ~4 ~-3 torch
setblock ~27 ~4 ~-3 torch
setblock ~-27 ~4 ~1 torch
setblock ~27 ~4 ~1 torch
setblock ~-27 ~4 ~5 torch
setblock ~27 ~4 ~5 torch
setblock ~-27 ~4 ~9 torch
setblock ~27 ~4 ~9 torch
setblock ~-27 ~4 ~13 torch
setblock ~27 ~4 ~13 torch
setblock ~-27 ~4 ~17 torch
setblock ~27 ~4 ~17 torch
setblock ~-27 ~4 ~21 torch
setblock ~27 ~4 ~21 torch
setblock ~-27 ~4 ~25 torch
setblock ~27 ~4 ~25 torch
setblock ~-27 ~8 ~-27 torch
setblock ~-27 ~8 ~27 torch
setblock ~-23 ~8 ~-27 torch
setblock ~-23 ~8 ~27 torch
setblock ~-19 ~8 ~-27 torch
setblock ~-19 ~8 ~27 torch
setblock ~-15 ~8 ~-27 torch
setblock ~-15 ~8 ~27 torch
setblock ~-11 ~8 ~-27 torch
setblock ~-11 ~8 ~27 torch
setblock ~-7 ~8 ~-27 torch
setblock ~-7 ~8 ~27 torch
setblock ~-3 ~8 ~-27 torch
setblock ~-3 ~8 ~27 torch
setblock ~1 ~8 ~-27 torch
setblock ~1 ~8 ~27 torch
setblock ~5 ~8 ~-27 torch
setblock ~5 ~8 ~27 torch
setblock ~9 ~8 ~-27 torch
setblock ~9 ~8 ~27 torch
setblock ~13 ~8 ~-27 torch
setblock ~13 ~8 ~27 torch
setblock ~17 ~8 ~-27 torch
setblock ~17 ~8 ~27 torch
setblock ~21 ~8 ~-27 torch
setblock ~21 ~8 ~27 torch
setblock ~25 ~8 ~-27 torch
setblock ~25 ~8 ~27 torch
setblock ~-27 ~8 ~-27 torch
setblock ~27 ~8 ~-27 torch
setblock ~-27 ~8 ~-23 torch
setblock ~27 ~8 ~-23 torch
setblock ~-27 ~8 ~-19 torch
setblock ~27 ~8 ~-19 torch
setblock ~-27 ~8 ~-15 torch
setblock ~27 ~8 ~-15 torch
setblock ~-27 ~8 ~-11 torch
setblock ~27 ~8 ~-11 torch
setblock ~-27 ~8 ~-7 torch
setblock ~27 ~8 ~-7 torch
setblock ~-27 ~8 ~-3 torch
setblock ~27 ~8 ~-3 torch
setblock ~-27 ~8 ~1 torch
setblock ~27 ~8 ~1 torch
setblock ~-27 ~8 ~5 torch
setblock ~27 ~8 ~5 torch
setblock ~-27 ~8 ~9 torch
setblock ~27 ~8 ~9 torch
setblock ~-27 ~8 ~13 torch
setblock ~27 ~8 ~13 torch
setblock ~-27 ~8 ~17 torch
setblock ~27 ~8 ~17 torch
setblock ~-27 ~8 ~21 torch
setblock ~27 ~8 ~21 torch
setblock ~-27 ~8 ~25 torch
setblock ~27 ~8 ~25 torch
setblock ~-27 ~10 ~-27 torch
setblock ~-27 ~10 ~27 torch
setblock ~-23 ~10 ~-27 torch
setblock ~-23 ~10 ~27 torch
setblock ~-19 ~10 ~-27 torch
setblock ~-19 ~10 ~27 torch
setblock ~-15 ~10 ~-27 torch
setblock ~-15 ~10 ~27 torch
setblock ~-11 ~10 ~-27 torch
setblock ~-11 ~10 ~27 torch
setblock ~-7 ~10 ~-27 torch
setblock ~-7 ~10 ~27 torch
setblock ~-3 ~10 ~-27 torch
setblock ~-3 ~10 ~27 torch
setblock ~1 ~10 ~-27 torch
setblock ~1 ~10 ~27 torch
setblock ~5 ~10 ~-27 torch
setblock ~5 ~10 ~27 torch
setblock ~9 ~10 ~-27 torch
setblock ~9 ~10 ~27 torch
setblock ~13 ~10 ~-27 torch
setblock ~13 ~10 ~27 torch
setblock ~17 ~10 ~-27 torch
setblock ~17 ~10 ~27 torch
setblock ~21 ~10 ~-27 torch
setblock ~21 ~10 ~27 torch
setblock ~25 ~10 ~-27 torch
setblock ~25 ~10 ~27 torch
setblock ~-27 ~10 ~-27 torch
setblock ~27 ~10 ~-27 torch
setblock ~-27 ~10 ~-23 torch
setblock ~27 ~10 ~-23 torch
setblock ~-27 ~10 ~-19 torch
setblock ~27 ~10 ~-19 torch
setblock ~-27 ~10 ~-15 torch
setblock ~27 ~10 ~-15 torch
setblock ~-27 ~10 ~-11 torch
setblock ~27 ~10 ~-11 torch
setblock ~-27 ~10 ~-7 torch
setblock ~27 ~10 ~-7 torch
setblock ~-27 ~10 ~-3 torch
setblock ~27 ~10 ~-3 torch
setblock ~-27 ~10 ~1 torch
setblock ~27 ~10 ~1 torch
setblock ~-27 ~10 ~5 torch
setblock ~27 ~10 ~5 torch
setblock ~-27 ~10 ~9 torch
setblock ~27 ~10 ~9 torch
setblock ~-27 ~10 ~13 torch
setblock ~27 ~10 ~13 torch
setblock ~-27 ~10 ~17 torch
setblock ~27 ~10 ~17 torch
setblock ~-27 ~10 ~21 torch
setblock ~27 ~10 ~21 torch
setblock ~-27 ~10 ~25 torch
setblock ~27 ~10 ~25 torch
setblock ~-27 ~14 ~-27 torch
setblock ~-27 ~14 ~27 torch
setblock ~-23 ~14 ~-27 torch
setblock ~-23 ~14 ~27 torch
setblock ~-19 ~14 ~-27 torch
setblock ~-19 ~14 ~27 torch
setblock ~-15 ~14 ~-27 torch
setblock ~-15 ~14 ~27 torch
setblock ~-11 ~14 ~-27 torch
setblock ~-11 ~14 ~27 torch
setblock ~-7 ~14 ~-27 torch
setblock ~-7 ~14 ~27 torch
setblock ~-3 ~14 ~-27 torch
setblock ~-3 ~14 ~27 torch
setblock ~1 ~14 ~-27 torch
setblock ~1 ~14 ~27 torch
setblock ~5 ~14 ~-27 torch
setblock ~5 ~14 ~27 torch
setblock ~9 ~14 ~-27 torch
setblock ~9 ~14 ~27 torch
setblock ~13 ~14 ~-27 torch
setblock ~13 ~14 ~27 torch
setblock ~17 ~14 ~-27 torch
setblock ~17 ~14 ~27 torch
setblock ~21 ~14 ~-27 torch
setblock ~21 ~14 ~27 torch
setblock ~25 ~14 ~-27 torch
setblock ~25 ~14 ~27 torch
setblock ~-27 ~14 ~-27 torch
setblock ~27 ~14 ~-27 torch
setblock ~-27 ~14 ~-23 torch
setblock ~27 ~14 ~-23 torch
setblock ~-27 ~14 ~-19 torch
setblock ~27 ~14 ~-19 torch
setblock ~-27 ~14 ~-15 torch
setblock ~27 ~14 ~-15 torch
setblock ~-27 ~14 ~-11 torch
setblock ~27 ~14 ~-11 torch
setblock ~-27 ~14 ~-7 torch
setblock ~27 ~14 ~-7 torch
setblock ~-27 ~14 ~-3 torch
setblock ~27 ~14 ~-3 torch
setblock ~-27 ~14 ~1 torch
setblock ~27 ~14 ~1 torch
setblock ~-27 ~14 ~5 torch
setblock ~27 ~14 ~5 torch
setblock ~-27 ~14 ~9 torch
setblock ~27 ~14 ~9 torch
setblock ~-27 ~14 ~13 torch
setblock ~27 ~14 ~13 torch
setblock ~-27 ~14 ~17 torch
setblock ~27 ~14 ~17 torch
setblock ~-27 ~14 ~21 torch
setblock ~27 ~14 ~21 torch
setblock ~-27 ~14 ~25 torch
setblock ~27 ~14 ~25 torch
setblock ~-27 ~16 ~-27 torch
setblock ~-27 ~16 ~27 torch
setblock ~-23 ~16 ~-27 torch
setblock ~-23 ~16 ~27 torch
setblock ~-19 ~16 ~-27 torch
setblock ~-19 ~16 ~27 torch
setblock ~-15 ~16 ~-27 torch
setblock ~-15 ~16 ~27 torch
setblock ~-11 ~16 ~-27 torch
setblock ~-11 ~16 ~27 torch
setblock ~-7 ~16 ~-27 torch
setblock ~-7 ~16 ~27 torch
setblock ~-3 ~16 ~-27 torch
setblock ~-3 ~16 ~27 torch
setblock ~1 ~16 ~-27 torch
setblock ~1 ~16 ~27 torch
setblock ~5 ~16 ~-27 torch
setblock ~5 ~16 ~27 torch
setblock ~9 ~16 ~-27 torch
setblock ~9 ~16 ~27 torch
setblock ~13 ~16 ~-27 torch
setblock ~13 ~16 ~27 torch
setblock ~17 ~16 ~-27 torch
setblock ~17 ~16 ~27 torch
setblock ~21 ~16 ~-27 torch
setblock ~21 ~16 ~27 torch
setblock ~25 ~16 ~-27 torch
setblock ~25 ~16 ~27 torch
setblock ~-27 ~16 ~-27 torch
setblock ~27 ~16 ~-27 torch
setblock ~-27 ~16 ~-23 torch
setblock ~27 ~16 ~-23 torch
setblock ~-27 ~16 ~-19 torch
setblock ~27 ~16 ~-19 torch
setblock ~-27 ~16 ~-15 torch
setblock ~27 ~16 ~-15 torch
setblock ~-27 ~16 ~-11 torch
setblock ~27 ~16 ~-11 torch
setblock ~-27 ~16 ~-7 torch
setblock ~27 ~16 ~-7 torch
setblock ~-27 ~16 ~-3 torch
setblock ~27 ~16 ~-3 torch
setblock ~-27 ~16 ~1 torch
setblock ~27 ~16 ~1 torch
setblock ~-27 ~16 ~5 torch
setblock ~27 ~16 ~5 torch
setblock ~-27 ~16 ~9 torch
setblock ~27 ~16 ~9 torch
setblock ~-27 ~16 ~13 torch
setblock ~27 ~16 ~13 torch
setblock ~-27 ~16 ~17 torch
setblock ~27 ~16 ~17 torch
setblock ~-27 ~16 ~21 torch
setblock ~27 ~16 ~21 torch
setblock ~-27 ~16 ~25 torch
setblock ~27 ~16 ~25 torch
setblock ~-12 ~5 ~-12 soul_lantern
setblock ~-12 ~5 ~-6 soul_lantern
setblock ~-12 ~5 ~0 soul_lantern
setblock ~-12 ~5 ~6 soul_lantern
setblock ~-12 ~5 ~12 soul_lantern
setblock ~-6 ~5 ~-12 soul_lantern
setblock ~-6 ~5 ~-6 soul_lantern
setblock ~-6 ~5 ~0 soul_lantern
setblock ~-6 ~5 ~6 soul_lantern
setblock ~-6 ~5 ~12 soul_lantern
setblock ~0 ~5 ~-12 soul_lantern
setblock ~0 ~5 ~-6 soul_lantern
setblock ~0 ~5 ~0 soul_lantern
setblock ~0 ~5 ~6 soul_lantern
setblock ~0 ~5 ~12 soul_lantern
setblock ~6 ~5 ~-12 soul_lantern
setblock ~6 ~5 ~-6 soul_lantern
setblock ~6 ~5 ~0 soul_lantern
setblock ~6 ~5 ~6 soul_lantern
setblock ~6 ~5 ~12 soul_lantern
setblock ~12 ~5 ~-12 soul_lantern
setblock ~12 ~5 ~-6 soul_lantern
setblock ~12 ~5 ~0 soul_lantern
setblock ~12 ~5 ~6 soul_lantern
setblock ~12 ~5 ~12 soul_lantern
setblock ~-24 ~1 ~-24 oak_fence
setblock ~-24 ~2 ~-24 torch
setblock ~-24 ~1 ~0 oak_fence
setblock ~-24 ~2 ~0 torch
setblock ~-24 ~1 ~24 oak_fence
setblock ~-24 ~2 ~24 torch
setblock ~0 ~1 ~-24 oak_fence
setblock ~0 ~2 ~-24 torch
setblock ~0 ~1 ~0 oak_fence
setblock ~0 ~2 ~0 torch
setblock ~0 ~1 ~24 oak_fence
setblock ~0 ~2 ~24 torch
setblock ~24 ~1 ~-24 oak_fence
setblock ~24 ~2 ~-24 torch
setblock ~24 ~1 ~0 oak_fence
setblock ~24 ~2 ~0 torch
setblock ~24 ~1 ~24 oak_fence
setblock ~24 ~2 ~24 torch
fill ~-26 ~5 ~-26 ~-24 ~5 ~-24 air
fill ~-26 ~11 ~-26 ~-24 ~11 ~-24 air
setblock ~-25 ~0 ~-25 stone_brick_stairs
setblock ~-24 ~1 ~-25 stone_brick_stairs
setblock ~-24 ~2 ~-24 stone_brick_stairs
setblock ~-23 ~3 ~-24 stone_brick_stairs
setblock ~-23 ~4 ~-23 stone_brick_stairs
setblock ~-22 ~5 ~-23 stone_brick_stairs
setblock ~-22 ~6 ~-22 stone_brick_stairs
setblock ~-25 ~7 ~-22 stone_brick_stairs
setblock ~-25 ~8 ~-25 stone_brick_stairs
setblock ~-24 ~9 ~-25 stone_brick_stairs
setblock ~-24 ~10 ~-24 stone_brick_stairs
setblock ~-23 ~11 ~-24 stone_brick_stairs
setblock ~-23 ~12 ~-23 stone_brick_stairs
setblock ~-22 ~13 ~-23 stone_brick_stairs
setblock ~-22 ~14 ~-22 stone_brick_stairs
setblock ~-25 ~15 ~-22 stone_brick_stairs
setblock ~-25 ~16 ~-25 stone_brick_stairs
setblock ~-24 ~17 ~-25 stone_brick_stairs
# === 4 HOGE HOEKTORENS + CENTRALE SPITS (tot ~100 hoog) ===
fill ~-30 ~0 ~-30 ~-26 ~70 ~-26 red_concrete
fill ~-29 ~0 ~-29 ~-27 ~70 ~-27 air
fill ~-29 ~70 ~-29 ~-27 ~70 ~-27 red_concrete
setblock ~-29 ~71 ~-29 torch
setblock ~-27 ~71 ~-27 torch
setblock ~-30 ~71 ~-30 stone_brick_wall
setblock ~-30 ~71 ~-26 stone_brick_wall
setblock ~-28 ~71 ~-30 stone_brick_wall
setblock ~-28 ~71 ~-26 stone_brick_wall
setblock ~-26 ~71 ~-30 stone_brick_wall
setblock ~-26 ~71 ~-26 stone_brick_wall
setblock ~-30 ~71 ~-30 stone_brick_wall
setblock ~-26 ~71 ~-30 stone_brick_wall
setblock ~-30 ~71 ~-28 stone_brick_wall
setblock ~-26 ~71 ~-28 stone_brick_wall
setblock ~-30 ~71 ~-26 stone_brick_wall
setblock ~-26 ~71 ~-26 stone_brick_wall
setblock ~-28 ~72 ~-28 oak_fence
setblock ~-28 ~73 ~-28 oak_fence
setblock ~-27 ~73 ~-28 black_wool
setblock ~-27 ~72 ~-28 black_wool
setblock ~-28 ~70 ~-28 sea_lantern
setblock ~-28 ~4 ~-30 torch
setblock ~-28 ~12 ~-30 torch
setblock ~-28 ~20 ~-30 torch
setblock ~-28 ~28 ~-30 torch
setblock ~-28 ~36 ~-30 torch
setblock ~-28 ~44 ~-30 torch
setblock ~-28 ~52 ~-30 torch
setblock ~-28 ~60 ~-30 torch
setblock ~-28 ~68 ~-30 torch
fill ~26 ~0 ~-30 ~30 ~70 ~-26 red_concrete
fill ~27 ~0 ~-29 ~29 ~70 ~-27 air
fill ~27 ~70 ~-29 ~29 ~70 ~-27 red_concrete
setblock ~27 ~71 ~-29 torch
setblock ~29 ~71 ~-27 torch
setblock ~26 ~71 ~-30 stone_brick_wall
setblock ~26 ~71 ~-26 stone_brick_wall
setblock ~28 ~71 ~-30 stone_brick_wall
setblock ~28 ~71 ~-26 stone_brick_wall
setblock ~30 ~71 ~-30 stone_brick_wall
setblock ~30 ~71 ~-26 stone_brick_wall
setblock ~26 ~71 ~-30 stone_brick_wall
setblock ~30 ~71 ~-30 stone_brick_wall
setblock ~26 ~71 ~-28 stone_brick_wall
setblock ~30 ~71 ~-28 stone_brick_wall
setblock ~26 ~71 ~-26 stone_brick_wall
setblock ~30 ~71 ~-26 stone_brick_wall
setblock ~28 ~72 ~-28 oak_fence
setblock ~28 ~73 ~-28 oak_fence
setblock ~29 ~73 ~-28 black_wool
setblock ~29 ~72 ~-28 black_wool
setblock ~28 ~70 ~-28 sea_lantern
setblock ~28 ~4 ~-30 torch
setblock ~28 ~12 ~-30 torch
setblock ~28 ~20 ~-30 torch
setblock ~28 ~28 ~-30 torch
setblock ~28 ~36 ~-30 torch
setblock ~28 ~44 ~-30 torch
setblock ~28 ~52 ~-30 torch
setblock ~28 ~60 ~-30 torch
setblock ~28 ~68 ~-30 torch
fill ~-30 ~0 ~26 ~-26 ~70 ~30 red_concrete
fill ~-29 ~0 ~27 ~-27 ~70 ~29 air
fill ~-29 ~70 ~27 ~-27 ~70 ~29 red_concrete
setblock ~-29 ~71 ~27 torch
setblock ~-27 ~71 ~29 torch
setblock ~-30 ~71 ~26 stone_brick_wall
setblock ~-30 ~71 ~30 stone_brick_wall
setblock ~-28 ~71 ~26 stone_brick_wall
setblock ~-28 ~71 ~30 stone_brick_wall
setblock ~-26 ~71 ~26 stone_brick_wall
setblock ~-26 ~71 ~30 stone_brick_wall
setblock ~-30 ~71 ~26 stone_brick_wall
setblock ~-26 ~71 ~26 stone_brick_wall
setblock ~-30 ~71 ~28 stone_brick_wall
setblock ~-26 ~71 ~28 stone_brick_wall
setblock ~-30 ~71 ~30 stone_brick_wall
setblock ~-26 ~71 ~30 stone_brick_wall
setblock ~-28 ~72 ~28 oak_fence
setblock ~-28 ~73 ~28 oak_fence
setblock ~-27 ~73 ~28 black_wool
setblock ~-27 ~72 ~28 black_wool
setblock ~-28 ~70 ~28 sea_lantern
setblock ~-28 ~4 ~26 torch
setblock ~-28 ~12 ~26 torch
setblock ~-28 ~20 ~26 torch
setblock ~-28 ~28 ~26 torch
setblock ~-28 ~36 ~26 torch
setblock ~-28 ~44 ~26 torch
setblock ~-28 ~52 ~26 torch
setblock ~-28 ~60 ~26 torch
setblock ~-28 ~68 ~26 torch
fill ~26 ~0 ~26 ~30 ~70 ~30 red_concrete
fill ~27 ~0 ~27 ~29 ~70 ~29 air
fill ~27 ~70 ~27 ~29 ~70 ~29 red_concrete
setblock ~27 ~71 ~27 torch
setblock ~29 ~71 ~29 torch
setblock ~26 ~71 ~26 stone_brick_wall
setblock ~26 ~71 ~30 stone_brick_wall
setblock ~28 ~71 ~26 stone_brick_wall
setblock ~28 ~71 ~30 stone_brick_wall
setblock ~30 ~71 ~26 stone_brick_wall
setblock ~30 ~71 ~30 stone_brick_wall
setblock ~26 ~71 ~26 stone_brick_wall
setblock ~30 ~71 ~26 stone_brick_wall
setblock ~26 ~71 ~28 stone_brick_wall
setblock ~30 ~71 ~28 stone_brick_wall
setblock ~26 ~71 ~30 stone_brick_wall
setblock ~30 ~71 ~30 stone_brick_wall
setblock ~28 ~72 ~28 oak_fence
setblock ~28 ~73 ~28 oak_fence
setblock ~29 ~73 ~28 black_wool
setblock ~29 ~72 ~28 black_wool
setblock ~28 ~70 ~28 sea_lantern
setblock ~28 ~4 ~26 torch
setblock ~28 ~12 ~26 torch
setblock ~28 ~20 ~26 torch
setblock ~28 ~28 ~26 torch
setblock ~28 ~36 ~26 torch
setblock ~28 ~44 ~26 torch
setblock ~28 ~52 ~26 torch
setblock ~28 ~60 ~26 torch
setblock ~28 ~68 ~26 torch
fill ~-1 ~18 ~-1 ~1 ~100 ~1 red_concrete
fill ~0 ~18 ~0 ~0 ~100 ~0 air
setblock ~0 ~100 ~0 sea_lantern
setblock ~0 ~101 ~0 oak_fence
setblock ~0 ~102 ~0 oak_fence
setblock ~1 ~102 ~0 black_wool
setblock ~1 ~101 ~0 black_wool
# === TROONZAAL ===
fill ~-6 ~0 ~23 ~6 ~0 ~26 red_nether_brick
fill ~-6 ~1 ~24 ~6 ~1 ~26 stone_brick_stairs
fill ~-5 ~1 ~25 ~5 ~1 ~26 red_nether_brick
fill ~-1 ~2 ~26 ~1 ~6 ~26 redstone_block
setblock ~0 ~7 ~26 redstone_block
setblock ~0 ~2 ~25 redstone_block
setblock ~0 ~3 ~25 red_carpet
setblock ~-1 ~2 ~25 redstone_block
setblock ~1 ~2 ~25 redstone_block
setblock ~-1 ~3 ~25 redstone_block
setblock ~1 ~3 ~25 redstone_block
setblock ~0 ~1 ~24 stone_brick_stairs
setblock ~-2 ~4 ~26 lantern
setblock ~2 ~4 ~26 lantern
setblock ~-2 ~3 ~25 torch
setblock ~2 ~3 ~25 torch
setblock ~0 ~8 ~26 torch
setblock ~-2 ~2 ~26 red_concrete
setblock ~2 ~2 ~26 red_concrete
# === GROTE SLAAPKAMER + LANG ROOD TAPIJT NAAR DE TROON ===
fill ~-15 ~1 ~-24 ~-5 ~4 ~-24 red_concrete
fill ~-15 ~1 ~-14 ~-5 ~4 ~-14 red_concrete
fill ~-15 ~1 ~-24 ~-15 ~4 ~-14 red_concrete
fill ~-5 ~1 ~-24 ~-5 ~4 ~-14 red_concrete
fill ~-14 ~1 ~-23 ~-6 ~1 ~-15 red_carpet
setblock ~-5 ~1 ~-19 air
setblock ~-5 ~2 ~-19 air
setblock ~-13 ~1 ~-22 red_wool
setblock ~-13 ~1 ~-21 red_wool
setblock ~-13 ~2 ~-23 dark_oak_planks
setblock ~-7 ~1 ~-22 red_wool
setblock ~-7 ~1 ~-21 red_wool
setblock ~-7 ~2 ~-23 dark_oak_planks
setblock ~-11 ~1 ~-15 bookshelf
setblock ~-10 ~1 ~-15 bookshelf
setblock ~-9 ~1 ~-15 bookshelf
setblock ~-14 ~1 ~-15 chest
setblock ~-6 ~1 ~-15 chest
setblock ~-10 ~1 ~-19 crafting_table
setblock ~-14 ~3 ~-23 lantern
setblock ~-6 ~3 ~-23 lantern
setblock ~-14 ~3 ~-15 torch
setblock ~-6 ~3 ~-15 torch
setblock ~-10 ~4 ~-19 lantern
setblock ~0 ~1 ~-19 red_carpet
setblock ~-1 ~1 ~-19 red_carpet
setblock ~1 ~1 ~-19 red_carpet
setblock ~0 ~1 ~-18 red_carpet
setblock ~-1 ~1 ~-18 red_carpet
setblock ~1 ~1 ~-18 red_carpet
setblock ~0 ~1 ~-17 red_carpet
setblock ~-1 ~1 ~-17 red_carpet
setblock ~1 ~1 ~-17 red_carpet
setblock ~0 ~1 ~-16 red_carpet
setblock ~-1 ~1 ~-16 red_carpet
setblock ~1 ~1 ~-16 red_carpet
setblock ~0 ~1 ~-15 red_carpet
setblock ~-1 ~1 ~-15 red_carpet
setblock ~1 ~1 ~-15 red_carpet
setblock ~0 ~1 ~-14 red_carpet
setblock ~-1 ~1 ~-14 red_carpet
setblock ~1 ~1 ~-14 red_carpet
setblock ~0 ~1 ~-13 red_carpet
setblock ~-1 ~1 ~-13 red_carpet
setblock ~1 ~1 ~-13 red_carpet
setblock ~0 ~1 ~-12 red_carpet
setblock ~-1 ~1 ~-12 red_carpet
setblock ~1 ~1 ~-12 red_carpet
setblock ~0 ~1 ~-11 red_carpet
setblock ~-1 ~1 ~-11 red_carpet
setblock ~1 ~1 ~-11 red_carpet
setblock ~0 ~1 ~-10 red_carpet
setblock ~-1 ~1 ~-10 red_carpet
setblock ~1 ~1 ~-10 red_carpet
setblock ~0 ~1 ~-9 red_carpet
setblock ~-1 ~1 ~-9 red_carpet
setblock ~1 ~1 ~-9 red_carpet
setblock ~0 ~1 ~-8 red_carpet
setblock ~-1 ~1 ~-8 red_carpet
setblock ~1 ~1 ~-8 red_carpet
setblock ~0 ~1 ~-7 red_carpet
setblock ~-1 ~1 ~-7 red_carpet
setblock ~1 ~1 ~-7 red_carpet
setblock ~0 ~1 ~-6 red_carpet
setblock ~-1 ~1 ~-6 red_carpet
setblock ~1 ~1 ~-6 red_carpet
setblock ~0 ~1 ~-5 red_carpet
setblock ~-1 ~1 ~-5 red_carpet
setblock ~1 ~1 ~-5 red_carpet
setblock ~0 ~1 ~-4 red_carpet
setblock ~-1 ~1 ~-4 red_carpet
setblock ~1 ~1 ~-4 red_carpet
setblock ~0 ~1 ~-3 red_carpet
setblock ~-1 ~1 ~-3 red_carpet
setblock ~1 ~1 ~-3 red_carpet
setblock ~0 ~1 ~-2 red_carpet
setblock ~-1 ~1 ~-2 red_carpet
setblock ~1 ~1 ~-2 red_carpet
setblock ~0 ~1 ~-1 red_carpet
setblock ~-1 ~1 ~-1 red_carpet
setblock ~1 ~1 ~-1 red_carpet
setblock ~0 ~1 ~0 red_carpet
setblock ~-1 ~1 ~0 red_carpet
setblock ~1 ~1 ~0 red_carpet
setblock ~0 ~1 ~1 red_carpet
setblock ~-1 ~1 ~1 red_carpet
setblock ~1 ~1 ~1 red_carpet
setblock ~0 ~1 ~2 red_carpet
setblock ~-1 ~1 ~2 red_carpet
setblock ~1 ~1 ~2 red_carpet
setblock ~0 ~1 ~3 red_carpet
setblock ~-1 ~1 ~3 red_carpet
setblock ~1 ~1 ~3 red_carpet
setblock ~0 ~1 ~4 red_carpet
setblock ~-1 ~1 ~4 red_carpet
setblock ~1 ~1 ~4 red_carpet
setblock ~0 ~1 ~5 red_carpet
setblock ~-1 ~1 ~5 red_carpet
setblock ~1 ~1 ~5 red_carpet
setblock ~0 ~1 ~6 red_carpet
setblock ~-1 ~1 ~6 red_carpet
setblock ~1 ~1 ~6 red_carpet
setblock ~0 ~1 ~7 red_carpet
setblock ~-1 ~1 ~7 red_carpet
setblock ~1 ~1 ~7 red_carpet
setblock ~0 ~1 ~8 red_carpet
setblock ~-1 ~1 ~8 red_carpet
setblock ~1 ~1 ~8 red_carpet
setblock ~0 ~1 ~9 red_carpet
setblock ~-1 ~1 ~9 red_carpet
setblock ~1 ~1 ~9 red_carpet
setblock ~0 ~1 ~10 red_carpet
setblock ~-1 ~1 ~10 red_carpet
setblock ~1 ~1 ~10 red_carpet
setblock ~0 ~1 ~11 red_carpet
setblock ~-1 ~1 ~11 red_carpet
setblock ~1 ~1 ~11 red_carpet
setblock ~0 ~1 ~12 red_carpet
setblock ~-1 ~1 ~12 red_carpet
setblock ~1 ~1 ~12 red_carpet
setblock ~0 ~1 ~13 red_carpet
setblock ~-1 ~1 ~13 red_carpet
setblock ~1 ~1 ~13 red_carpet
setblock ~0 ~1 ~14 red_carpet
setblock ~-1 ~1 ~14 red_carpet
setblock ~1 ~1 ~14 red_carpet
setblock ~0 ~1 ~15 red_carpet
setblock ~-1 ~1 ~15 red_carpet
setblock ~1 ~1 ~15 red_carpet
setblock ~0 ~1 ~16 red_carpet
setblock ~-1 ~1 ~16 red_carpet
setblock ~1 ~1 ~16 red_carpet
setblock ~0 ~1 ~17 red_carpet
setblock ~-1 ~1 ~17 red_carpet
setblock ~1 ~1 ~17 red_carpet
setblock ~0 ~1 ~18 red_carpet
setblock ~-1 ~1 ~18 red_carpet
setblock ~1 ~1 ~18 red_carpet
setblock ~0 ~1 ~19 red_carpet
setblock ~-1 ~1 ~19 red_carpet
setblock ~1 ~1 ~19 red_carpet
setblock ~0 ~1 ~20 red_carpet
setblock ~-1 ~1 ~20 red_carpet
setblock ~1 ~1 ~20 red_carpet
setblock ~0 ~1 ~21 red_carpet
setblock ~-1 ~1 ~21 red_carpet
setblock ~1 ~1 ~21 red_carpet
setblock ~0 ~1 ~22 red_carpet
setblock ~-1 ~1 ~22 red_carpet
setblock ~1 ~1 ~22 red_carpet
setblock ~0 ~1 ~23 red_carpet
setblock ~-1 ~1 ~23 red_carpet
setblock ~1 ~1 ~23 red_carpet
setblock ~0 ~1 ~24 red_carpet
setblock ~-1 ~1 ~24 red_carpet
setblock ~1 ~1 ~24 red_carpet
setblock ~-5 ~1 ~-19 red_carpet
setblock ~-5 ~1 ~-18 red_carpet
setblock ~-4 ~1 ~-19 red_carpet
setblock ~-4 ~1 ~-18 red_carpet
setblock ~-3 ~1 ~-19 red_carpet
setblock ~-3 ~1 ~-18 red_carpet
setblock ~-2 ~1 ~-19 red_carpet
setblock ~-2 ~1 ~-18 red_carpet
setblock ~-1 ~1 ~-19 red_carpet
setblock ~-1 ~1 ~-18 red_carpet
setblock ~0 ~1 ~-19 red_carpet
setblock ~0 ~1 ~-18 red_carpet
setblock ~1 ~1 ~-19 red_carpet
setblock ~1 ~1 ~-18 red_carpet
setblock ~-3 ~3 ~-19 torch
setblock ~3 ~3 ~-19 torch
setblock ~-3 ~3 ~-14 torch
setblock ~3 ~3 ~-14 torch
setblock ~-3 ~3 ~-9 torch
setblock ~3 ~3 ~-9 torch
setblock ~-3 ~3 ~-4 torch
setblock ~3 ~3 ~-4 torch
setblock ~-3 ~3 ~1 torch
setblock ~3 ~3 ~1 torch
setblock ~-3 ~3 ~6 torch
setblock ~3 ~3 ~6 torch
setblock ~-3 ~3 ~11 torch
setblock ~3 ~3 ~11 torch
setblock ~-3 ~3 ~16 torch
setblock ~3 ~3 ~16 torch
setblock ~-3 ~3 ~21 torch
setblock ~3 ~3 ~21 torch
# === GROTE KEUKEN (achter-rechts) ===
fill ~6 ~1 ~13 ~16 ~4 ~13 red_concrete
fill ~6 ~1 ~23 ~16 ~4 ~23 red_concrete
fill ~6 ~1 ~13 ~6 ~4 ~23 red_concrete
fill ~16 ~1 ~13 ~16 ~4 ~23 red_concrete
setblock ~6 ~1 ~18 air
setblock ~6 ~2 ~18 air
setblock ~7 ~1 ~14 furnace
setblock ~8 ~1 ~14 smoker
setblock ~9 ~1 ~14 furnace
setblock ~10 ~1 ~14 smoker
setblock ~11 ~1 ~14 furnace
setblock ~12 ~1 ~14 smoker
setblock ~13 ~1 ~14 furnace
setblock ~14 ~1 ~14 smoker
setblock ~15 ~1 ~14 furnace
setblock ~7 ~1 ~16 crafting_table
setblock ~9 ~1 ~16 crafting_table
setblock ~11 ~1 ~16 crafting_table
setblock ~13 ~1 ~16 crafting_table
setblock ~15 ~1 ~16 crafting_table
setblock ~8 ~1 ~18 cauldron
setblock ~10 ~1 ~18 cauldron
setblock ~12 ~1 ~18 barrel
setblock ~14 ~1 ~18 barrel
setblock ~11 ~1 ~16 cake
setblock ~15 ~1 ~22 chest
setblock ~7 ~1 ~22 chest
setblock ~11 ~1 ~20 campfire
setblock ~10 ~1 ~20 cauldron
setblock ~12 ~1 ~20 cauldron
setblock ~7 ~3 ~14 lantern
setblock ~15 ~3 ~14 lantern
setblock ~11 ~4 ~18 lantern
setblock ~7 ~3 ~22 torch
setblock ~15 ~3 ~22 torch
# === MIDDEN-VERDIEPING: EETKAMER + WERKPLAATS ===
setblock ~-5 ~7 ~0 dark_oak_slab
setblock ~-4 ~7 ~0 dark_oak_slab
setblock ~-3 ~7 ~0 dark_oak_slab
setblock ~-2 ~7 ~0 dark_oak_slab
setblock ~-1 ~7 ~0 dark_oak_slab
setblock ~0 ~7 ~0 dark_oak_slab
setblock ~1 ~7 ~0 dark_oak_slab
setblock ~2 ~7 ~0 dark_oak_slab
setblock ~3 ~7 ~0 dark_oak_slab
setblock ~4 ~7 ~0 dark_oak_slab
setblock ~5 ~7 ~0 dark_oak_slab
setblock ~-5 ~7 ~-1 dark_oak_stairs
setblock ~-5 ~7 ~1 dark_oak_stairs
setblock ~-3 ~7 ~-1 dark_oak_stairs
setblock ~-3 ~7 ~1 dark_oak_stairs
setblock ~-1 ~7 ~-1 dark_oak_stairs
setblock ~-1 ~7 ~1 dark_oak_stairs
setblock ~1 ~7 ~-1 dark_oak_stairs
setblock ~1 ~7 ~1 dark_oak_stairs
setblock ~3 ~7 ~-1 dark_oak_stairs
setblock ~3 ~7 ~1 dark_oak_stairs
setblock ~5 ~7 ~-1 dark_oak_stairs
setblock ~5 ~7 ~1 dark_oak_stairs
setblock ~0 ~8 ~0 soul_lantern
setblock ~22 ~7 ~22 crafting_table
setblock ~21 ~7 ~22 anvil
setblock ~23 ~7 ~22 grindstone
setblock ~22 ~7 ~21 brewing_stand
setblock ~21 ~7 ~21 cartography_table
setblock ~23 ~7 ~21 redstone_block
setblock ~22 ~7 ~20 lectern
# === BOVENSTE VERDIEPING: EXTRA SLAAPKAMERS ===
setblock ~-23 ~13 ~-23 red_wool
setblock ~-23 ~13 ~-22 red_wool
setblock ~-23 ~16 ~-23 soul_lantern
setblock ~23 ~13 ~-23 red_wool
setblock ~23 ~13 ~-22 red_wool
setblock ~23 ~16 ~-23 soul_lantern
setblock ~-23 ~13 ~23 red_wool
setblock ~-23 ~13 ~24 red_wool
setblock ~-23 ~16 ~23 soul_lantern
setblock ~23 ~13 ~23 red_wool
setblock ~23 ~13 ~24 red_wool
setblock ~23 ~16 ~23 soul_lantern
# === KELDER ===
fill ~-10 ~-8 ~-10 ~10 ~-3 ~10 air
fill ~-11 ~-9 ~-11 ~11 ~-9 ~11 netherrack
fill ~-11 ~-8 ~-11 ~11 ~-3 ~-11 netherrack
fill ~-11 ~-8 ~11 ~11 ~-3 ~11 netherrack
fill ~-11 ~-8 ~-11 ~-11 ~-3 ~11 netherrack
fill ~11 ~-8 ~-11 ~11 ~-3 ~11 netherrack
fill ~-11 ~-2 ~-11 ~11 ~-2 ~11 red_concrete
setblock ~24 ~0 ~-24 stone_brick_stairs
setblock ~24 ~1 ~-24 air
setblock ~24 ~2 ~-24 air
setblock ~24 ~-1 ~-23 stone_brick_stairs
setblock ~24 ~0 ~-23 air
setblock ~24 ~1 ~-23 air
setblock ~24 ~-2 ~-22 stone_brick_stairs
setblock ~24 ~-1 ~-22 air
setblock ~24 ~0 ~-22 air
setblock ~24 ~-3 ~-21 stone_brick_stairs
setblock ~24 ~-2 ~-21 air
setblock ~24 ~-1 ~-21 air
setblock ~24 ~-4 ~-20 stone_brick_stairs
setblock ~24 ~-3 ~-20 air
setblock ~24 ~-2 ~-20 air
setblock ~24 ~-5 ~-19 stone_brick_stairs
setblock ~24 ~-4 ~-19 air
setblock ~24 ~-3 ~-19 air
setblock ~24 ~-6 ~-18 stone_brick_stairs
setblock ~24 ~-5 ~-18 air
setblock ~24 ~-4 ~-18 air
setblock ~24 ~-7 ~-17 stone_brick_stairs
setblock ~24 ~-6 ~-17 air
setblock ~24 ~-5 ~-17 air
setblock ~24 ~-8 ~-16 stone_brick_stairs
setblock ~24 ~-7 ~-16 air
setblock ~24 ~-6 ~-16 air
setblock ~-8 ~-7 ~-8 barrel
setblock ~-8 ~-7 ~0 barrel
setblock ~-8 ~-7 ~8 barrel
setblock ~-4 ~-7 ~-8 barrel
setblock ~-4 ~-7 ~0 barrel
setblock ~-4 ~-7 ~8 barrel
setblock ~0 ~-7 ~-8 barrel
setblock ~0 ~-7 ~0 barrel
setblock ~0 ~-7 ~8 barrel
setblock ~4 ~-7 ~-8 barrel
setblock ~4 ~-7 ~0 barrel
setblock ~4 ~-7 ~8 barrel
setblock ~8 ~-7 ~-8 barrel
setblock ~8 ~-7 ~0 barrel
setblock ~8 ~-7 ~8 barrel
setblock ~-6 ~-7 ~-6 chest
setblock ~6 ~-7 ~6 chest
setblock ~-9 ~-4 ~-9 torch
setblock ~-9 ~-4 ~0 torch
setblock ~-9 ~-4 ~9 torch
setblock ~0 ~-4 ~-9 torch
setblock ~0 ~-4 ~0 torch
setblock ~0 ~-4 ~9 torch
setblock ~9 ~-4 ~-9 torch
setblock ~9 ~-4 ~0 torch
setblock ~9 ~-4 ~9 torch
scoreboard players set rmRood rm_state 1
