# ==========================================
# SUPERTEAMS - TICK LOOP (draait elke game tick)
# ==========================================

# --- Portal triggers: speler op portal zonder team ---
execute as @a[tag=!st_chose] at @s if entity @e[type=superteams:portal_marker,family=fire_portal,r=3] run function enter_fire
execute as @a[tag=!st_chose] at @s if entity @e[type=superteams:portal_marker,family=ice_portal,r=3] run function enter_ice
execute as @a[tag=!st_chose] at @s if entity @e[type=superteams:portal_marker,family=lightning_portal,r=3] run function enter_lightning
execute as @a[tag=!st_chose] at @s if entity @e[type=superteams:portal_marker,family=earth_portal,r=3] run function enter_earth

# --- Superkracht passieve effecten refreshen ---
execute as @a[tag=team_fire] at @s run effect @s fire_resistance 12 0 true
execute as @a[tag=team_fire] at @s run effect @s strength 12 1 true
execute as @a[tag=team_ice] at @s run effect @s water_breathing 12 0 true
execute as @a[tag=team_ice] at @s run effect @s conduit_power 12 0 true
execute as @a[tag=team_lightning] at @s run effect @s speed 12 1 true
execute as @a[tag=team_lightning] at @s run effect @s jump_boost 12 1 true
execute as @a[tag=team_earth] at @s run effect @s resistance 12 0 true
execute as @a[tag=team_earth] at @s run effect @s health_boost 12 1 true

# --- Soul shard pickup: count score + clear 1 per tick ---
execute as @a[hasitem={item=superteams:soul_shard,quantity=1..}] run scoreboard players add @s shards 1
execute as @a[hasitem={item=superteams:soul_shard,quantity=1..}] run clear @s superteams:soul_shard 0 1

# --- Auto-unlock POWER 1 (5 sjards) per team ---
execute as @a[tag=team_fire,tag=!power_1,scores={shards=5..}] run function unlock_p1_fire
execute as @a[tag=team_ice,tag=!power_1,scores={shards=5..}] run function unlock_p1_ice
execute as @a[tag=team_lightning,tag=!power_1,scores={shards=5..}] run function unlock_p1_lightning
execute as @a[tag=team_earth,tag=!power_1,scores={shards=5..}] run function unlock_p1_earth

# --- Auto-unlock POWER 2 (15 sjards) per team ---
execute as @a[tag=team_fire,tag=!power_2,scores={shards=15..}] run function unlock_p2_fire
execute as @a[tag=team_ice,tag=!power_2,scores={shards=15..}] run function unlock_p2_ice
execute as @a[tag=team_lightning,tag=!power_2,scores={shards=15..}] run function unlock_p2_lightning
execute as @a[tag=team_earth,tag=!power_2,scores={shards=15..}] run function unlock_p2_earth

# --- Auto-refresh projectile ammunition als die op raakt (< 1 in inventory) ---
execute as @a[tag=team_fire,tag=power_1,hasitem={item=superteams:fireball_item,quantity=0}] run give @s superteams:fireball_item 16
execute as @a[tag=team_ice,tag=power_1,hasitem={item=superteams:iceball_item,quantity=0}] run give @s superteams:iceball_item 16
execute as @a[tag=team_lightning,tag=power_1,hasitem={item=superteams:thunderbolt_item,quantity=0}] run give @s superteams:thunderbolt_item 16
execute as @a[tag=team_earth,tag=power_1,hasitem={item=superteams:earthball_item,quantity=0}] run give @s superteams:earthball_item 16

# --- Aura timer: tikt op voor power_2 spelers ---
scoreboard players add @a[tag=power_2] aura_t 1

# --- Aura schade elke ~1 seconde voor power_2 spelers ---
execute as @a[tag=team_fire,tag=power_2,scores={aura_t=20..}] at @s run damage @e[type=team_villager,family=!fire_team,r=4] 4 fire
execute as @a[tag=team_fire,tag=power_2,scores={aura_t=20..}] at @s run damage @e[type=neutral_villager,r=4] 4 fire
execute as @a[tag=team_ice,tag=power_2,scores={aura_t=20..}] at @s run effect @e[type=team_villager,family=!ice_team,r=4] slowness 4 2 true
execute as @a[tag=team_ice,tag=power_2,scores={aura_t=20..}] at @s run damage @e[type=team_villager,family=!ice_team,r=4] 2 magic
execute as @a[tag=team_lightning,tag=power_2,scores={aura_t=20..}] at @s run damage @e[type=team_villager,family=!lightning_team,r=5] 5 lightning
execute as @a[tag=team_earth,tag=power_2,scores={aura_t=20..}] at @s run effect @e[type=team_villager,family=!earth_team,r=4] poison 6 0 true
execute as @a[tag=team_earth,tag=power_2,scores={aura_t=20..}] at @s run damage @e[type=team_villager,family=!earth_team,r=4] 2 magic

# --- Aura visualisatie (particles) ---
execute as @a[tag=team_fire,tag=power_2,scores={aura_t=20..}] at @s run particle minecraft:basic_flame_particle ~ ~1 ~
execute as @a[tag=team_ice,tag=power_2,scores={aura_t=20..}] at @s run particle minecraft:snowflake_particle ~ ~1 ~
execute as @a[tag=team_lightning,tag=power_2,scores={aura_t=20..}] at @s run particle minecraft:electric_spark_particle ~ ~1 ~
execute as @a[tag=team_earth,tag=power_2,scores={aura_t=20..}] at @s run particle minecraft:vine_particle ~ ~1 ~

