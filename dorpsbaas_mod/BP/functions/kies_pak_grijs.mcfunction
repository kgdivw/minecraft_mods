# Koop een grijs pak met rode strik
tag @s add db_pak
replaceitem entity @s slot.armor.head 0 iron_helmet
replaceitem entity @s slot.armor.chest 0 iron_chestplate
replaceitem entity @s slot.armor.legs 0 iron_leggings
replaceitem entity @s slot.armor.feet 0 iron_boots
replaceitem entity @s slot.weapon.offhand 0 dorpsbaas:strik
scoreboard players add @s db_geld 50
playsound random.levelup @s ~ ~ ~
title @s actionbar §aOpdracht 1 klaar: pak gekocht! +50 EUR
tellraw @a {"rawtext":[{"selector":"@s"},{"text":"§7 koos een §7grijs§7 pak met rode strik. §8Herobrine draagt grijs!"}]}
