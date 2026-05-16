# ==========================================
# SPAWN TEAM - 10 villagers van jouw team rond de speler
# ==========================================

# --- Per team check via tag ---
execute as @s[tag=team_fire] run function spawn_fire
execute as @s[tag=team_ice] run function spawn_ice
execute as @s[tag=team_lightning] run function spawn_lightning
execute as @s[tag=team_earth] run function spawn_earth

# --- Foutmelding als geen team ---
execute as @s[tag=!st_chose] run tellraw @s {"rawtext":[{"text":"§cJe hebt nog geen team! Loop naar een portal in het hub-platform."}]}
