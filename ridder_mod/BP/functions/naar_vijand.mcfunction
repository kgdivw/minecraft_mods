# ==========================================================
# RIDDER MOD - VAL HET RODE KASTEEL AAN
# Teleporteert je naar de binnenplaats van het rode kasteel
# zodat je samen met je leger de vijandige koning kunt verslaan.
# Gebruik: /function naar_vijand
# ==========================================================
tp @s 2000 80 1795 180 0
title @s title §c§lAANVAL!
title @s subtitle §eVersla de vijandige koning in het rode kasteel!
playsound mob.wither.spawn @s
tellraw @s {"rawtext":[{"text":"§c⚔ §lJe staat op de binnenplaats van het RODE KASTEEL! Versla de vijandige koning!"}]}
