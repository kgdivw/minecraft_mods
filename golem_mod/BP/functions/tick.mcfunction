# Golems raken jou nooit kwijt: staat er geen speler binnen 64 blokken, dan springt hij naar je toe.
execute as @e[type=golem:ultragolem] at @s unless entity @a[r=64] run tp @s @p
