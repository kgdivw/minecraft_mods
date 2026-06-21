# ==========================================================
# RIDDER MOD - VAL HET RODE KASTEEL AAN
# Teleporteert je naar het vijandelijke gebied (260 blokken ten
# noorden van je eigen kasteel), bouwt daar 1x het rode kasteel +
# garnizoen, en zet je op hun binnenplaats.
# Gebruik: /function naar_vijand
# ==========================================================

# --- Foutmelding als er nog geen kasteel is ---
execute unless entity @e[type=ridder_mod:kasteel_anker] run tellraw @s {"rawtext":[{"text":"§cJe hebt nog geen kasteel! Typ §e/function start §cen kies eerst een rol."}]}

# --- Teleporteer naar het vijandelijke gebied (t.o.v. je anker) ---
execute at @e[type=ridder_mod:kasteel_anker] run tp @s ~ ~ ~-260

# --- Bouw 1x het rode kasteel + garnizoen RONDOM deze plek ---
execute if entity @e[type=ridder_mod:kasteel_anker] unless score rmRood rm_state matches 1 at @s run function build_rood_kasteel
execute if entity @e[type=ridder_mod:kasteel_anker] unless score rmVijand rm_state matches 1 at @s run function vijand_kasteel

# --- Zet je op hun binnenplaats (zuidkant, kijkend naar het rode kasteel) ---
execute if entity @e[type=ridder_mod:kasteel_anker] run tp @s ~ ~1 ~45 180 0
execute if entity @e[type=ridder_mod:kasteel_anker] run title @s title §c§lAANVAL!
execute if entity @e[type=ridder_mod:kasteel_anker] run title @s subtitle §eVersla de vijandige koning!
execute if entity @e[type=ridder_mod:kasteel_anker] run playsound mob.wither.spawn @s
execute if entity @e[type=ridder_mod:kasteel_anker] run tellraw @s {"rawtext":[{"text":"§c⚔ §lJe staat bij het RODE KASTEEL! Versla de vijandige koning en zijn leger!"}]}
