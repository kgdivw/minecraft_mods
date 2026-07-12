# Start het gevecht tegen Herobrine
tag @s add db_hero_bezig
scoreboard players set heroAlive db_state 1
scoreboard players set heroSpawn db_state 0
function herobrine_start
playsound mob.wither.spawn @s ~ ~ ~
title @s title §8§lHEROBRINE!
title @s subtitle §cVersla hem om de baas te worden!
tellraw @a {"rawtext":[{"text":"§8§l⚠ HEROBRINE §r§cverschijnt met zijn mobs en stoute villagers! Versla hem!"}]}
