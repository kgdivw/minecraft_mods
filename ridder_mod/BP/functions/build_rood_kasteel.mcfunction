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
setblock ~-4 ~4 ~100 glowstone
setblock ~4 ~4 ~100 glowstone
setblock ~-94 ~4 ~-100 glowstone
setblock ~-94 ~4 ~100 glowstone
setblock ~-82 ~4 ~-100 glowstone
setblock ~-82 ~4 ~100 glowstone
setblock ~-70 ~4 ~-100 glowstone
setblock ~-70 ~4 ~100 glowstone
setblock ~-58 ~4 ~-100 glowstone
setblock ~-58 ~4 ~100 glowstone
setblock ~-46 ~4 ~-100 glowstone
setblock ~-46 ~4 ~100 glowstone
setblock ~-34 ~4 ~-100 glowstone
setblock ~-34 ~4 ~100 glowstone
setblock ~-22 ~4 ~-100 glowstone
setblock ~-22 ~4 ~100 glowstone
setblock ~-10 ~4 ~-100 glowstone
setblock ~-10 ~4 ~100 glowstone
setblock ~2 ~4 ~-100 glowstone
setblock ~2 ~4 ~100 glowstone
setblock ~14 ~4 ~-100 glowstone
setblock ~14 ~4 ~100 glowstone
setblock ~26 ~4 ~-100 glowstone
setblock ~26 ~4 ~100 glowstone
setblock ~38 ~4 ~-100 glowstone
setblock ~38 ~4 ~100 glowstone
setblock ~50 ~4 ~-100 glowstone
setblock ~50 ~4 ~100 glowstone
setblock ~62 ~4 ~-100 glowstone
setblock ~62 ~4 ~100 glowstone
setblock ~74 ~4 ~-100 glowstone
setblock ~74 ~4 ~100 glowstone
setblock ~86 ~4 ~-100 glowstone
setblock ~86 ~4 ~100 glowstone
setblock ~-100 ~4 ~-94 glowstone
setblock ~100 ~4 ~-94 glowstone
setblock ~-100 ~4 ~-82 glowstone
setblock ~100 ~4 ~-82 glowstone
setblock ~-100 ~4 ~-70 glowstone
setblock ~100 ~4 ~-70 glowstone
setblock ~-100 ~4 ~-58 glowstone
setblock ~100 ~4 ~-58 glowstone
setblock ~-100 ~4 ~-46 glowstone
setblock ~100 ~4 ~-46 glowstone
setblock ~-100 ~4 ~-34 glowstone
setblock ~100 ~4 ~-34 glowstone
setblock ~-100 ~4 ~-22 glowstone
setblock ~100 ~4 ~-22 glowstone
setblock ~-100 ~4 ~-10 glowstone
setblock ~100 ~4 ~-10 glowstone
setblock ~-100 ~4 ~2 glowstone
setblock ~100 ~4 ~2 glowstone
setblock ~-100 ~4 ~14 glowstone
setblock ~100 ~4 ~14 glowstone
setblock ~-100 ~4 ~26 glowstone
setblock ~100 ~4 ~26 glowstone
setblock ~-100 ~4 ~38 glowstone
setblock ~100 ~4 ~38 glowstone
setblock ~-100 ~4 ~50 glowstone
setblock ~100 ~4 ~50 glowstone
setblock ~-100 ~4 ~62 glowstone
setblock ~100 ~4 ~62 glowstone
setblock ~-100 ~4 ~74 glowstone
setblock ~100 ~4 ~74 glowstone
setblock ~-100 ~4 ~86 glowstone
setblock ~100 ~4 ~86 glowstone
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
setblock ~-3 ~4 ~28 glowstone
setblock ~3 ~4 ~28 glowstone
setblock ~-25 ~3 ~-28 glowstone
setblock ~-25 ~3 ~28 glowstone
setblock ~-19 ~3 ~-28 glowstone
setblock ~-19 ~3 ~28 glowstone
setblock ~-13 ~3 ~-28 glowstone
setblock ~-13 ~3 ~28 glowstone
setblock ~-7 ~3 ~-28 glowstone
setblock ~-7 ~3 ~28 glowstone
setblock ~-1 ~3 ~-28 glowstone
setblock ~-1 ~3 ~28 glowstone
setblock ~5 ~3 ~-28 glowstone
setblock ~5 ~3 ~28 glowstone
setblock ~11 ~3 ~-28 glowstone
setblock ~11 ~3 ~28 glowstone
setblock ~17 ~3 ~-28 glowstone
setblock ~17 ~3 ~28 glowstone
setblock ~23 ~3 ~-28 glowstone
setblock ~23 ~3 ~28 glowstone
setblock ~-28 ~3 ~-25 glowstone
setblock ~28 ~3 ~-25 glowstone
setblock ~-28 ~3 ~-19 glowstone
setblock ~28 ~3 ~-19 glowstone
setblock ~-28 ~3 ~-13 glowstone
setblock ~28 ~3 ~-13 glowstone
setblock ~-28 ~3 ~-7 glowstone
setblock ~28 ~3 ~-7 glowstone
setblock ~-28 ~3 ~-1 glowstone
setblock ~28 ~3 ~-1 glowstone
setblock ~-28 ~3 ~5 glowstone
setblock ~28 ~3 ~5 glowstone
setblock ~-28 ~3 ~11 glowstone
setblock ~28 ~3 ~11 glowstone
setblock ~-28 ~3 ~17 glowstone
setblock ~28 ~3 ~17 glowstone
setblock ~-28 ~3 ~23 glowstone
setblock ~28 ~3 ~23 glowstone
setblock ~-25 ~9 ~-28 glowstone
setblock ~-25 ~9 ~28 glowstone
setblock ~-19 ~9 ~-28 glowstone
setblock ~-19 ~9 ~28 glowstone
setblock ~-13 ~9 ~-28 glowstone
setblock ~-13 ~9 ~28 glowstone
setblock ~-7 ~9 ~-28 glowstone
setblock ~-7 ~9 ~28 glowstone
setblock ~-1 ~9 ~-28 glowstone
setblock ~-1 ~9 ~28 glowstone
setblock ~5 ~9 ~-28 glowstone
setblock ~5 ~9 ~28 glowstone
setblock ~11 ~9 ~-28 glowstone
setblock ~11 ~9 ~28 glowstone
setblock ~17 ~9 ~-28 glowstone
setblock ~17 ~9 ~28 glowstone
setblock ~23 ~9 ~-28 glowstone
setblock ~23 ~9 ~28 glowstone
setblock ~-28 ~9 ~-25 glowstone
setblock ~28 ~9 ~-25 glowstone
setblock ~-28 ~9 ~-19 glowstone
setblock ~28 ~9 ~-19 glowstone
setblock ~-28 ~9 ~-13 glowstone
setblock ~28 ~9 ~-13 glowstone
setblock ~-28 ~9 ~-7 glowstone
setblock ~28 ~9 ~-7 glowstone
setblock ~-28 ~9 ~-1 glowstone
setblock ~28 ~9 ~-1 glowstone
setblock ~-28 ~9 ~5 glowstone
setblock ~28 ~9 ~5 glowstone
setblock ~-28 ~9 ~11 glowstone
setblock ~28 ~9 ~11 glowstone
setblock ~-28 ~9 ~17 glowstone
setblock ~28 ~9 ~17 glowstone
setblock ~-28 ~9 ~23 glowstone
setblock ~28 ~9 ~23 glowstone
setblock ~-25 ~15 ~-28 glowstone
setblock ~-25 ~15 ~28 glowstone
setblock ~-19 ~15 ~-28 glowstone
setblock ~-19 ~15 ~28 glowstone
setblock ~-13 ~15 ~-28 glowstone
setblock ~-13 ~15 ~28 glowstone
setblock ~-7 ~15 ~-28 glowstone
setblock ~-7 ~15 ~28 glowstone
setblock ~-1 ~15 ~-28 glowstone
setblock ~-1 ~15 ~28 glowstone
setblock ~5 ~15 ~-28 glowstone
setblock ~5 ~15 ~28 glowstone
setblock ~11 ~15 ~-28 glowstone
setblock ~11 ~15 ~28 glowstone
setblock ~17 ~15 ~-28 glowstone
setblock ~17 ~15 ~28 glowstone
setblock ~23 ~15 ~-28 glowstone
setblock ~23 ~15 ~28 glowstone
setblock ~-28 ~15 ~-25 glowstone
setblock ~28 ~15 ~-25 glowstone
setblock ~-28 ~15 ~-19 glowstone
setblock ~28 ~15 ~-19 glowstone
setblock ~-28 ~15 ~-13 glowstone
setblock ~28 ~15 ~-13 glowstone
setblock ~-28 ~15 ~-7 glowstone
setblock ~28 ~15 ~-7 glowstone
setblock ~-28 ~15 ~-1 glowstone
setblock ~28 ~15 ~-1 glowstone
setblock ~-28 ~15 ~5 glowstone
setblock ~28 ~15 ~5 glowstone
setblock ~-28 ~15 ~11 glowstone
setblock ~28 ~15 ~11 glowstone
setblock ~-28 ~15 ~17 glowstone
setblock ~28 ~15 ~17 glowstone
setblock ~-28 ~15 ~23 glowstone
setblock ~28 ~15 ~23 glowstone
setblock ~-12 ~5 ~-12 glowstone
setblock ~-12 ~5 ~0 glowstone
setblock ~-12 ~5 ~12 glowstone
setblock ~0 ~5 ~-12 glowstone
setblock ~0 ~5 ~0 glowstone
setblock ~0 ~5 ~12 glowstone
setblock ~12 ~5 ~-12 glowstone
setblock ~12 ~5 ~0 glowstone
setblock ~12 ~5 ~12 glowstone
setblock ~-12 ~11 ~-12 glowstone
setblock ~-12 ~11 ~0 glowstone
setblock ~-12 ~11 ~12 glowstone
setblock ~0 ~11 ~-12 glowstone
setblock ~0 ~11 ~0 glowstone
setblock ~0 ~11 ~12 glowstone
setblock ~12 ~11 ~-12 glowstone
setblock ~12 ~11 ~0 glowstone
setblock ~12 ~11 ~12 glowstone
setblock ~-12 ~18 ~-12 glowstone
setblock ~-12 ~18 ~0 glowstone
setblock ~-12 ~18 ~12 glowstone
setblock ~0 ~18 ~-12 glowstone
setblock ~0 ~18 ~0 glowstone
setblock ~0 ~18 ~12 glowstone
setblock ~12 ~18 ~-12 glowstone
setblock ~12 ~18 ~0 glowstone
setblock ~12 ~18 ~12 glowstone
setblock ~-22 ~1 ~-22 oak_fence
setblock ~-22 ~2 ~-22 oak_fence
setblock ~-22 ~3 ~-22 glowstone
setblock ~-22 ~1 ~0 oak_fence
setblock ~-22 ~2 ~0 oak_fence
setblock ~-22 ~3 ~0 glowstone
setblock ~-22 ~1 ~22 oak_fence
setblock ~-22 ~2 ~22 oak_fence
setblock ~-22 ~3 ~22 glowstone
setblock ~0 ~1 ~-22 oak_fence
setblock ~0 ~2 ~-22 oak_fence
setblock ~0 ~3 ~-22 glowstone
setblock ~0 ~1 ~0 oak_fence
setblock ~0 ~2 ~0 oak_fence
setblock ~0 ~3 ~0 glowstone
setblock ~0 ~1 ~22 oak_fence
setblock ~0 ~2 ~22 oak_fence
setblock ~0 ~3 ~22 glowstone
setblock ~22 ~1 ~-22 oak_fence
setblock ~22 ~2 ~-22 oak_fence
setblock ~22 ~3 ~-22 glowstone
setblock ~22 ~1 ~0 oak_fence
setblock ~22 ~2 ~0 oak_fence
setblock ~22 ~3 ~0 glowstone
setblock ~22 ~1 ~22 oak_fence
setblock ~22 ~2 ~22 oak_fence
setblock ~22 ~3 ~22 glowstone
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
setblock ~-29 ~70 ~-29 glowstone
setblock ~-27 ~70 ~-27 glowstone
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
setblock ~-28 ~6 ~-30 glowstone
setblock ~-28 ~16 ~-30 glowstone
setblock ~-28 ~26 ~-30 glowstone
setblock ~-28 ~36 ~-30 glowstone
setblock ~-28 ~46 ~-30 glowstone
setblock ~-28 ~56 ~-30 glowstone
setblock ~-28 ~66 ~-30 glowstone
fill ~26 ~0 ~-30 ~30 ~70 ~-26 red_concrete
fill ~27 ~0 ~-29 ~29 ~70 ~-27 air
fill ~27 ~70 ~-29 ~29 ~70 ~-27 red_concrete
setblock ~27 ~70 ~-29 glowstone
setblock ~29 ~70 ~-27 glowstone
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
setblock ~28 ~6 ~-30 glowstone
setblock ~28 ~16 ~-30 glowstone
setblock ~28 ~26 ~-30 glowstone
setblock ~28 ~36 ~-30 glowstone
setblock ~28 ~46 ~-30 glowstone
setblock ~28 ~56 ~-30 glowstone
setblock ~28 ~66 ~-30 glowstone
fill ~-30 ~0 ~26 ~-26 ~70 ~30 red_concrete
fill ~-29 ~0 ~27 ~-27 ~70 ~29 air
fill ~-29 ~70 ~27 ~-27 ~70 ~29 red_concrete
setblock ~-29 ~70 ~27 glowstone
setblock ~-27 ~70 ~29 glowstone
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
setblock ~-28 ~6 ~26 glowstone
setblock ~-28 ~16 ~26 glowstone
setblock ~-28 ~26 ~26 glowstone
setblock ~-28 ~36 ~26 glowstone
setblock ~-28 ~46 ~26 glowstone
setblock ~-28 ~56 ~26 glowstone
setblock ~-28 ~66 ~26 glowstone
fill ~26 ~0 ~26 ~30 ~70 ~30 red_concrete
fill ~27 ~0 ~27 ~29 ~70 ~29 air
fill ~27 ~70 ~27 ~29 ~70 ~29 red_concrete
setblock ~27 ~70 ~27 glowstone
setblock ~29 ~70 ~29 glowstone
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
setblock ~28 ~6 ~26 glowstone
setblock ~28 ~16 ~26 glowstone
setblock ~28 ~26 ~26 glowstone
setblock ~28 ~36 ~26 glowstone
setblock ~28 ~46 ~26 glowstone
setblock ~28 ~56 ~26 glowstone
setblock ~28 ~66 ~26 glowstone
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
setblock ~-1 ~6 ~26 glowstone
setblock ~1 ~6 ~26 glowstone
setblock ~0 ~8 ~26 glowstone
setblock ~-2 ~2 ~25 glowstone
setblock ~2 ~2 ~25 glowstone
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
setblock ~-15 ~3 ~-23 glowstone
setblock ~-5 ~3 ~-23 glowstone
setblock ~-15 ~3 ~-15 glowstone
setblock ~-5 ~3 ~-15 glowstone
setblock ~-10 ~5 ~-19 glowstone
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
setblock ~-3 ~0 ~-17 glowstone
setblock ~3 ~0 ~-17 glowstone
setblock ~-3 ~0 ~-11 glowstone
setblock ~3 ~0 ~-11 glowstone
setblock ~-3 ~0 ~-5 glowstone
setblock ~3 ~0 ~-5 glowstone
setblock ~-3 ~0 ~1 glowstone
setblock ~3 ~0 ~1 glowstone
setblock ~-3 ~0 ~7 glowstone
setblock ~3 ~0 ~7 glowstone
setblock ~-3 ~0 ~13 glowstone
setblock ~3 ~0 ~13 glowstone
setblock ~-3 ~0 ~19 glowstone
setblock ~3 ~0 ~19 glowstone
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
setblock ~6 ~3 ~14 glowstone
setblock ~16 ~3 ~14 glowstone
setblock ~6 ~3 ~22 glowstone
setblock ~16 ~3 ~22 glowstone
setblock ~11 ~5 ~18 glowstone
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
setblock ~0 ~11 ~0 glowstone
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
setblock ~-23 ~18 ~-23 glowstone
setblock ~23 ~13 ~-23 red_wool
setblock ~23 ~13 ~-22 red_wool
setblock ~23 ~18 ~-23 glowstone
setblock ~-23 ~13 ~23 red_wool
setblock ~-23 ~13 ~24 red_wool
setblock ~-23 ~18 ~23 glowstone
setblock ~23 ~13 ~23 red_wool
setblock ~23 ~13 ~24 red_wool
setblock ~23 ~18 ~23 glowstone
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
setblock ~-8 ~-2 ~-8 glowstone
setblock ~-8 ~-2 ~0 glowstone
setblock ~-8 ~-2 ~8 glowstone
setblock ~0 ~-2 ~-8 glowstone
setblock ~0 ~-2 ~0 glowstone
setblock ~0 ~-2 ~8 glowstone
setblock ~8 ~-2 ~-8 glowstone
setblock ~8 ~-2 ~0 glowstone
setblock ~8 ~-2 ~8 glowstone
scoreboard players set rmRood rm_state 1
