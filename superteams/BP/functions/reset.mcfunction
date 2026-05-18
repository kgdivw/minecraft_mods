# Reset speler zodat hij een ander team kan kiezen
tag @s remove st_chose
tag @s remove team_fire
tag @s remove team_ice
tag @s remove team_lightning
tag @s remove team_earth
tag @s remove power_1
tag @s remove power_2
effect @s clear
scoreboard players set @s shards 0
scoreboard players set @s aura_t 0
scoreboard players reset world_fire world_state
scoreboard players reset world_ice world_state
scoreboard players reset world_lightning world_state
scoreboard players reset world_earth world_state
clear @s superteams:fireball_item
clear @s superteams:iceball_item
clear @s superteams:thunderbolt_item
clear @s superteams:earthball_item
clear @s superteams:soul_shard
clear @s superteams:respawn_token
title @s actionbar §6§lTeam reset! §rLoop weer naar een portal.
