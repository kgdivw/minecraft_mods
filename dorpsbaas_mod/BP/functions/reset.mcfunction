# Reset alles en begin opnieuw
tag @s remove db_pak
tag @s remove db_auto
tag @s remove db_huis
tag @s remove db_hero
tag @s remove db_hero_bezig
tag @s remove db_groot
tag @s remove db_rijk100
tag @s remove db_rijk1000
tag @s remove db_rainbow
tag @s remove db_beroemd
tag @s remove db_mat_ijzer
tag @s remove db_mat_diamant
tag @s remove db_mat_goud
tag @s remove db_mat_emerald
scoreboard players set @s db_geld 0
scoreboard players set heroAlive db_state 0
replaceitem entity @s slot.armor.head 0 air
replaceitem entity @s slot.armor.chest 0 air
replaceitem entity @s slot.armor.legs 0 air
replaceitem entity @s slot.armor.feet 0 air
kill @e[type=dorpsbaas:keuze]
kill @e[type=dorpsbaas:herobrine]
kill @e[type=dorpsbaas:stoute_villager]
kill @e[type=dorpsbaas:auto_diamant]
kill @e[type=dorpsbaas:auto_goud]
kill @e[type=dorpsbaas:auto_emerald]
kill @e[type=armor_stand]
tellraw @s {"rawtext":[{"text":"§aAlles gereset! Doe §e/function start §aom opnieuw te beginnen."}]}
