# Koop het blauwe pak met rode strik (op de buik zichtbaar)
tag @s add db_pak
replaceitem entity @s slot.armor.chest 0 dorpsbaas:pak_blauw
replaceitem entity @s slot.armor.head 0 diamond_helmet
replaceitem entity @s slot.armor.legs 0 diamond_leggings
replaceitem entity @s slot.armor.feet 0 diamond_boots
scoreboard players add @s db_geld 25
playsound random.levelup @s ~ ~ ~
title @s title §9§lBLAUW PAK AAN!
title @s subtitle §7Met een rode strik op je buik
tellraw @a {"rawtext":[{"selector":"@s"},{"text":"§7 heeft een §9blauw pak met rode strik§7 gekocht! §8Herobrine draagt grijs."}]}
