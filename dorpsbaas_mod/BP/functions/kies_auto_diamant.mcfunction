# Koop een diamant auto (bestuurbaar)
tag @s add db_auto
summon dorpsbaas:auto_diamant ~ ~ ~2
scoreboard players add @s db_geld 50
playsound random.levelup @s ~ ~ ~
title @s actionbar §aOpdracht 2 klaar: auto gekocht! Stap in en rijd! +50 EUR
tellraw @a {"rawtext":[{"selector":"@s"},{"text":"§7 kocht een §bdiamanten§7 auto. §8Herobrine rijdt in de gouden auto!"}]}
