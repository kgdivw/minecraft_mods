# Speler kiest TEAM VUUR
tag @s add st_chose
tag @s add team_fire

# Teleport eerst hoog boven het eiland (laadt de chunks)
tp @s 500 95 0

# Bouw eiland alleen 1x per wereld
execute unless score $island_fire world_state matches 1 run function island_fire
scoreboard players set $island_fire world_state 1

# Land op het eiland
tp @s 500 70 0

# Superkracht effecten
effect @s fire_resistance 99999 0 true
effect @s strength 99999 1 true
give @s iron_sword 1
give @s netherite_scrap 1
title @s clear
title @s title §c§lTEAM VUUR
title @s subtitle §6Vuurresistentie & Sterkte!
playsound mob.ghast.fireball @s
tellraw @s {"rawtext":[{"text":"§c§l🔥 Je bent nu lid van TEAM VUUR! §rJe villagers wachten op je eiland!"}]}
tellraw @s {"rawtext":[{"text":"§7Gebruik §e/function spawn_team §7om je 10 villagers te spawnen"}]}
tellraw @s {"rawtext":[{"text":"§7Gebruik §e/function build_house §7om een huis te bouwen"}]}
