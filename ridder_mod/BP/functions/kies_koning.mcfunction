# ==========================================================
# KEUZE: KONING / KONINGIN -> gouden harnas + kroon, gouden troon
# ==========================================================
tag @s add rm_chose
tag @s add rol_koning

# --- Eerst naar het kasteel teleporteren zodat de chunks laden ---
tp @s 2000 82 2000

# --- Kasteel + bewoners 1x bouwen ---
execute unless score $kasteel rm_state matches 1 run function build_kasteel
execute unless score $leger rm_state matches 1 run function leger
execute unless score $rood rm_state matches 1 run function build_rood_kasteel
execute unless score $vijand rm_state matches 1 run function vijand_kasteel

# --- Avatar: gouden harnas + kroon (gouden helm) wordt aangetrokken ---
replaceitem entity @s slot.armor.head 0 golden_helmet
replaceitem entity @s slot.armor.chest 0 golden_chestplate
replaceitem entity @s slot.armor.legs 0 golden_leggings
replaceitem entity @s slot.armor.feet 0 golden_boots
replaceitem entity @s slot.weapon.mainhand 0 golden_sword
enchant @s sharpness 5
enchant @s unbreaking 3
replaceitem entity @s slot.weapon.offhand 0 shield
give @s golden_apple 8
give @s gold_block 16

# --- Op de GOUDEN troon zetten (kijkt de troonzaal in) ---
tp @s 1997 83 2017 180 0

# --- Koninklijk welkom ---
title @s clear
title @s title §6§lKONING / KONINGIN
title @s subtitle §eJe zit op de gouden troon!
playsound random.levelup @s
tellraw @s {"rawtext":[{"text":"§6♚ §lLang leve de Koning/Koningin! §r§7Je zit op je §6gouden troon§7."}]}
tellraw @s {"rawtext":[{"text":"§7Het §6rode tapijt §7loopt van je slaapkamer naar de troon."}]}
tellraw @s {"rawtext":[{"text":"§7Je leger ridders staat buiten klaar. §e/function help §7voor meer."}]}
