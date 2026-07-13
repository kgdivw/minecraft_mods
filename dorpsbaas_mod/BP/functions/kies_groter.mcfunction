# Maak je huis groter (extra verdieping) - hier word je RIJK van
tag @s add db_groot
function huis_bouw
scoreboard players add @s db_geld 700
playsound random.levelup @s ~ ~ ~
title @s title §b§lHUIS GROTER!
title @s subtitle §aJe wordt er rijk van! +700 EUR
tellraw @a {"rawtext":[{"selector":"@s"},{"text":"§7 heeft zijn huis groter gemaakt en is nu §6RIJK§7! Bij 1000 EUR worden je huizen §dregenboog met zwembad§7."}]}
