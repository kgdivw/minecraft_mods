# ==========================================================
# RIDDER MOD - RESET (kies opnieuw)
# Wist je rol-tags zodat je weer op een portal kunt kiezen.
# Het kasteel blijft staan.
# ==========================================================
tag @s remove rm_chose
tag @s remove rol_ridder
tag @s remove rol_prins
tag @s remove rol_koning

tellraw @s {"rawtext":[{"text":"§e↺ Je rol is gewist. Typ §6/function start §een kies opnieuw!"}]}
