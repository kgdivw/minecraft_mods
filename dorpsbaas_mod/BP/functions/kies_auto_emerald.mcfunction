# Koop een emerald auto (bestuurbaar)
tag @s add db_auto
summon dorpsbaas:auto_emerald ~ ~ ~2
scoreboard players add @s db_geld 25
playsound random.levelup @s ~ ~ ~
title @s actionbar §aOpdracht 2 klaar: auto gekocht! Stap in en rijd! +25 EUR
tellraw @a {"rawtext":[{"selector":"@s"},{"text":"§7 kocht een §aemerald§7 auto. §8Herobrine rijdt in de gouden auto!"}]}
