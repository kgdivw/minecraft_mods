# Dorpelingen geven complimenten + winkeliers vertellen over de prijs.
# Draait ~elke 6 seconden vanuit tick. Roteert de tekst via praatIdx.
scoreboard players add praatIdx db_state 1
execute if score praatIdx db_state matches 6.. run scoreboard players set praatIdx db_state 0

# --- Complimenten van dorpelingen in de buurt ---
execute if score praatIdx db_state matches 0 as @a at @s if entity @e[type=dorpsbaas:dorpeling,r=16] run tellraw @s {"rawtext":[{"text":"§a[Dorpeling] §fWat zie jij er goed uit vandaag!"}]}
execute if score praatIdx db_state matches 1 as @a at @s if entity @e[type=dorpsbaas:dorpeling,r=16] run tellraw @s {"rawtext":[{"text":"§a[Dorpeling] §fJij wordt vast de baas van het dorp!"}]}
execute if score praatIdx db_state matches 2 as @a[tag=db_pak] at @s if entity @e[type=dorpsbaas:dorpeling,r=16] run tellraw @s {"rawtext":[{"text":"§a[Dorpeling] §fWauw, wat een prachtig blauw pak!"}]}
execute if score praatIdx db_state matches 3 as @a[tag=db_auto] at @s if entity @e[type=dorpsbaas:dorpeling,r=16] run tellraw @s {"rawtext":[{"text":"§a[Dorpeling] §fWat een gave auto heb jij!"}]}
execute if score praatIdx db_state matches 4 as @a[tag=db_hero] at @s if entity @e[type=dorpsbaas:dorpeling,r=16] run tellraw @s {"rawtext":[{"text":"§a[Dorpeling] §fJij hebt Herobrine verslagen, onze held!"}]}
execute if score praatIdx db_state matches 5 as @a at @s if entity @e[type=dorpsbaas:dorpeling,r=16] run tellraw @s {"rawtext":[{"text":"§a[Dorpeling] §fFijn dat jij er bent!"}]}

# --- Winkeliers vertellen spontaan over de prijs (als je in hun winkel staat) ---
execute as @a[tag=!db_pak] at @s if entity @e[type=dorpsbaas:keuze,family=plat_pak,r=6] run tellraw @s {"rawtext":[{"text":"§9[Kleermaker] §fDit blauwe pak met strik krijg jij gratis - en 50 EUR erbij! Stap op de mat."}]}
execute as @a[tag=db_pak,tag=!db_auto] at @s if entity @e[type=dorpsbaas:keuze,family=plat_auto_goud,r=8] run tellraw @s {"rawtext":[{"text":"§7[Monteur] §fEen auto? Voor de baas gratis! Maar de gouden pikt Herobrine in."}]}
execute as @a[tag=db_auto,tag=!db_huis] at @s if entity @e[type=dorpsbaas:keuze,family=plat_huis_goud,r=8] run tellraw @s {"rawtext":[{"text":"§6[Makelaar] §fEen eigen huis, en je krijgt er 50 EUR bij. Kies maar een materiaal!"}]}
execute as @a[tag=db_huis,tag=!db_hero] at @s if entity @e[type=dorpsbaas:keuze,family=plat_hero,r=8] run tellraw @s {"rawtext":[{"text":"§e[Burgemeester] §fVersla Herobrine en je krijgt 300 EUR. Wees voorzichtig!"}]}
