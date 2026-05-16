# ==========================================
# ARMORY bouwen (paardenstal + wapenkamer)
# 11x11x6 met armor stands, wapens en een sea_horse
# ==========================================

# --- Ruimte maken ---
fill ~-5 ~ ~-5 ~5 ~5 ~5 air

# --- Fundering (polished blackstone) ---
fill ~-5 ~-1 ~-5 ~5 ~-1 ~5 polished_blackstone

# --- Vloer ---
fill ~-4 ~ ~-4 ~4 ~ ~4 polished_blackstone_bricks

# --- Muren rondom (cobblestone walls + stone bricks) ---
fill ~-5 ~ ~-5 ~5 ~3 ~-5 stone_bricks
fill ~-5 ~ ~5 ~5 ~3 ~5 stone_bricks
fill ~-5 ~ ~-5 ~-5 ~3 ~5 stone_bricks
fill ~5 ~ ~-5 ~5 ~3 ~5 stone_bricks

# --- Hoeken iron block ---
setblock ~-5 ~ ~-5 iron_block
setblock ~5 ~ ~-5 iron_block
setblock ~-5 ~ ~5 iron_block
setblock ~5 ~ ~5 iron_block
setblock ~-5 ~3 ~-5 iron_block
setblock ~5 ~3 ~-5 iron_block
setblock ~-5 ~3 ~5 iron_block
setblock ~5 ~3 ~5 iron_block

# --- Ramen (ijzeren tralies) ---
setblock ~-5 ~2 ~0 iron_bars
setblock ~5 ~2 ~0 iron_bars
setblock ~0 ~2 ~-5 iron_bars
setblock ~-1 ~2 ~5 iron_bars
setblock ~1 ~2 ~5 iron_bars

# --- Dak (cut copper) ---
fill ~-5 ~4 ~-5 ~5 ~4 ~5 oxidized_cut_copper

# --- Hoofdingang (open doorgang, zuidkant) ---
setblock ~0 ~ ~5 air
setblock ~0 ~1 ~5 air

# --- Verlichting ---
setblock ~0 ~3 ~0 sea_lantern
setblock ~-4 ~3 ~-4 lantern
setblock ~4 ~3 ~-4 lantern
setblock ~-4 ~3 ~4 lantern
setblock ~4 ~3 ~4 lantern

# === ARMOR RACK (noordkant) ===
# 4 armor stands met armor (we plaatsen armor stand entities en kleden ze aan)
# Wapenrek
fill ~-4 ~ ~-4 ~-4 ~1 ~-4 oak_fence
fill ~-2 ~ ~-4 ~-2 ~1 ~-4 oak_fence
fill ~0 ~ ~-4 ~0 ~1 ~-4 oak_fence
fill ~2 ~ ~-4 ~2 ~1 ~-4 oak_fence
fill ~4 ~ ~-4 ~4 ~1 ~-4 oak_fence

# 4 armor stand entities langs de noordkant
summon armor_stand ~-3 ~ ~-4
summon armor_stand ~-1 ~ ~-4
summon armor_stand ~1 ~ ~-4
summon armor_stand ~3 ~ ~-4

# Aankleden van de armor stands (set armor via replaceitem)
execute as @e[type=armor_stand,x=~-3,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.head 0 diamond_helmet
execute as @e[type=armor_stand,x=~-3,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.chest 0 diamond_chestplate
execute as @e[type=armor_stand,x=~-3,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.legs 0 diamond_leggings
execute as @e[type=armor_stand,x=~-3,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.feet 0 diamond_boots

execute as @e[type=armor_stand,x=~-1,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.head 0 iron_helmet
execute as @e[type=armor_stand,x=~-1,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.chest 0 iron_chestplate
execute as @e[type=armor_stand,x=~-1,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.legs 0 iron_leggings
execute as @e[type=armor_stand,x=~-1,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.feet 0 iron_boots

execute as @e[type=armor_stand,x=~1,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.head 0 golden_helmet
execute as @e[type=armor_stand,x=~1,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.chest 0 golden_chestplate
execute as @e[type=armor_stand,x=~1,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.legs 0 golden_leggings
execute as @e[type=armor_stand,x=~1,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.feet 0 golden_boots

execute as @e[type=armor_stand,x=~3,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.head 0 chainmail_helmet
execute as @e[type=armor_stand,x=~3,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.chest 0 chainmail_chestplate
execute as @e[type=armor_stand,x=~3,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.legs 0 chainmail_leggings
execute as @e[type=armor_stand,x=~3,y=~,z=~-4,r=1,c=1] run replaceitem entity @s slot.armor.feet 0 chainmail_boots

# === WAPENKIST (zuid west) ===
setblock ~-3 ~ ~3 chest
setblock ~-3 ~1 ~3 chest

# === PAARDENSTAL met zee paard (oost helft) ===
# Stal box met hekken
fill ~3 ~ ~-2 ~3 ~2 ~2 oak_fence
fill ~1 ~ ~-2 ~1 ~2 ~2 oak_fence
setblock ~2 ~ ~-2 oak_fence
setblock ~2 ~ ~2 oak_fence
# Hooi blokken als voer
setblock ~3 ~1 ~0 hay_block
setblock ~2 ~1 ~-1 hay_block
# Zee paard spawnen
summon superteams:sea_horse ~2 ~ ~0
# Paardenuitrusting proberen automatisch te equipen (verschillende slot types proberen voor compatibility)
execute as @e[type=superteams:sea_horse,x=~2,y=~,z=~0,r=2,c=1] run replaceitem entity @s slot.armor 0 iron_horse_armor
execute as @e[type=superteams:sea_horse,x=~2,y=~,z=~0,r=2,c=1] run replaceitem entity @s slot.saddle 0 saddle
execute as @e[type=superteams:sea_horse,x=~2,y=~,z=~0,r=2,c=1] run replaceitem entity @s slot.equippable 1 iron_horse_armor
execute as @e[type=superteams:sea_horse,x=~2,y=~,z=~0,r=2,c=1] run replaceitem entity @s slot.equippable 0 saddle
# Backup: ook losse items klaarzetten zodat de speler ze handmatig kan equipen
give @s saddle 1
give @s iron_horse_armor 1

# === GEEF SPELER WAPENS ===
give @s diamond_sword 1
give @s bow 1
give @s arrow 32
give @s shield 1

# --- Feedback ---
title @s actionbar §6§lArmory gebouwd! §rPaard staat klaar met armor & zadel
playsound random.levelup @s
tellraw @s {"rawtext":[{"text":"§e⚔️ Pak je wapens en bestijg je Zee Paard om vijandige eilanden aan te vallen!"}]}
