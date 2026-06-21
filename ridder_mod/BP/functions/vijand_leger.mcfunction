# ==========================================================
# RIDDER MOD - VIJANDIGE AANVALSGOLF (epische veldslag!)
# Spawnt een gemengd vijandig leger (zwaardvechters,
# boogschutters en kanonniers) bij de NOORDPOORT van onze
# binnenplaats. Ze stormen op het kasteel af; jouw ridders
# verdedigen je. Draait automatisch 1 minuut na je keuze,
# en kan ook met de hand opgeroepen worden.
# Gebruik: /function vijand_leger
# ==========================================================

# --- Zwaardvechters (voorhoede) ---
summon ridder_mod:vijand_ridder 1988 80 1908
summon ridder_mod:vijand_ridder 1994 80 1908
summon ridder_mod:vijand_ridder 2000 80 1908
summon ridder_mod:vijand_ridder 2006 80 1908
summon ridder_mod:vijand_ridder 2012 80 1908

# --- Boogschutters ---
summon ridder_mod:vijand_boog 1990 80 1914
summon ridder_mod:vijand_boog 1996 80 1914
summon ridder_mod:vijand_boog 2004 80 1914
summon ridder_mod:vijand_boog 2010 80 1914

# --- Kanonniers ---
summon ridder_mod:vijand_kanon 1994 80 1920
summon ridder_mod:vijand_kanon 2006 80 1920

title @a title §c§lDE VIJAND VALT AAN!
title @a subtitle §eZwaarden, bogen en kanonnen!
playsound mob.wither.spawn @a
tellraw @a {"rawtext":[{"text":"§c⚔ §lHet vijandige leger bestormt het kasteel! Verdedig je met je ridders!"}]}
