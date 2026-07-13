# Koop een emerald huis
tag @s add db_huis
tag @s add db_mat_emerald
scoreboard players add @s db_geld 25
kill @e[type=dorpsbaas:huis_anker]
summon dorpsbaas:huis_anker ~ ~ ~
function huis_bouw
playsound random.levelup @s ~ ~ ~
title @s actionbar §aOpdracht 3 klaar: huis gebouwd! +25 EUR
tellraw @a {"rawtext":[{"selector":"@s"},{"text":"§7 kocht een emerald huis in het dorp!"}]}
