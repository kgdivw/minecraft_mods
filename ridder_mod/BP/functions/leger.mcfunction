# ==========================================================
# RIDDER MOD - KASTEELBEWONERS + LEGER RIDDERS
# Wordt 1x per wereld opgeroepen door de keuze-functies.
# ==========================================================

# --- Kasteelbewoners (binnen) ---
# Kok in de keuken (achter-rechts, grote hal)
summon ridder_mod:kok 2012 81 2012
# Uitvinder in de werkplaats (midden-verdieping, achter-rechts)
summon ridder_mod:uitvinder 2012 87 2012
# Hofnar in de troonzaal
summon ridder_mod:hofnar 2000 81 2008
summon ridder_mod:hofnar 1996 81 2009
# Butler bij de ingang
summon ridder_mod:butler 2000 81 1984

# --- LEGER RIDDERS op de binnenplaats (voor de poort) ---
summon ridder_mod:ridder_npc 1988 80 1974
summon ridder_mod:ridder_npc 1994 80 1974
summon ridder_mod:ridder_npc 2000 80 1974
summon ridder_mod:ridder_npc 2006 80 1974
summon ridder_mod:ridder_npc 2012 80 1974
summon ridder_mod:ridder_npc 1988 80 1968
summon ridder_mod:ridder_npc 1994 80 1968
summon ridder_mod:ridder_npc 2000 80 1968
summon ridder_mod:ridder_npc 2006 80 1968
summon ridder_mod:ridder_npc 2012 80 1968
summon ridder_mod:ridder_npc 1988 80 1962
summon ridder_mod:ridder_npc 1994 80 1962
summon ridder_mod:ridder_npc 2000 80 1962
summon ridder_mod:ridder_npc 2006 80 1962
summon ridder_mod:ridder_npc 2012 80 1962
# Wachters die de poort flankeren
summon ridder_mod:ridder_npc 1996 80 1979
summon ridder_mod:ridder_npc 2004 80 1979

# --- Markeren dat het leger al gespawnd is ---
scoreboard players set rmLeger rm_state 1

# --- Feedback ---
title @s actionbar §6§lKasteel klaar! Kok, uitvinder, hofnar, butler & leger zijn er!
playsound mob.villager.idle @s
