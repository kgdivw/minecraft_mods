# ==========================================================
# RIDDER MOD - VIJANDIGE AANVALSGOLF (epische veldslag!)
# Spawnt een gemengd vijandig leger (zwaardvechters,
# boogschutters en kanonniers) ten noorden van ONZE
# binnenplaats. Ze stormen op het kasteel af; jouw ridders
# verdedigen je. Kan meerdere keren gebruikt worden.
# Gebruik: /function vijand_leger
# ==========================================================

# --- Zwaardvechters (voorhoede) ---
summon ridder_mod:vijand_ridder 1988 80 1944
summon ridder_mod:vijand_ridder 1994 80 1944
summon ridder_mod:vijand_ridder 2000 80 1944
summon ridder_mod:vijand_ridder 2006 80 1944
summon ridder_mod:vijand_ridder 2012 80 1944

# --- Boogschutters ---
summon ridder_mod:vijand_boog 1990 80 1938
summon ridder_mod:vijand_boog 1996 80 1938
summon ridder_mod:vijand_boog 2004 80 1938
summon ridder_mod:vijand_boog 2010 80 1938

# --- Kanonniers ---
summon ridder_mod:vijand_kanon 1994 80 1932
summon ridder_mod:vijand_kanon 2006 80 1932

title @a title §c§lVIJANDIG LEGER!
title @a subtitle §eZwaarden, bogen en kanonnen vallen aan!
playsound mob.wither.spawn @a
tellraw @a {"rawtext":[{"text":"§c⚔ §lEen vijandig leger nadert! Boogschutters en kanonniers erbij - je ridders verdedigen het kasteel!"}]}
