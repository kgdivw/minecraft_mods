# Summon Herobrine + zijn leger vlak bij de speler
summon dorpsbaas:herobrine "§8§lHEROBRINE" ~6 ~ ~8
summon dorpsbaas:auto_goud ~10 ~ ~10
summon dorpsbaas:stoute_villager ~5 ~ ~9
summon dorpsbaas:stoute_villager ~8 ~ ~7
summon dorpsbaas:stoute_villager ~7 ~ ~11
summon zombie ~6 ~ ~10
# Geef de speler wapens om te vechten
execute unless entity @s[hasitem={item=diamond_sword}] run give @s diamond_sword
give @s golden_apple 3
title @s subtitle §cSla Herobrine helemaal kapot!
