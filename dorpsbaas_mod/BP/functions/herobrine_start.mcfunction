# Summon Herobrine + zijn leger rondom de speler
summon dorpsbaas:herobrine ~12 ~ ~12
summon dorpsbaas:auto_goud ~16 ~ ~16
summon dorpsbaas:stoute_villager ~10 ~ ~13
summon dorpsbaas:stoute_villager ~14 ~ ~11
summon dorpsbaas:stoute_villager ~13 ~ ~15
summon dorpsbaas:stoute_villager ~9 ~ ~9
summon zombie ~11 ~ ~14
summon zombie ~15 ~ ~10
# Geef de speler een zwaard om te vechten (als hij niks heeft)
execute unless entity @s[hasitem={item=diamond_sword}] run give @s diamond_sword
give @s golden_apple 3
