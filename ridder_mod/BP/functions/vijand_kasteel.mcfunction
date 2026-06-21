# ==========================================================
# RIDDER MOD - BEZETTING VAN HET RODE KASTEEL
# Spawnt de vijandige koning + zijn garnizoen bij het rode
# kasteel (midden 2000,80,1700, WALL=28). 1x per wereld.
# ==========================================================

# --- De vijandige KONING op zijn rode troon (kijkt naar ons kasteel) ---
summon ridder_mod:vijand_koning 2000 81 1721 0 0

# --- Zwaardvechters (voorste linie, zuidkant, kijken naar ons kasteel) ---
summon ridder_mod:vijand_ridder 1986 80 1746 0 0
summon ridder_mod:vijand_ridder 1993 80 1746 0 0
summon ridder_mod:vijand_ridder 2000 80 1746 0 0
summon ridder_mod:vijand_ridder 2007 80 1746 0 0
summon ridder_mod:vijand_ridder 2014 80 1746 0 0

# --- Boogschutters (middenlinie) ---
summon ridder_mod:vijand_boog 1988 80 1740 0 0
summon ridder_mod:vijand_boog 1994 80 1740 0 0
summon ridder_mod:vijand_boog 2000 80 1740 0 0
summon ridder_mod:vijand_boog 2006 80 1740 0 0
summon ridder_mod:vijand_boog 2012 80 1740 0 0

# --- Kanonniers (achterlinie) ---
summon ridder_mod:vijand_kanon 1992 80 1734 0 0
summon ridder_mod:vijand_kanon 2000 80 1734 0 0
summon ridder_mod:vijand_kanon 2008 80 1734 0 0

# --- Markeren dat de bezetting al gespawnd is ---
scoreboard players set rmVijand rm_state 1
