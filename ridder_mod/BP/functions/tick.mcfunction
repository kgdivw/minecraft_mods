# ==========================================================
# RIDDER MOD - TICK LOOP (draait elke game tick)
# ==========================================================

# --- Portal triggers: speler die nog niet koos en op een portal staat ---
execute as @a[tag=!rm_chose] at @s if entity @e[type=ridder_mod:keuze_portal,family=portal_ridder,r=3] run function kies_ridder
execute as @a[tag=!rm_chose] at @s if entity @e[type=ridder_mod:keuze_portal,family=portal_prins,r=3] run function kies_prins
execute as @a[tag=!rm_chose] at @s if entity @e[type=ridder_mod:keuze_portal,family=portal_koning,r=3] run function kies_koning

# --- Passieve krachten: alles is "het sterkste" ---
# Ridder: kracht + snelheid + haast (sterkste krijger)
execute as @a[tag=rol_ridder] at @s run effect @s strength 6 1 true
execute as @a[tag=rol_ridder] at @s run effect @s resistance 6 0 true
execute as @a[tag=rol_ridder] at @s run effect @s haste 6 1 true
# Prins/Prinses: regeneratie + weerstand
execute as @a[tag=rol_prins] at @s run effect @s regeneration 6 0 true
execute as @a[tag=rol_prins] at @s run effect @s resistance 6 0 true
# Koning/Koningin: regeneratie + weerstand + kracht (de machtigste)
execute as @a[tag=rol_koning] at @s run effect @s regeneration 6 0 true
execute as @a[tag=rol_koning] at @s run effect @s resistance 6 1 true
execute as @a[tag=rol_koning] at @s run effect @s strength 6 0 true

# --- Pijlen bijvullen voor ridders als die op raken ---
execute as @a[tag=rol_ridder,hasitem={item=arrow,quantity=0}] run give @s arrow 64

# --- Aftellen naar de vijandelijke aanval (1 minuut = 1200 ticks na je keuze) ---
scoreboard players add @a[tag=rm_count] rm_timer 1
execute as @a[tag=rm_count,scores={rm_timer=600}] run tellraw @a {"rawtext":[{"text":"§e⏳ Nog 30 seconden tot de vijand aanvalt!"}]}
execute as @a[tag=rm_count,scores={rm_timer=900}] run tellraw @a {"rawtext":[{"text":"§6⏳ Nog 15 seconden tot de aanval!"}]}
execute as @a[tag=rm_count,scores={rm_timer=1140}] run tellraw @a {"rawtext":[{"text":"§c⏳ Nog 3 seconden!"}]}
execute as @a[tag=rm_count,scores={rm_timer=1170..}] run title @s actionbar §c§lDE VIJAND KOMT ERAAN!
execute as @a[tag=rm_count,scores={rm_timer=1200..}] at @e[type=ridder_mod:kasteel_anker] run function vijand_aanval
tag @a[tag=rm_count,scores={rm_timer=1200..}] remove rm_count

# --- Actieve kasteelbewoners (kok, uitvinder, hofnar, butler, katapult) ---
execute if entity @e[type=ridder_mod:kasteel_anker] run function bewoners

# --- HUD ---
execute as @a[tag=rol_ridder] run titleraw @s actionbar {"rawtext":[{"text":"§7§l⚔ RIDDER §r§7| §fSterkste wapens & harnas"}]}
execute as @a[tag=rol_prins] run titleraw @s actionbar {"rawtext":[{"text":"§b§l♦ PRINS/PRINSES §r§7| §bDiamanten troon"}]}
execute as @a[tag=rol_koning] run titleraw @s actionbar {"rawtext":[{"text":"§6§l♚ KONING/KONINGIN §r§7| §6Gouden troon"}]}
