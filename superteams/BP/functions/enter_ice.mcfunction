# Speler kiest TEAM IJS
tag @s add st_chose
tag @s add team_ice

# Teleport naar eiland (laadt de chunks)
tp @s -500 75 0

# Bouw eiland alleen 1x per wereld (relatief tov speler)
execute unless score world_ice world_state matches 1 at @s run function island_ice
scoreboard players set world_ice world_state 1

# Land op de top van het eiland
tp @s -500 67 0

effect @s water_breathing 99999 0 true
effect @s conduit_power 99999 0 true
give @s iron_sword 1
give @s prismarine_shard 4
title @s clear
title @s title §b§lTEAM IJS
title @s subtitle §3Water Ademen & Conduit Power!
playsound random.glass @s
tellraw @s {"rawtext":[{"text":"§b§l❄️ Je bent nu lid van TEAM IJS! §rJe villagers wachten op je eiland!"}]}
tellraw @s {"rawtext":[{"text":"§7Gebruik §e/function spawn_team §7om je 10 villagers te spawnen"}]}
tellraw @s {"rawtext":[{"text":"§7Gebruik §e/function build_house §7om een huis te bouwen"}]}
