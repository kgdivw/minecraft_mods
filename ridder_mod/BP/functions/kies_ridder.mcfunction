# ==========================================================
# KEUZE: RIDDER -> het sterkste wapen- en harnaspakket
# ==========================================================
tag @s add rm_chose
tag @s add rol_ridder

# --- Eerst naar het kasteel teleporteren zodat de chunks laden ---
tp @s 2000 82 2000

# --- Kasteel + bewoners 1x bouwen ---
execute unless score rmKasteel rm_state matches 1 run function build_kasteel
execute unless score rmLeger rm_state matches 1 run function leger
execute unless score rmRood rm_state matches 1 run function build_rood_kasteel
execute unless score rmVijand rm_state matches 1 run function vijand_kasteel

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

# --- Naar de binnenplaats, midden in je leger ---
tp @s 2000 80 1972 0 0

# --- Welkom ---
title @s clear
title @s title §7§lRIDDER
title @s subtitle §eHet sterkste pakket zit in je inventaris!
playsound random.anvil_use @s
tellraw @s {"rawtext":[{"text":"§7⚔ §lJe bent nu een Ridder! §r§7Je draagt het sterkste harnas."}]}
tellraw @s {"rawtext":[{"text":"§7In je inventaris: §fzwaard, schild, boog, kruisboog, speer & pijlen."}]}
tellraw @s {"rawtext":[{"text":"§7Je staat midden in je §fleger ridders§7 op de binnenplaats!"}]}
tellraw @s {"rawtext":[{"text":"§7Tip: §e/function vijand_leger §7voor een epische ridderveldslag!"}]}
