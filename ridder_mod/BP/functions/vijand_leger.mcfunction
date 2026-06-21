# ==========================================================
# RIDDER MOD - ROEP METEEN EEN VIJANDIGE AANVALSGOLF OP
# Spawnt de vijand bij de noordpoort van je kasteel (via het anker).
# Gebruik: /function vijand_leger
# ==========================================================
execute at @e[type=ridder_mod:kasteel_anker] run function vijand_aanval

# --- Foutmelding als er nog geen kasteel is ---
execute unless entity @e[type=ridder_mod:kasteel_anker] run tellraw @s {"rawtext":[{"text":"§cJe hebt nog geen kasteel! Typ §e/function start §cen kies eerst een rol."}]}
