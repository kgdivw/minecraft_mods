# Herbouw je huis op de plek van je huis-anker (of waar je staat als er nog geen anker is).
execute at @e[type=dorpsbaas:huis_anker] run function huis_render
execute unless entity @e[type=dorpsbaas:huis_anker] run function huis_render
