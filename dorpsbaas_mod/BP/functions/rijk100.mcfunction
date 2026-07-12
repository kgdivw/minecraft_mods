# 100 EUR bereikt: huizen worden van emerald (zonder zwembad)
tag @s add db_rijk100
execute if entity @s[tag=db_huis] run function huis_bouw
playsound random.levelup @s ~ ~ ~
title @s title §a§lRIJK! 100 EUR
title @s subtitle §2Je huis is nu van emerald!
tellraw @s {"rawtext":[{"text":"§a100 EUR! §7Je huizen zijn nu van §2emerald§7 (nog geen zwembad). Spaar door naar 1000!"}]}
