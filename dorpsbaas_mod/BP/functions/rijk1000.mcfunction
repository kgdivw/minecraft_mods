# 1000 EUR bereikt: regenboog huizen MET zwembad
tag @s add db_rijk1000
tag @s add db_rainbow
execute if entity @s[tag=db_huis] run function huis_bouw
playsound random.totem @s ~ ~ ~
title @s title §d§lSUPER RIJK! 1000 EUR
title @s subtitle §5Regenboog huis met zwembad!
tellraw @s {"rawtext":[{"text":"§d1000 EUR! §7Je huis is nu een §dREGENBOOG-huis met zwembad§7!"}]}
