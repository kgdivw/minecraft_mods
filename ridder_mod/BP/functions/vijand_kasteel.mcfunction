# ==========================================================
# RIDDER MOD - BEZETTING VAN HET RODE KASTEEL (relatief)
# Wordt aangeroepen met "execute at @s" terwijl de speler in het
# midden van het rode kasteel staat. Spawnt de vijandige koning +
# garnizoen RELATIEF (~). 1x per wereld.
# ==========================================================

# --- De vijandige KONING bij zijn rode troon (kijkt naar het zuiden) ---
summon ridder_mod:vijand_koning ~0 ~1 ~21 0 0

# --- Zwaardvechters (voorste linie, zuidkant) ---
summon ridder_mod:vijand_ridder ~-14 ~ ~46
summon ridder_mod:vijand_ridder ~-7 ~ ~46
summon ridder_mod:vijand_ridder ~0 ~ ~46
summon ridder_mod:vijand_ridder ~7 ~ ~46
summon ridder_mod:vijand_ridder ~14 ~ ~46

# --- Boogschutters (middenlinie) ---
summon ridder_mod:vijand_boog ~-12 ~ ~40
summon ridder_mod:vijand_boog ~-6 ~ ~40
summon ridder_mod:vijand_boog ~0 ~ ~40
summon ridder_mod:vijand_boog ~6 ~ ~40
summon ridder_mod:vijand_boog ~12 ~ ~40

# --- Kanonniers (achterlinie) ---
summon ridder_mod:vijand_kanon ~-8 ~ ~34
summon ridder_mod:vijand_kanon ~0 ~ ~34
summon ridder_mod:vijand_kanon ~8 ~ ~34

# --- Markeren dat de bezetting al gespawnd is ---
scoreboard players set rmVijand rm_state 1
