# Maak je huis groter (extra verdieping)
tag @s add db_groot
function huis_bouw
scoreboard players add @s db_geld 25
playsound random.levelup @s ~ ~ ~
title @s actionbar §aOpdracht 5 klaar: je huis is groter! +25 EUR
tellraw @a {"rawtext":[{"selector":"@s"},{"text":"§7 heeft zijn huis groter gemaakt!"}]}
