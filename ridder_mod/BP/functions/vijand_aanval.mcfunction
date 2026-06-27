# ==========================================================
# RIDDER MOD - VIJANDIGE AANVALSGOLF (relatief t.o.v. het anker)
# Wordt aangeroepen met "execute at @e[type=ridder_mod:kasteel_anker]"
# De vijand verschijnt op het SPAWN-PLATFORM net buiten de noordpoort
# (op grondniveau) en stormt dan naar binnen. Jouw ridders verdedigen.
# ==========================================================

# --- Zwaardvechters (voorhoede, op het spawn-platform bij de noordmuur) ---
summon ridder_mod:vijand_ridder ~-12 ~1 ~-86
summon ridder_mod:vijand_ridder ~-6 ~1 ~-86
summon ridder_mod:vijand_ridder ~0 ~1 ~-86
summon ridder_mod:vijand_ridder ~6 ~1 ~-86
summon ridder_mod:vijand_ridder ~12 ~1 ~-86

# --- Boogschutters (middelste rij) ---
summon ridder_mod:vijand_boog ~-10 ~1 ~-90
summon ridder_mod:vijand_boog ~-4 ~1 ~-90
summon ridder_mod:vijand_boog ~4 ~1 ~-90
summon ridder_mod:vijand_boog ~10 ~1 ~-90

# --- Kanonniers (achterste rij) ---
summon ridder_mod:vijand_kanon ~-6 ~1 ~-94
summon ridder_mod:vijand_kanon ~6 ~1 ~-94

title @a title §c§lDE VIJAND VALT AAN!
title @a subtitle §eZwaarden, bogen en kanonnen!
playsound mob.wither.spawn @a
tellraw @a {"rawtext":[{"text":"§c⚔ §lHet vijandige leger verschijnt op het platform bij de noordpoort en bestormt je kasteel!"}]}
