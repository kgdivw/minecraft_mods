# ==========================================
# HUIS bouwen (klein, voor 4 villagers)
# 7x7 oak cabin met 4 bedden
# ==========================================

# --- Ruimte maken ---
fill ~-3 ~ ~-3 ~3 ~4 ~3 air

# --- Fundering ---
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 cobblestone

# --- Houten vloer (binnen) ---
fill ~-2 ~ ~-2 ~2 ~ ~2 oak_planks

# --- Muren (oak log frame, planks vulling) ---
# Hoeken
fill ~-3 ~ ~-3 ~-3 ~3 ~-3 oak_log
fill ~3 ~ ~-3 ~3 ~3 ~-3 oak_log
fill ~-3 ~ ~3 ~-3 ~3 ~3 oak_log
fill ~3 ~ ~3 ~3 ~3 ~3 oak_log
# Noord muur
fill ~-2 ~ ~-3 ~2 ~3 ~-3 oak_planks
# Zuid muur
fill ~-2 ~ ~3 ~2 ~3 ~3 oak_planks
# West muur
fill ~-3 ~ ~-2 ~-3 ~3 ~2 oak_planks
# Oost muur
fill ~3 ~ ~-2 ~3 ~3 ~2 oak_planks

# --- Ramen (glas in muren) ---
setblock ~-3 ~2 ~0 glass_pane
setblock ~3 ~2 ~0 glass_pane
setblock ~0 ~2 ~-3 glass_pane
setblock ~-1 ~2 ~3 glass_pane
setblock ~1 ~2 ~3 glass_pane

# --- Doorgang (zuid kant) ---
setblock ~0 ~ ~3 air
setblock ~0 ~1 ~3 air

# --- Dak (oak planks 7x7) ---
fill ~-3 ~4 ~-3 ~3 ~4 ~3 oak_planks
# Dakrand met staircases voor flair
fill ~-4 ~4 ~-4 ~4 ~4 ~-4 oak_stairs
fill ~-4 ~4 ~4 ~4 ~4 ~4 oak_stairs
fill ~-4 ~4 ~-3 ~-4 ~4 ~3 oak_stairs
fill ~4 ~4 ~-3 ~4 ~4 ~3 oak_stairs

# --- 4 Bedden (een per villager) ---
setblock ~-2 ~ ~-2 red_bed
setblock ~2 ~ ~-2 red_bed
setblock ~-2 ~ ~2 red_bed
setblock ~2 ~ ~2 red_bed

# --- Verlichting ---
setblock ~0 ~3 ~0 lantern
setblock ~-2 ~3 ~-2 torch
setblock ~2 ~3 ~-2 torch
setblock ~-2 ~3 ~2 torch
setblock ~2 ~3 ~2 torch

# --- Kist met spullen ---
setblock ~0 ~ ~-2 chest

# --- Feedback ---
title @s actionbar §6§lHuis gebouwd! §rBedden voor 4 villagers
playsound random.wood_click @s
