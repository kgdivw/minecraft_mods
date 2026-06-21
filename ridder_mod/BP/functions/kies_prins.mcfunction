# ==========================================================
# KEUZE: PRINS / PRINSES -> diamanten harnas, diamanten troon
# Het kasteel wordt RONDOM jou gebouwd, precies waar je staat.
# ==========================================================
tag @s add rm_chose
tag @s add rol_prins

# --- Kasteel + leger RONDOM de speler bouwen (1x) ---
execute unless score rmKasteel rm_state matches 1 at @s run function build_kasteel
execute unless score rmLeger rm_state matches 1 at @s run function leger

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

# --- Op de DIAMANTEN troon zetten (korte hop binnen je eigen kasteel) ---
tp @s ~3 ~3 ~25 180 0

# --- Start de aftelklok: over 1 minuut valt de vijand aan ---
tag @s add rm_count
scoreboard players set @s rm_timer 0

# --- Welkom ---
title @s clear
title @s title §b§lPRINS / PRINSES
title @s subtitle §eJe zit op de diamanten troon!
playsound random.levelup @s
tellraw @s {"rawtext":[{"text":"§b♦ §lWelkom Prins/Prinses! §r§7Je zit op je §bdiamanten troon§7 in je eigen kasteel."}]}
tellraw @s {"rawtext":[{"text":"§7Het §6rode tapijt §7loopt van je slaapkamer naar de troon."}]}
tellraw @s {"rawtext":[{"text":"§c⚔ §lPas op! Over 1 MINUUT valt de vijand je kasteel aan! §r§7Bereid je voor met je leger!"}]}
