# ==========================================================
# RIDDER MOD - KASTEELBEWONERS + LEGER RIDDERS
# Wordt 1x per wereld opgeroepen door de keuze-functies.
# Coords passen bij het grote kasteel (midden 2000,80,2000, WALL=28).
# ==========================================================

# --- Kasteelbewoners (binnen) ---
# Kok in de grote keuken (achter-rechts)
summon ridder_mod:kok 2011 81 2018
# Uitvinder in de werkplaats (midden-verdieping, achter-rechts)
summon ridder_mod:uitvinder 2022 87 2022
# Hofnar in de troonzaal (voor de tronen)
summon ridder_mod:hofnar 2000 81 2018
summon ridder_mod:hofnar 1996 81 2019
# Butler bij de ingang
summon ridder_mod:butler 2000 81 1976

# --- LEGER RIDDERS op de binnenplaats (voor de poort, kijken naar het noorden) ---
summon ridder_mod:ridder_npc 1988 80 1964
summon ridder_mod:ridder_npc 1994 80 1964
summon ridder_mod:ridder_npc 2000 80 1964
summon ridder_mod:ridder_npc 2006 80 1964
summon ridder_mod:ridder_npc 2012 80 1964
summon ridder_mod:ridder_npc 1988 80 1958
summon ridder_mod:ridder_npc 1994 80 1958
summon ridder_mod:ridder_npc 2006 80 1958
summon ridder_mod:ridder_npc 2012 80 1958
summon ridder_mod:ridder_npc 1988 80 1952
summon ridder_mod:ridder_npc 1994 80 1952
summon ridder_mod:ridder_npc 2000 80 1952
summon ridder_mod:ridder_npc 2006 80 1952
summon ridder_mod:ridder_npc 2012 80 1952
# Wachters die de poort flankeren
summon ridder_mod:ridder_npc 1995 80 1970
summon ridder_mod:ridder_npc 2005 80 1970

# --- Markeren dat het leger al gespawnd is ---
scoreboard players set rmLeger rm_state 1

# --- Feedback ---
title @s actionbar §6§lKasteel klaar! Kok, uitvinder, hofnar, butler & leger zijn er!
playsound mob.villager.idle @s