# --- Aura timer reset na trigger ---
scoreboard players set @a[tag=power_2,scores={aura_t=20..}] aura_t 0

# --- Respawn token consumptie: spawn nieuwe team villager + clear 1 token ---
execute as @a[tag=team_fire,hasitem={item=superteams:respawn_token,quantity=1..}] at @s run summon superteams:team_fire ~ ~ ~
execute as @a[tag=team_ice,hasitem={item=superteams:respawn_token,quantity=1..}] at @s run summon superteams:team_ice ~ ~ ~
execute as @a[tag=team_lightning,hasitem={item=superteams:respawn_token,quantity=1..}] at @s run summon superteams:team_lightning ~ ~ ~
execute as @a[tag=team_earth,hasitem={item=superteams:respawn_token,quantity=1..}] at @s run summon superteams:team_earth ~ ~ ~
execute as @a[tag=st_chose,hasitem={item=superteams:respawn_token,quantity=1..}] run clear @s superteams:respawn_token 0 1
execute as @a[tag=st_chose,hasitem={item=superteams:respawn_token,quantity=1..}] run playsound mob.villager.idle @s

# --- HUD bovenin scherm (actionbar) ---
execute as @a[tag=team_fire,tag=!power_1] run titleraw @s actionbar {"rawtext":[{"text":"§c§l🔥 VUUR §r§7| 🔮 "},{"score":{"name":"@s","objective":"shards"}},{"text":"§7/5 voor §6Vuurballen §7| 15 voor §6Aura"}]}
execute as @a[tag=team_fire,tag=power_1,tag=!power_2] run titleraw @s actionbar {"rawtext":[{"text":"§c§l🔥 VUUR §r§7| ⚡1 §a✓ §7| 🔮 "},{"score":{"name":"@s","objective":"shards"}},{"text":"§7/15 voor §6Vuurstekels Aura"}]}
execute as @a[tag=team_fire,tag=power_1,tag=power_2] run titleraw @s actionbar {"rawtext":[{"text":"§c§l🔥 VUUR §r§7| ⚡1 §a✓ §7| ⚡2 §a✓ §7| MAX POWER"}]}

execute as @a[tag=team_ice,tag=!power_1] run titleraw @s actionbar {"rawtext":[{"text":"§b§l❄️ IJS §r§7| 🔮 "},{"score":{"name":"@s","objective":"shards"}},{"text":"§7/5 voor §3Ijsballen §7| 15 voor §3Aura"}]}
execute as @a[tag=team_ice,tag=power_1,tag=!power_2] run titleraw @s actionbar {"rawtext":[{"text":"§b§l❄️ IJS §r§7| ⚡1 §a✓ §7| 🔮 "},{"score":{"name":"@s","objective":"shards"}},{"text":"§7/15 voor §3Ijspegels Aura"}]}
execute as @a[tag=team_ice,tag=power_1,tag=power_2] run titleraw @s actionbar {"rawtext":[{"text":"§b§l❄️ IJS §r§7| ⚡1 §a✓ §7| ⚡2 §a✓ §7| MAX POWER"}]}

execute as @a[tag=team_lightning,tag=!power_1] run titleraw @s actionbar {"rawtext":[{"text":"§e§l⚡ BLIKSEM §r§7| 🔮 "},{"score":{"name":"@s","objective":"shards"}},{"text":"§7/5 voor §6Bliksembollen §7| 15 voor §6Aura"}]}
execute as @a[tag=team_lightning,tag=power_1,tag=!power_2] run titleraw @s actionbar {"rawtext":[{"text":"§e§l⚡ BLIKSEM §r§7| ⚡1 §a✓ §7| 🔮 "},{"score":{"name":"@s","objective":"shards"}},{"text":"§7/15 voor §6Donderslag Aura"}]}
execute as @a[tag=team_lightning,tag=power_1,tag=power_2] run titleraw @s actionbar {"rawtext":[{"text":"§e§l⚡ BLIKSEM §r§7| ⚡1 §a✓ §7| ⚡2 §a✓ §7| MAX POWER"}]}

execute as @a[tag=team_earth,tag=!power_1] run titleraw @s actionbar {"rawtext":[{"text":"§a§l🪨 AARDE §r§7| 🔮 "},{"score":{"name":"@s","objective":"shards"}},{"text":"§7/5 voor §2Aardeballen §7| 15 voor §2Aura"}]}
execute as @a[tag=team_earth,tag=power_1,tag=!power_2] run titleraw @s actionbar {"rawtext":[{"text":"§a§l🪨 AARDE §r§7| ⚡1 §a✓ §7| 🔮 "},{"score":{"name":"@s","objective":"shards"}},{"text":"§7/15 voor §2Rotsstekels Aura"}]}
execute as @a[tag=team_earth,tag=power_1,tag=power_2] run titleraw @s actionbar {"rawtext":[{"text":"§a§l🪨 AARDE §r§7| ⚡1 §a✓ §7| ⚡2 §a✓ §7| MAX POWER"}]}
