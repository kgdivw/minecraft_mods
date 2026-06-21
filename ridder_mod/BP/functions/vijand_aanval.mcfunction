# ==========================================================
# RIDDER MOD - VIJANDIGE AANVALSGOLF (relatief t.o.v. het anker)
# Wordt aangeroepen met "execute at @e[type=ridder_mod:kasteel_anker]"
# zodat de vijand bij de NOORDPOORT van JOUW kasteel verschijnt en
# naar binnen stormt. Jouw ridders verdedigen je.
# ==========================================================

# --- Zwaardvechters (voorhoede) ---
summon ridder_mod:vijand_ridder ~-12 ~ ~-90
summon ridder_mod:vijand_ridder ~-6 ~ ~-90
summon ridder_mod:vijand_ridder ~0 ~ ~-90
summon ridder_mod:vijand_ridder ~6 ~ ~-90
summon ridder_mod:vijand_ridder ~12 ~ ~-90

# --- Boogschutters ---
summon ridder_mod:vijand_boog ~-10 ~ ~-84
summon ridder_mod:vijand_boog ~-4 ~ ~-84
summon ridder_mod:vijand_boog ~4 ~ ~-84
summon ridder_mod:vijand_boog ~10 ~ ~-84

# --- Kanonniers ---
summon ridder_mod:vijand_kanon ~-6 ~ ~-78
summon ridder_mod:vijand_kanon ~6 ~ ~-78

title @a title §c§lDE VIJAND VALT AAN!
title @a subtitle §eZwaarden, bogen en kanonnen!
playsound mob.wither.spawn @a
tellraw @a {"rawtext":[{"text":"§c⚔ §lHet vijandige leger bestormt je kasteel! Verdedig je met je ridders!"}]}
