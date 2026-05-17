# ==========================================
# GIGANTISCH HERENHUIS bouwen (voor 10 villagers)
# 15x15x6 villa met 10 bedden, 2 verdiepingen
# ==========================================

# --- Ruimte maken ---
fill ~-7 ~ ~-7 ~7 ~9 ~7 air

# --- Fundering (stenen) ---
fill ~-7 ~-1 ~-7 ~7 ~-1 ~7 stone_bricks

# --- Begane grond vloer ---
fill ~-6 ~ ~-6 ~6 ~ ~6 polished_andesite

# --- Buitenmuren BG (stripe pattern: stone bricks + oak log) ---
fill ~-7 ~ ~-7 ~7 ~3 ~-7 stone_bricks
fill ~-7 ~ ~7 ~7 ~3 ~7 stone_bricks
fill ~-7 ~ ~-7 ~-7 ~3 ~7 stone_bricks
fill ~7 ~ ~-7 ~7 ~3 ~7 stone_bricks

# --- Hoekpijlers oak logs ---
fill ~-7 ~ ~-7 ~-7 ~7 ~-7 oak_log
fill ~7 ~ ~-7 ~7 ~7 ~-7 oak_log
fill ~-7 ~ ~7 ~-7 ~7 ~7 oak_log
fill ~7 ~ ~7 ~7 ~7 ~7 oak_log

# --- Tussenverdieping (planken vloer 1e etage) ---
fill ~-6 ~4 ~-6 ~6 ~4 ~6 oak_planks
# Gat in vloer voor trap (3x3 in zuidwest hoek)
fill ~-5 ~4 ~3 ~-3 ~4 ~5 air

# --- Trap (oak stairs naar 1e etage) ---
setblock ~-4 ~ ~5 oak_stairs
setblock ~-4 ~1 ~4 oak_stairs
setblock ~-4 ~2 ~3 oak_stairs
setblock ~-4 ~3 ~2 oak_stairs

# --- 1e Etage muren ---
fill ~-7 ~4 ~-7 ~7 ~7 ~-7 stone_bricks
fill ~-7 ~4 ~7 ~7 ~7 ~7 stone_bricks
fill ~-7 ~4 ~-7 ~-7 ~7 ~7 stone_bricks
fill ~7 ~4 ~-7 ~7 ~7 ~7 stone_bricks

# --- Ramen rondom (begane grond) ---
setblock ~-7 ~2 ~-3 glass_pane
setblock ~-7 ~2 ~0 glass_pane
setblock ~-7 ~2 ~3 glass_pane
setblock ~7 ~2 ~-3 glass_pane
setblock ~7 ~2 ~0 glass_pane
setblock ~7 ~2 ~3 glass_pane
setblock ~-3 ~2 ~-7 glass_pane
setblock ~3 ~2 ~-7 glass_pane
setblock ~-3 ~2 ~7 glass_pane
setblock ~3 ~2 ~7 glass_pane

# --- Ramen 1e etage ---
setblock ~-7 ~6 ~-3 glass_pane
setblock ~-7 ~6 ~3 glass_pane
setblock ~7 ~6 ~-3 glass_pane
setblock ~7 ~6 ~3 glass_pane
setblock ~-3 ~6 ~-7 glass_pane
setblock ~3 ~6 ~-7 glass_pane
setblock ~-3 ~6 ~7 glass_pane
setblock ~3 ~6 ~7 glass_pane

# --- Hoofdingang (open doorgang) ---
setblock ~-1 ~ ~-7 air
setblock ~-1 ~1 ~-7 air
setblock ~0 ~ ~-7 air
setblock ~0 ~1 ~-7 air
setblock ~1 ~ ~-7 air
setblock ~1 ~1 ~-7 air

# --- Dak ---
fill ~-7 ~8 ~-7 ~7 ~8 ~7 dark_oak_planks
# Top torentje
fill ~-1 ~9 ~-1 ~1 ~9 ~1 dark_oak_planks
setblock ~0 ~10 ~0 lantern

# --- 5 bedden begane grond (in het midden) ---
setblock ~-5 ~ ~-5 red_wool
setblock ~-2 ~ ~-5 red_wool
setblock ~2 ~ ~-5 red_wool
setblock ~5 ~ ~-5 red_wool
setblock ~5 ~ ~-2 red_wool

# --- 5 bedden 1e etage ---
setblock ~-5 ~5 ~-5 red_wool
setblock ~-2 ~5 ~-5 red_wool
setblock ~2 ~5 ~-5 red_wool
setblock ~5 ~5 ~-5 red_wool
setblock ~5 ~5 ~-2 red_wool

# --- Verlichting begane grond ---
setblock ~0 ~3 ~0 lantern
setblock ~-6 ~3 ~-6 lantern
setblock ~6 ~3 ~-6 lantern
setblock ~-6 ~3 ~6 lantern
setblock ~6 ~3 ~6 lantern

# --- Verlichting 1e etage ---
setblock ~-6 ~7 ~-6 lantern
setblock ~6 ~7 ~-6 lantern
setblock ~-6 ~7 ~6 lantern
setblock ~6 ~7 ~6 lantern

# --- Meubels: keuken/kist op begane grond ---
setblock ~-6 ~ ~0 crafting_table
setblock ~-5 ~ ~0 furnace
setblock ~6 ~ ~0 chest
setblock ~5 ~ ~0 chest

# --- Feedback ---
title @s actionbar §6§lGigantisch Herenhuis gebouwd! §rPlaats voor alle 10 villagers
playsound random.anvil_use @s
