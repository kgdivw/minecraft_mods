# ==========================================================
# BAAS VAN HET DORP - TICK LOOP (elke game tick)
# ==========================================================

# ---------- Winkel-pads (op volgorde) ----------
execute as @a[tag=!db_pak] at @s if entity @e[type=dorpsbaas:keuze,family=plat_pak,r=2] run function kies_pak
execute as @a[tag=db_pak,tag=!db_auto] at @s if entity @e[type=dorpsbaas:keuze,family=plat_auto_diamant,r=2] run function kies_auto_diamant
execute as @a[tag=db_pak,tag=!db_auto] at @s if entity @e[type=dorpsbaas:keuze,family=plat_auto_goud,r=2] run function kies_auto_goud
execute as @a[tag=db_pak,tag=!db_auto] at @s if entity @e[type=dorpsbaas:keuze,family=plat_auto_emerald,r=2] run function kies_auto_emerald
execute as @a[tag=db_auto,tag=!db_huis] at @s if entity @e[type=dorpsbaas:keuze,family=plat_huis_ijzer,r=2] run function kies_huis_ijzer
execute as @a[tag=db_auto,tag=!db_huis] at @s if entity @e[type=dorpsbaas:keuze,family=plat_huis_diamant,r=2] run function kies_huis_diamant
execute as @a[tag=db_auto,tag=!db_huis] at @s if entity @e[type=dorpsbaas:keuze,family=plat_huis_goud,r=2] run function kies_huis_goud
execute as @a[tag=db_auto,tag=!db_huis] at @s if entity @e[type=dorpsbaas:keuze,family=plat_huis_emerald,r=2] run function kies_huis_emerald
execute as @a[tag=db_huis,tag=!db_hero,tag=!db_hero_bezig] at @s if entity @e[type=dorpsbaas:keuze,family=plat_hero,r=2] run function kies_hero
execute as @a[tag=db_hero,tag=!db_groot] at @s if entity @e[type=dorpsbaas:keuze,family=plat_groter,r=2] run function kies_groter

# ---------- Geld: opgeraapte muntjes -> EUR ----------
execute as @a[hasitem={item=dorpsbaas:muntje,quantity=1..}] at @s run function inruilen

# ---------- Herobrine verslagen? ----------
execute if score heroAlive db_state matches 1 unless entity @e[type=dorpsbaas:herobrine] run function hero_verslagen
execute if score heroAlive db_state matches 1 run scoreboard players add heroSpawn db_state 1
execute if score heroAlive db_state matches 1 if score heroSpawn db_state matches 200.. at @e[type=dorpsbaas:herobrine] run function herobrine_spawn
execute if score heroSpawn db_state matches 200.. run scoreboard players set heroSpawn db_state 0

# ---------- Rijk & beroemd ----------
execute as @a[tag=!db_rijk100,scores={db_geld=100..}] at @s run function rijk100
execute as @a[tag=!db_rijk1000,scores={db_geld=1000..}] at @s run function rijk1000
execute as @a[tag=db_hero,tag=db_rijk1000,tag=!db_beroemd] at @s run function beroemd

# ---------- Pratende dorpelingen + winkeliers (elke ~6s) ----------
scoreboard players add praat db_state 1
execute if score praat db_state matches 120.. run function dorp_praat
execute if score praat db_state matches 120.. run scoreboard players set praat db_state 0

# ---------- HUD: volgende opdracht ----------
execute as @a[tag=!db_pak] run titleraw @s actionbar {"rawtext":[{"text":"§eOpdracht 1: §fkoop een blauw PAK bij de Kleermaker (noord)"}]}
execute as @a[tag=db_pak,tag=!db_auto] run titleraw @s actionbar {"rawtext":[{"text":"§eOpdracht 2: §fkoop een AUTO bij de Garage (west)"}]}
execute as @a[tag=db_auto,tag=!db_huis] run titleraw @s actionbar {"rawtext":[{"text":"§eOpdracht 3: §fkoop een HUIS bij de Makelaar (oost)"}]}
execute as @a[tag=db_huis,tag=!db_hero,tag=!db_hero_bezig] run titleraw @s actionbar {"rawtext":[{"text":"§eOpdracht 4: §fversla HEROBRINE (Gemeentehuis, zuid)"}]}
execute as @a[tag=db_hero_bezig] run titleraw @s actionbar {"rawtext":[{"text":"§c§lVERSLA HEROBRINE NU!"}]}
execute as @a[tag=db_hero,tag=!db_groot] run titleraw @s actionbar {"rawtext":[{"text":"§eOpdracht 5: §fmaak je huis GROTER (Gemeentehuis)"}]}
execute as @a[tag=db_groot,tag=!db_rijk1000] run titleraw @s actionbar {"rawtext":[{"text":"§eOpdracht 6: §fword RIJK (spaar 1000 EUR)"}]}
execute as @a[tag=db_beroemd] run titleraw @s actionbar {"rawtext":[{"text":"§6§l★ JIJ BENT DE BAAS VAN HET DORP ★"}]}
