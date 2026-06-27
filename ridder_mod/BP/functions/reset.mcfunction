# ==========================================================
# RIDDER MOD - RESET (begin helemaal opnieuw)
# Wist je rol, de bouw-vlaggen, het anker, alle ridders/vijanden
# en de tickingareas, zodat je met /function start een vers
# kasteel op je huidige plek kunt bouwen.
# ==========================================================
tag @s remove rm_chose
tag @s remove rol_ridder
tag @s remove rol_prins
tag @s remove rol_koning
tag @s remove rm_count
scoreboard players set @s rm_timer 0

# --- Bouw-vlaggen terug op 0 ---
scoreboard players set rmKasteel rm_state 0
scoreboard players set rmLeger rm_state 0
scoreboard players set rmRood rm_state 0
scoreboard players set rmVijand rm_state 0

# --- Anker + alle mod-wezens opruimen ---
kill @e[type=ridder_mod:kasteel_anker]
kill @e[type=ridder_mod:ridder_npc]
kill @e[type=ridder_mod:ridder_boog]
kill @e[type=ridder_mod:vijand_ridder]
kill @e[type=ridder_mod:vijand_boog]
kill @e[type=ridder_mod:vijand_kanon]
kill @e[type=ridder_mod:vijand_koning]
kill @e[type=ridder_mod:kok]
kill @e[type=ridder_mod:uitvinder]
kill @e[type=ridder_mod:hofnar]
kill @e[type=ridder_mod:butler]

# --- Tickingareas weghalen ---
tickingarea remove ridder_kasteel
tickingarea remove rood_kasteel

tellraw @s {"rawtext":[{"text":"§e↺ Alles is gewist. Typ §6/function start §een kies opnieuw -- je nieuwe kasteel komt waar jij staat!"}]}
