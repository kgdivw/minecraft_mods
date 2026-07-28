execute as @e[family=tijger,r=10] at @s run function krab_slag
execute as @a[c=1,r=8,hasitem={item=tijger:pootafdruk,quantity=0}] run give @s tijger:pootafdruk 1
event entity @s tijger:klaar
