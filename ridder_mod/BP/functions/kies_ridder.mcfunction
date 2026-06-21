# ==========================================================
# KEUZE: RIDDER -> het sterkste wapen- en harnaspakket
# ==========================================================
tag @s add rm_chose
tag @s add rol_ridder

# --- Kasteel + leger RONDOM de speler bouwen (1x) ---
execute unless score rmKasteel rm_state matches 1 at @s run function build_kasteel
execute unless score rmLeger rm_state matches 1 at @s run function leger

# --- Avatar: het sterkste harnas (netherite) wordt aangetrokken ---
replaceitem entity @s slot.armor.head 0 netherite_helmet
replaceitem entity @s slot.armor.chest 0 netherite_chestplate
replaceitem entity @s slot.armor.legs 0 netherite_leggings
replaceitem entity @s slot.armor.feet 0 netherite_boots

# --- Het sterkste zwaard in de hand + verbeteringen ---
replaceitem entity @s slot.weapon.mainhand 0 netherite_sword
enchant @s sharpness 5
enchant @s unbreaking 3
enchant @s fire_aspect 2

# --- Schild in je andere hand ---
replaceitem entity @s slot.weapon.offhand 0 shield

# --- Boog, kruisboog, speer (drietand) en de sterkste pijlen in je balk ---
replaceitem entity @s slot.hotbar 1 bow 1
replaceitem entity @s slot.hotbar 2 crossbow 1
replaceitem entity @s slot.hotbar 3 trident 1
replaceitem entity @s slot.hotbar 4 arrow 64
replaceitem entity @s slot.hotbar 5 arrow 64

# --- Naar de binnenplaats, midden in je leger (korte hop) ---
tp @s ~ ~ ~-40 0 0

# --- Start de aftelklok: over 1 minuut valt de vijand aan ---
tag @s add rm_count
scoreboard players set @s rm_timer 0

# --- Welkom ---
title @s clear
title @s title §7§lRIDDER
title @s subtitle §eHet sterkste pakket zit in je inventaris!
playsound random.anvil_use @s
tellraw @s {"rawtext":[{"text":"§7⚔ §lJe bent nu een Ridder! §r§7Je draagt het sterkste harnas."}]}
tellraw @s {"rawtext":[{"text":"§7In je inventaris: §fzwaard, schild, boog, kruisboog, speer & pijlen."}]}
tellraw @s {"rawtext":[{"text":"§7Je staat midden in je §fleger ridders§7 op de binnenplaats!"}]}
tellraw @s {"rawtext":[{"text":"§c⚔ §lPas op! Over 1 MINUUT valt de vijand je kasteel aan! §r§7Hou je wapens klaar!"}]}
