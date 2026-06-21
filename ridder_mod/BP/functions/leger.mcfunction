# ==========================================================
# RIDDER MOD - KASTEELBEWONERS + LEGER RIDDERS
# Wordt aangeroepen met "execute at @s" terwijl de speler in
# het midden van het kasteel staat -> alles RELATIEF (~).
# ==========================================================

# --- Kasteelbewoners (binnen) ---
# Kok in de grote keuken (achter-rechts)
summon ridder_mod:kok ~11 ~1 ~18
# Uitvinder in de werkplaats (midden-verdieping)
summon ridder_mod:uitvinder ~22 ~7 ~22
# Hofnar in de troonzaal (voor de tronen)
summon ridder_mod:hofnar ~0 ~1 ~18
summon ridder_mod:hofnar ~-4 ~1 ~19
# Butler bij de ingang
summon ridder_mod:butler ~0 ~1 ~-24

# --- LEGER RIDDERS op de binnenplaats (voor de poort, noordkant) ---
summon ridder_mod:ridder_npc ~-12 ~ ~-36
summon ridder_mod:ridder_npc ~-6 ~ ~-36
summon ridder_mod:ridder_npc ~0 ~ ~-36
summon ridder_mod:ridder_npc ~6 ~ ~-36
summon ridder_mod:ridder_npc ~12 ~ ~-36
summon ridder_mod:ridder_npc ~-12 ~ ~-42
summon ridder_mod:ridder_npc ~-6 ~ ~-42
summon ridder_mod:ridder_npc ~6 ~ ~-42
summon ridder_mod:ridder_npc ~12 ~ ~-42
summon ridder_mod:ridder_npc ~-12 ~ ~-48
summon ridder_mod:ridder_npc ~-6 ~ ~-48
summon ridder_mod:ridder_npc ~0 ~ ~-48
summon ridder_mod:ridder_npc ~6 ~ ~-48
summon ridder_mod:ridder_npc ~12 ~ ~-48
# Wachters die de poort flankeren
summon ridder_mod:ridder_npc ~-5 ~ ~-30
summon ridder_mod:ridder_npc ~5 ~ ~-30

# --- Markeren dat het leger al gespawnd is ---
scoreboard players set rmLeger rm_state 1

# --- Feedback ---
title @s actionbar §6§lKasteel klaar! Kok, uitvinder, hofnar, butler & leger zijn er!
playsound mob.villager.idle @s
