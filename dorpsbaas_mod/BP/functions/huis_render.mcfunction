# Bouwt het huis op de ANKER-plek (aangeroepen via huis_bouw).
# Regenboog (1000 EUR) > emerald (100 EUR of gekozen) > gekozen materiaal.
execute if entity @s[tag=db_rainbow] run function huis_regenboog
execute if entity @s[tag=!db_rainbow,tag=db_rijk100] run function huis_emerald
execute if entity @s[tag=!db_rainbow,tag=!db_rijk100,tag=db_mat_emerald] run function huis_emerald
execute if entity @s[tag=!db_rainbow,tag=!db_rijk100,tag=db_mat_goud] run function huis_goud
execute if entity @s[tag=!db_rainbow,tag=!db_rijk100,tag=db_mat_diamant] run function huis_diamant
execute if entity @s[tag=!db_rainbow,tag=!db_rijk100,tag=db_mat_ijzer] run function huis_ijzer
# Groter gemaakt? Extra verdieping erbovenop.
execute if entity @s[tag=db_groot] run function huis_verdieping
