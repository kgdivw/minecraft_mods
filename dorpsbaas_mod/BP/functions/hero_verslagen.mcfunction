# Herobrine is verslagen!
scoreboard players set heroAlive db_state 0
scoreboard players add @a[tag=db_hero_bezig] db_geld 300
tag @a[tag=db_hero_bezig] add db_hero
tag @a[tag=db_hero_bezig] remove db_hero_bezig
# Ruim zijn leger op
kill @e[type=dorpsbaas:stoute_villager]
title @a title §a§lHEROBRINE VERSLAGEN!
title @a subtitle §eJij bent bijna de baas! +300 EUR
tellraw @a {"rawtext":[{"text":"§a§l★ HEROBRINE IS VERSLAGEN! ★ §r§7Jij bent nu bijna de baas van het dorp!"}]}
execute as @a[tag=db_hero] at @s run playsound random.totem @s ~ ~ ~
execute as @a[tag=db_hero] at @s run particle minecraft:totem_particle ~ ~1 ~
