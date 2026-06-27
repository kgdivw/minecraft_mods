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

# --- Kok kookt: serveert om de ~8s soep aan wie in de buurt is ---
execute if score rmCook rm_state matches 160.. at @e[type=ridder_mod:kok] as @a[r=16] run give @s mushroom_stew 1
execute if score rmCook rm_state matches 160.. at @e[type=ridder_mod:kok] as @a[r=16] run playsound random.eat @s
execute if score rmCook rm_state matches 160.. at @e[type=ridder_mod:kok] as @a[r=16] run tellraw @s {"rawtext":[{"text":"§6🍲 De kok geeft je een dampende kom soep!"}]}
execute if score rmCook rm_state matches 160.. run scoreboard players set rmCook rm_state 0

# --- Butler brengt om de ~11s eten (kip) naar de koninklijke familie ---
execute if score rmButler rm_state matches 220.. at @e[type=ridder_mod:kasteel_anker] as @a[r=70] run give @s cooked_chicken 1
execute if score rmButler rm_state matches 220.. at @e[type=ridder_mod:kasteel_anker] unless entity @e[type=chicken,r=16] run summon chicken ~ ~1 ~22
execute if score rmButler rm_state matches 220.. as @a[tag=rm_chose] run tellraw @s {"rawtext":[{"text":"§e🍗 De butler brengt gebraden kip naar de koninklijke familie!"}]}
execute if score rmButler rm_state matches 220.. run scoreboard players set rmButler rm_state 0

# --- Katapult van de uitvinder bombardeert de vijand (om de ~2.5s, alleen bij vijanden) ---
execute if score rmCat rm_state matches 50.. at @e[type=ridder_mod:kasteel_anker] if entity @e[family=vijand_ridder,r=140] run summon fireball ~ ~16 ~-88 0 90
execute if score rmCat rm_state matches 50.. at @e[type=ridder_mod:kasteel_anker] if entity @e[family=vijand_ridder,r=140] run playsound mob.ghast.fireball @a
execute if score rmCat rm_state matches 50.. run scoreboard players set rmCat rm_state 0
