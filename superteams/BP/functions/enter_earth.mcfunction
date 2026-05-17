# Speler kiest TEAM AARDE
tag @s add st_chose
tag @s add team_earth

# Teleport naar eiland (laadt de chunks)
tp @s 0 75 -500

# Bouw eiland alleen 1x per wereld (relatief tov speler)
execute unless score world_earth world_state matches 1 at @s run function island_earth
scoreboard players set world_earth world_state 1

# Land op de top van het eiland
tp @s 0 67 -500

effect @s resistance 99999 0 true
effect @s health_boost 99999 1 true
give @s iron_sword 1
give @s iron_ingot 4
title @s clear
title @s title §a§lTEAM AARDE
title @s subtitle §2Resistance & Extra Leven!
playsound random.anvil_land @s
tellraw @s {"rawtext":[{"text":"§a§l🪨 Je bent nu lid van TEAM AARDE! §rJe villagers wachten op je eiland!"}]}
tellraw @s {"rawtext":[{"text":"§7Gebruik §e/function spawn_team §7om je 10 villagers te spawnen"}]}
tellraw @s {"rawtext":[{"text":"§7Gebruik §e/function build_house §7om een huis te bouwen"}]}
