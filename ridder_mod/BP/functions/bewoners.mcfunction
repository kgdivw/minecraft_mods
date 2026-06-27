# ==========================================================
# RIDDER MOD - ACTIEVE KASTEELBEWONERS (v2)
# Wordt elke tick aangeroepen ALS er een kasteel-anker is.
# Iedereen doet nu iets:
#  - Hofnar: danst rond (speed) + vrolijke deeltjes
#  - Uitvinder: sleutelt (vonken) + zijn katapult bombardeert de vijand
#  - Kok: kookt soep en serveert die
#  - Butler: brengt eten (kip) naar de koninklijke familie
# ==========================================================

# --- Hofnar danst energiek rond ---
effect @e[type=ridder_mod:hofnar] speed 3 0 true

# --- Tellers (fake players op rm_state) ---
scoreboard players add rmFx rm_state 1
scoreboard players add rmCook rm_state 1
scoreboard players add rmButler rm_state 1
scoreboard players add rmCat rm_state 1

# --- Sfeer-deeltjes (om de ~8 ticks, niet elke tick) ---
execute if score rmFx rm_state matches 8.. at @e[type=ridder_mod:hofnar] run particle minecraft:heart_particle ~ ~2.5 ~
execute if score rmFx rm_state matches 8.. at @e[type=ridder_mod:hofnar] run particle minecraft:villager_happy ~ ~2.3 ~
execute if score rmFx rm_state matches 8.. at @e[type=ridder_mod:uitvinder] run particle minecraft:electric_spark_particle ~ ~1.8 ~
execute if score rmFx rm_state matches 8.. at @e[type=ridder_mod:kok] run particle minecraft:villager_happy ~ ~1.6 ~
execute if score rmFx rm_state matches 8.. run scoreboard players set rmFx rm_state 0

# --- Kok kookt soep: alleen aan wie in de buurt is EN nog geen soep heeft ---
execute if score rmCook rm_state matches 300.. at @e[type=ridder_mod:kok] as @a[r=16,hasitem={item=mushroom_stew,quantity=0}] run give @s mushroom_stew 1
execute if score rmCook rm_state matches 300.. at @e[type=ridder_mod:kok] as @a[r=16,hasitem={item=mushroom_stew,quantity=0}] run playsound random.eat @s
execute if score rmCook rm_state matches 300.. at @e[type=ridder_mod:kok] as @a[r=16,hasitem={item=mushroom_stew,quantity=0}] run tellraw @s {"rawtext":[{"text":"§6🍲 De kok geeft je een dampende kom soep!"}]}
execute if score rmCook rm_state matches 300.. run scoreboard players set rmCook rm_state 0

# --- Butler brengt eten: alleen aan wie nog geen kip heeft (geen levende kippen meer) ---
execute if score rmButler rm_state matches 500.. at @e[type=ridder_mod:kasteel_anker] as @a[r=70,hasitem={item=cooked_chicken,quantity=0}] run give @s cooked_chicken 1
execute if score rmButler rm_state matches 500.. at @e[type=ridder_mod:kasteel_anker] as @a[r=70,hasitem={item=cooked_chicken,quantity=0}] run tellraw @s {"rawtext":[{"text":"§e🍗 De butler brengt je gebraden kip."}]}
execute if score rmButler rm_state matches 500.. run scoreboard players set rmButler rm_state 0

# --- Katapult van de uitvinder bombardeert de vijand (om de ~2.5s, alleen bij vijanden) ---
# (GEEN bliksem: de katapult doet vuurschade + vlam-deeltjes op een paar vijanden)
execute if score rmCat rm_state matches 50.. at @e[type=ridder_mod:kasteel_anker] if entity @e[family=vijand_ridder,r=150] run playsound mob.ghast.fireball @a
execute if score rmCat rm_state matches 50.. at @e[type=ridder_mod:kasteel_anker] as @e[family=vijand_ridder,r=150,c=4] run damage @s 6 fire
execute if score rmCat rm_state matches 50.. at @e[type=ridder_mod:kasteel_anker] as @e[family=vijand_ridder,r=150,c=4] run particle minecraft:basic_flame_particle ~ ~1 ~
execute if score rmCat rm_state matches 50.. run scoreboard players set rmCat rm_state 0
