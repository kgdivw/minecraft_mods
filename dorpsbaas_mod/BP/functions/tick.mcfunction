# ==========================================================
# BAAS VAN HET DORP - TICK LOOP (elke game tick)
# ==========================================================

# ---------- Keuze-platforms (op volgorde) ----------
# 1) PAK
execute as @a[tag=!db_pak] at @s if entity @e[type=dorpsbaas:keuze,family=plat_pak_zwart,r=2] run function kies_pak_zwart
execute as @a[tag=!db_pak] at @s if entity @e[type=dorpsbaas:keuze,family=plat_pak_grijs,r=2] run function kies_pak_grijs
execute as @a[tag=!db_pak] at @s if entity @e[type=dorpsbaas:keuze,family=plat_pak_blauw,r=2] run function kies_pak_blauw
# 2) AUTO (na pak)
execute as @a[tag=db_pak,tag=!db_auto] at @s if entity @e[type=dorpsbaas:keuze,family=plat_auto_diamant,r=2] run function kies_auto_diamant
execute as @a[tag=db_pak,tag=!db_auto] at @s if entity @e[type=dorpsbaas:keuze,family=plat_auto_goud,r=2] run function kies_auto_goud
execute as @a[tag=db_pak,tag=!db_auto] at @s if entity @e[type=dorpsbaas:keuze,family=plat_auto_emerald,r=2] run function kies_auto_emerald
# 3) HUIS (na auto)
execute as @a[tag=db_auto,tag=!db_huis] at @s if entity @e[type=dorpsbaas:keuze,family=plat_huis_ijzer,r=2] run function kies_huis_ijzer
execute as @a[tag=db_auto,tag=!db_huis] at @s if entity @e[type=dorpsbaas:keuze,family=plat_huis_diamant,r=2] run function kies_huis_diamant
execute as @a[tag=db_auto,tag=!db_huis] at @s if entity @e[type=dorpsbaas:keuze,family=plat_huis_goud,r=2] run function kies_huis_goud
execute as @a[tag=db_auto,tag=!db_huis] at @s if entity @e[type=dorpsbaas:keuze,family=plat_huis_emerald,r=2] run function kies_huis_emerald
# 4) HEROBRINE (na huis)
execute as @a[tag=db_huis,tag=!db_hero,tag=!db_hero_bezig] at @s if entity @e[type=dorpsbaas:keuze,family=plat_hero,r=2] run function kies_hero
# 5) GROTER (na Herobrine)
execute as @a[tag=db_hero,tag=!db_groot] at @s if entity @e[type=dorpsbaas:keuze,family=plat_groter,r=2] run function kies_groter

# ---------- Geld: opgeraapte muntjes -> EUR ----------
execute as @a[hasitem={item=dorpsbaas:muntje,quantity=1..}] at @s run function inruilen

# ---------- Herobrine verslagen? ----------
execute if score heroAlive db_state matches 1 unless entity @e[type=dorpsbaas:herobrine] run function hero_verslagen
# Herobrine roept versterking op (elke ~10s) zolang hij leeft
execute if score heroAlive db_state matches 1 run scoreboard players add heroSpawn db_state 1
execute if score heroAlive db_state matches 1 if score heroSpawn db_state matches 200.. at @e[type=dorpsbaas:herobrine] run function herobrine_spawn
execute if score heroSpawn db_state matches 200.. run scoreboard players set heroSpawn db_state 0

# ---------- Rijk worden ----------
execute as @a[tag=!db_rijk100,scores={db_geld=100..}] at @s run function rijk100
execute as @a[tag=!db_rijk1000,scores={db_geld=1000..}] at @s run function rijk1000

# ---------- Beroemd worden (baas + rijk) ----------
execute as @a[tag=db_hero,tag=db_rijk1000,tag=!db_beroemd] at @s run function beroemd

# ---------- HUD: volgende opdracht in de actionbar ----------
execute as @a[tag=!db_pak] run titleraw @s actionbar {"rawtext":[{"text":"§eOpdracht 1: §fkoop een PAK (met rode strik)"}]}
execute as @a[tag=db_pak,tag=!db_auto] run titleraw @s actionbar {"rawtext":[{"text":"§eOpdracht 2: §fkoop een AUTO"}]}
execute as @a[tag=db_auto,tag=!db_huis] run titleraw @s actionbar {"rawtext":[{"text":"§eOpdracht 3: §fkoop een HUIS"}]}
execute as @a[tag=db_huis,tag=!db_hero,tag=!db_hero_bezig] run titleraw @s actionbar {"rawtext":[{"text":"§eOpdracht 4: §fversla HEROBRINE (stap op het rode platform)"}]}
execute as @a[tag=db_hero_bezig] run titleraw @s actionbar {"rawtext":[{"text":"§c§lVERSLA HEROBRINE NU!"}]}
execute as @a[tag=db_hero,tag=!db_groot] run titleraw @s actionbar {"rawtext":[{"text":"§eOpdracht 5: §fmaak je huis GROTER"}]}
execute as @a[tag=db_groot,tag=!db_rijk1000] run titleraw @s actionbar {"rawtext":[{"text":"§eOpdracht 6: §fword RIJK (spaar 1000 EUR)"}]}
execute as @a[tag=db_beroemd] run titleraw @s actionbar {"rawtext":[{"text":"§6§l★ JIJ BENT DE BAAS VAN HET DORP ★"}]}
