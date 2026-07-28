particle minecraft:basic_flame_particle ~ ~ ~
execute as @e[c=1,r=3,family=mob,type=!tijger:tijger,type=!minecraft:player] at @s run function transformeer
event entity @s tijger:klaar
