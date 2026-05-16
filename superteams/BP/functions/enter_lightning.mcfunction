# Speler kiest TEAM BLIKSEM
tag @s add st_chose
tag @s add team_lightning
tp @s 0 70 500
effect @s speed 99999 1 true
effect @s jump_boost 99999 1 true
give @s iron_sword 1
give @s feather 4
title @s clear
title @s title §e§lTEAM BLIKSEM
title @s subtitle §6Snelheid & Sprongkracht!
playsound ambient.weather.lightning.impact @s
tellraw @s {"rawtext":[{"text":"§e§l⚡ Je bent nu lid van TEAM BLIKSEM! §rJe villagers wachten op je eiland!"}]}
tellraw @s {"rawtext":[{"text":"§7Gebruik §e/function spawn_team §7om je 10 villagers te spawnen"}]}
tellraw @s {"rawtext":[{"text":"§7Gebruik §e/function build_house §7om een huis te bouwen"}]}
