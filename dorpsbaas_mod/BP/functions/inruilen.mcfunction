# Zet opgeraapte muntjes om in EUR (proportioneel)
execute if entity @s[hasitem={item=dorpsbaas:muntje,quantity=32..}] run function inruil/t32
execute if entity @s[hasitem={item=dorpsbaas:muntje,quantity=16..}] run function inruil/t16
execute if entity @s[hasitem={item=dorpsbaas:muntje,quantity=8..}] run function inruil/t8
execute if entity @s[hasitem={item=dorpsbaas:muntje,quantity=4..}] run function inruil/t4
execute if entity @s[hasitem={item=dorpsbaas:muntje,quantity=2..}] run function inruil/t2
execute if entity @s[hasitem={item=dorpsbaas:muntje,quantity=1..}] run function inruil/t1
execute if entity @s[hasitem={item=dorpsbaas:muntje,quantity=1..}] run playsound random.orb @s ~ ~ ~
