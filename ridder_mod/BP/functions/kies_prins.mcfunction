# ==========================================================
# KEUZE: PRINS / PRINSES -> diamanten harnas, diamanten troon
# ==========================================================
tag @s add rm_chose
tag @s add rol_prins

# --- Eerst naar het kasteel teleporteren zodat de chunks laden ---
tp @s 2000 82 2000

# --- Kasteel + bewoners 1x bouwen ---
execute unless score $kasteel rm_state matches 1 run function build_kasteel
execute unless score $leger rm_state matches 1 run function leger
execute unless score $rood rm_state matches 1 run function build_rood_kasteel
execute unless score $vijand rm_state matches 1 run function vijand_kasteel

# --- Avatar: diamanten harnas wordt aangetrokken ---
replaceitem entity @s slot.armor.head 0 diamond_helmet
replaceitem entity @s slot.armor.chest 0 diamond_chestplate
replaceitem entity @s slot.armor.legs 0 diamond_leggings
replaceitem entity @s slot.armor.feet 0 diamond_boots
replaceitem entity @s slot.weapon.mainhand 0 diamond_sword
enchant @s sharpness 4
enchant @s unbreaking 3
replaceitem entity @s slot.weapon.offhand 0 shield
give @s golden_apple 5
give @s diamond 16

# --- Op de DIAMANTEN troon zetten ---
tp @s 2003 83 2017 180 0

# --- Welkom ---
title @s clear
title @s title §b§lPRINS / PRINSES
title @s subtitle §eJe zit op de diamanten troon!
playsound random.levelup @s
tellraw @s {"rawtext":[{"text":"§b♦ §lWelkom Prins/Prinses! §r§7Je zit op je §bdiamanten troon§7."}]}
tellraw @s {"rawtext":[{"text":"§7Het §6rode tapijt §7loopt van je slaapkamer naar de troon."}]}
tellraw @s {"rawtext":[{"text":"§7Je leger ridders staat buiten klaar. §e/function help §7voor meer."}]}
