# ==========================================================
# RIDDER MOD - VIJANDIGE AANVALSGOLF (relatief t.o.v. het anker)
# Wordt aangeroepen met "execute at @e[type=ridder_mod:kasteel_anker]"
# De vijand verschijnt op het SPAWN-PLATFORM net buiten de noordpoort
# (op grondniveau) en stormt dan naar binnen. Jouw ridders verdedigen.
# ==========================================================

# --- Zwaardvechters (voorhoede, voorste rij van het platform) ---
summon ridder_mod:vijand_ridder ~-12 ~ ~-108
summon ridder_mod:vijand_ridder ~-6 ~ ~-108
summon ridder_mod:vijand_ridder ~0 ~ ~-108
summon ridder_mod:vijand_ridder ~6 ~ ~-108
summon ridder_mod:vijand_ridder ~12 ~ ~-108

# --- Boogschutters (middelste rij) ---
summon ridder_mod:vijand_boog ~-10 ~ ~-114
summon ridder_mod:vijand_boog ~-4 ~ ~-114
summon ridder_mod:vijand_boog ~4 ~ ~-114
summon ridder_mod:vijand_boog ~10 ~ ~-114

# --- Kanonniers (achterste rij) ---
summon ridder_mod:vijand_kanon ~-6 ~ ~-119
summon ridder_mod:vijand_kanon ~6 ~ ~-119

title @a title §c§lDE VIJAND VALT AAN!
title @a subtitle §eZwaarden, bogen en kanonnen!
playsound mob.wither.spawn @a
tellraw @a {"rawtext":[{"text":"§c⚔ §lHet vijandige leger verschijnt op het platform bij de noordpoort en bestormt je kasteel!"}]}
