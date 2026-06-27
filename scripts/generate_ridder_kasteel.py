"""Generate the castle build functions for the Ridder Mod.

Produces TWO functions with one parameterised builder:
  * build_kasteel.mcfunction       -> our grey stone castle (2000,80,2000)
                                       with a GOLDEN and a DIAMOND throne
  * build_rood_kasteel.mcfunction  -> the enemy RED castle, equally big
                                       (2000,80,1700) with a single red throne

Both castles: huge keep with 3 floors, 4 tall corner towers + a central spire
reaching ~100 blocks high, an outer curtain wall enclosing a ~200-wide
courtyard, a throne room, bedroom + long red carpet, kitchen, workshop,
cellar, and torches everywhere.
"""

import os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FUNC_DIR = os.path.join(ROOT, "ridder_mod", "BP", "functions")

FLOOR = 80           # great-hall floor level
WALL = 28            # keep half-width  -> keep is 57x57 (lekker groot)
COURT = 100          # courtyard half-width -> ~201 wide ("200 breed")


def build_castle(cx, cz, p, mode):
    """Return a list of command lines that build one castle.

    p is a palette dict; mode is "ours" (gold+diamond thrones) or
    "rood" (single red enemy throne)."""
    lines = []

    def c(t):
        lines.append("# " + t)

    # Alles wordt RELATIEF gebouwd t.o.v. de speler (~). cx,cz,FLOOR is het
    # ontwerp-middelpunt; we zetten dat om naar ~-offsets. Zo verschijnt het
    # kasteel om de speler heen, precies waar die staat (geen verre teleport).
    def rxx(x):
        return f"~{x - cx}"

    def ryy(y):
        return f"~{y - FLOOR}"

    def rzz(z):
        return f"~{z - cz}"

    def fill(x1, y1, z1, x2, y2, z2, block):
        lines.append(f"fill {rxx(x1)} {ryy(y1)} {rzz(z1)} {rxx(x2)} {ryy(y2)} {rzz(z2)} {block}")

    def setb(x, y, z, block):
        lines.append(f"setblock {rxx(x)} {ryy(y)} {rzz(z)} {block}")

    def chunk_fill(x1, y1, z1, x2, y2, z2, block, step=30):
        """Split a big fill into tiles <= 27000 blocks (Bedrock /fill limit is 32768)."""
        for xa in range(x1, x2 + 1, step):
            xb = min(xa + step - 1, x2)
            for ya in range(y1, y2 + 1, step):
                yb = min(ya + step - 1, y2)
                for za in range(z1, z2 + 1, step):
                    zb = min(za + step - 1, z2)
                    fill(xa, ya, za, xb, yb, zb, block)

    def torch_ring(y, half, spacing=4):
        for x in range(cx - half + 1, cx + half, spacing):
            setb(x, y, cz - half + 1, p["torch"])
            setb(x, y, cz + half - 1, p["torch"])
        for z in range(cz - half + 1, cz + half, spacing):
            setb(cx - half + 1, y, z, p["torch"])
            setb(cx + half - 1, y, z, p["torch"])

    WALLB = p["wall"]

    c("==========================================================")
    c(f"BOUW HET KASTEEL ({mode}) op {cx},{FLOOR},{cz}")
    c("==========================================================")
    lines.append("gamerule commandblockoutput false")
    lines.append("gamerule dofiretick false")
    lines.append("gamerule mobgriefing false")
    lines.append("scoreboard objectives add rm_state dummy")
    # Houd het kasteel geladen (relatief rond de speler die hier nu staat)
    lines.append(
        f"tickingarea remove {p['area']}")
    lines.append(
        f"tickingarea add ~-{COURT+4} ~-12 ~-{COURT+4} ~{COURT+4} ~118 ~{COURT+4} {p['area']} true")
    if mode == "ours":
        # Anker dat het middelpunt van ONS kasteel onthoudt (voor de aanvallen)
        lines.append("kill @e[type=ridder_mod:kasteel_anker]")
        lines.append("summon ridder_mod:kasteel_anker ~ ~ ~")

    # --- Clear + ground (chunked: Bedrock /fill max is 32768 blocks) ---
    c("Binnenplaats leegmaken (tot muurhoogte) en de grond vlak leggen")
    chunk_fill(cx - COURT, FLOOR, cz - COURT, cx + COURT, FLOOR + 7, cz + COURT, "air")
    chunk_fill(cx - COURT, FLOOR - 1, cz - COURT, cx + COURT, FLOOR - 1, cz + COURT, "grass_block")
    chunk_fill(cx - WALL - 6, FLOOR - 1, cz - WALL - 6, cx + WALL + 6, FLOOR - 1, cz + WALL + 6, p["plaza"])

    # --- Curtain wall ---
    c("=== BUITENMUUR ROND DE BINNENPLAATS (ong. 200 breed) ===")
    WH = FLOOR + 6
    for (x1, z1, x2, z2) in [
        (cx - COURT, cz - COURT, cx + COURT, cz - COURT),
        (cx - COURT, cz + COURT, cx + COURT, cz + COURT),
        (cx - COURT, cz - COURT, cx - COURT, cz + COURT),
        (cx + COURT, cz - COURT, cx + COURT, cz + COURT),
    ]:
        fill(x1, FLOOR, z1, x2, WH, z2, WALLB)
    for x in range(cx - COURT, cx + COURT + 1, 4):
        setb(x, WH + 1, cz - COURT, p["merlon"])
        setb(x, WH + 1, cz + COURT, p["merlon"])
    for z in range(cz - COURT, cz + COURT + 1, 4):
        setb(cx - COURT, WH + 1, z, p["merlon"])
        setb(cx + COURT, WH + 1, z, p["merlon"])
    # Gate faces the OTHER castle: ours gate north (toward enemy), enemy gate south
    gate_z = cz - COURT if mode == "ours" else cz + COURT
    fill(cx - 3, FLOOR, gate_z, cx + 3, FLOOR + 4, gate_z, "air")
    setb(cx - 4, FLOOR + 4, gate_z, p["gate_light"])
    setb(cx + 4, FLOOR + 4, gate_z, p["gate_light"])
    for x in range(cx - COURT + 4, cx + COURT, 12):
        setb(x, FLOOR + 4, cz - COURT + 1, p["torch"])
        setb(x, FLOOR + 4, cz + COURT - 1, p["torch"])

    # --- Keep ---
    c("=== DE KEEP - FUNDERING & 3 VERDIEPINGEN ===")
    floors_y = [FLOOR, FLOOR + 6, FLOOR + 12]
    TOP = FLOOR + 18
    # Clear the whole keep box first (removes any terrain inside), then foundation
    chunk_fill(cx - WALL, FLOOR, cz - WALL, cx + WALL, TOP, cz + WALL, "air")
    fill(cx - WALL, FLOOR - 2, cz - WALL, cx + WALL, FLOOR - 1, cz + WALL, p["foundation"])
    for (x1, z1, x2, z2) in [
        (cx - WALL, cz - WALL, cx + WALL, cz - WALL),
        (cx - WALL, cz + WALL, cx + WALL, cz + WALL),
        (cx - WALL, cz - WALL, cx - WALL, cz + WALL),
        (cx + WALL, cz - WALL, cx + WALL, cz + WALL),
    ]:
        fill(x1, FLOOR, z1, x2, TOP, z2, WALLB)
    for fy in floors_y:
        fill(cx - WALL + 1, fy - 1, cz - WALL + 1, cx + WALL - 1, fy - 1, cz + WALL - 1, WALLB)
    fill(cx - WALL, TOP, cz - WALL, cx + WALL, TOP, cz + WALL, WALLB)
    fill(cx - WALL + 1, FLOOR, cz - WALL + 1, cx + WALL - 1, FLOOR, cz + WALL - 1, p["floor"])

    # Windows
    for fy in floors_y:
        wy = fy + 2
        for x in range(cx - WALL + 4, cx + WALL - 2, 6):
            setb(x, wy, cz - WALL, p["glass"])
            setb(x, wy + 1, cz - WALL, p["glass"])
            setb(x, wy, cz + WALL, p["glass"])
            setb(x, wy + 1, cz + WALL, p["glass"])
        for z in range(cz - WALL + 4, cz + WALL - 2, 6):
            setb(cx - WALL, wy, z, p["glass"])
            setb(cx - WALL, wy + 1, z, p["glass"])
            setb(cx + WALL, wy, z, p["glass"])
            setb(cx + WALL, wy + 1, z, p["glass"])

    # Roof battlements
    for x in range(cx - WALL, cx + WALL + 1, 3):
        setb(x, TOP + 1, cz - WALL, p["merlon"])
        setb(x, TOP + 1, cz + WALL, p["merlon"])
    for z in range(cz - WALL, cz + WALL + 1, 3):
        setb(cx - WALL, TOP + 1, z, p["merlon"])
        setb(cx + WALL, TOP + 1, z, p["merlon"])

    # Keep entrance (faces the courtyard gate side)
    ez = cz - WALL if mode == "ours" else cz + WALL
    fill(cx - 2, FLOOR, ez, cx + 2, FLOOR + 3, ez, "air")
    setb(cx - 3, FLOOR + 4, ez, p["gate_light"])
    setb(cx + 3, FLOOR + 4, ez, p["gate_light"])

    # Veel fakkels: twee ringen per verdieping (laag + hoog)
    for fy in floors_y:
        torch_ring(fy + 2, WALL)
        torch_ring(fy + 4, WALL)
    # Hangende lantaarns als kroonluchters in de grote hal
    for dx in (-12, -6, 0, 6, 12):
        for dz in (-12, -6, 0, 6, 12):
            setb(cx + dx, FLOOR + 5, cz + dz, p["lantern"])
    # Staande fakkels op hekpalen door de hal heen
    for dx in (-WALL + 4, 0, WALL - 4):
        for dz in (-WALL + 4, 0, WALL - 4):
            setb(cx + dx, FLOOR + 1, cz + dz, "oak_fence")
            setb(cx + dx, FLOOR + 2, cz + dz, "torch")

    # Staircase holes + stairs (NW corner)
    for fy in floors_y[1:]:
        fill(cx - WALL + 2, fy - 1, cz - WALL + 2, cx - WALL + 4, fy - 1, cz - WALL + 4, "air")
    sx, sz = cx - WALL + 3, cz - WALL + 3
    for step in range(0, 18):
        setb(sx, FLOOR + step, sz, p["stairs"])
        if step % 2 == 0:
            sx += 1
        else:
            sz += 1
        if sx > cx - WALL + 6:
            sx = cx - WALL + 3
        if sz > cz - WALL + 6:
            sz = cz - WALL + 3

    # Towers + spire
    c("=== 4 HOGE HOEKTORENS + CENTRALE SPITS (tot ~100 hoog) ===")
    TOWER_TOP = FLOOR + 70
    for (tx, tz) in [(cx - WALL, cz - WALL), (cx + WALL, cz - WALL),
                     (cx - WALL, cz + WALL), (cx + WALL, cz + WALL)]:
        fill(tx - 2, FLOOR, tz - 2, tx + 2, TOWER_TOP, tz + 2, WALLB)
        fill(tx - 1, FLOOR, tz - 1, tx + 1, TOWER_TOP, tz + 1, "air")
        # Vloer-plateau bovenop de toren (zodat boogschutters er kunnen staan)
        fill(tx - 1, TOWER_TOP, tz - 1, tx + 1, TOWER_TOP, tz + 1, WALLB)
        setb(tx - 1, TOWER_TOP + 1, tz - 1, p["torch"])
        setb(tx + 1, TOWER_TOP + 1, tz + 1, p["torch"])
        for ddx in (-2, 0, 2):
            setb(tx + ddx, TOWER_TOP + 1, tz - 2, p["merlon"])
            setb(tx + ddx, TOWER_TOP + 1, tz + 2, p["merlon"])
        for ddz in (-2, 0, 2):
            setb(tx - 2, TOWER_TOP + 1, tz + ddz, p["merlon"])
            setb(tx + 2, TOWER_TOP + 1, tz + ddz, p["merlon"])
        setb(tx, TOWER_TOP + 2, tz, "oak_fence")
        setb(tx, TOWER_TOP + 3, tz, "oak_fence")
        setb(tx + 1, TOWER_TOP + 3, tz, p["flag"])
        setb(tx + 1, TOWER_TOP + 2, tz, p["flag"])
        setb(tx, TOWER_TOP, tz, p["spire_light"])
        for y in range(FLOOR + 4, TOWER_TOP, 8):
            setb(tx, y, tz - 2, p["torch"])

    SPIRE_TOP = FLOOR + 100
    fill(cx - 1, TOP, cz - 1, cx + 1, SPIRE_TOP, cz + 1, WALLB)
    fill(cx, TOP, cz, cx, SPIRE_TOP, cz, "air")
    setb(cx, SPIRE_TOP, cz, p["spire_light"])
    setb(cx, SPIRE_TOP + 1, cz, "oak_fence")
    setb(cx, SPIRE_TOP + 2, cz, "oak_fence")
    setb(cx + 1, SPIRE_TOP + 2, cz, p["flag"])
    setb(cx + 1, SPIRE_TOP + 1, cz, p["flag"])

    # Throne room
    c("=== TROONZAAL ===")
    DAIS_Z = cz + WALL - 4
    fill(cx - 6, FLOOR, DAIS_Z - 1, cx + 6, FLOOR, DAIS_Z + 2, p["floor"])
    fill(cx - 6, FLOOR + 1, DAIS_Z, cx + 6, FLOOR + 1, DAIS_Z + 2, p["stairs"])
    fill(cx - 5, FLOOR + 1, DAIS_Z + 1, cx + 5, FLOOR + 1, DAIS_Z + 2, p["floor"])

    def throne(tx, block):
        # Een echte stoelvorm (GEEN glas): hoge rugleuning, zitting met
        # kussen (tapijt), armleuningen en wat fakkels/lantaarns als licht.
        # Hoge rugleuning
        fill(tx - 1, FLOOR + 2, DAIS_Z + 2, tx + 1, FLOOR + 6, DAIS_Z + 2, block)
        setb(tx, FLOOR + 7, DAIS_Z + 2, block)             # kroontje bovenop
        # Zitting + kussen
        setb(tx, FLOOR + 2, DAIS_Z + 1, block)
        setb(tx, FLOOR + 3, DAIS_Z + 1, "red_carpet")      # zacht kussen
        # Armleuningen links en rechts
        setb(tx - 1, FLOOR + 2, DAIS_Z + 1, block)
        setb(tx + 1, FLOOR + 2, DAIS_Z + 1, block)
        setb(tx - 1, FLOOR + 3, DAIS_Z + 1, block)
        setb(tx + 1, FLOOR + 3, DAIS_Z + 1, block)
        # Voetenbankje / trede ervoor
        setb(tx, FLOOR + 1, DAIS_Z, p["stairs"])
        # Licht: lantaarns en fakkels (geen glas!)
        setb(tx - 2, FLOOR + 4, DAIS_Z + 2, "lantern")
        setb(tx + 2, FLOOR + 4, DAIS_Z + 2, "lantern")
        setb(tx - 2, FLOOR + 3, DAIS_Z + 1, "torch")
        setb(tx + 2, FLOOR + 3, DAIS_Z + 1, "torch")
        setb(tx, FLOOR + 8, DAIS_Z + 2, "torch")

    if mode == "ours":
        throne(cx - 3, "gold_block")      # gouden troon (koning)
        throne(cx + 3, "diamond_block")   # diamanten troon (prins)
    else:
        throne(cx, "redstone_block")      # rode vijandtroon
        setb(cx - 2, FLOOR + 2, DAIS_Z + 2, "red_concrete")
        setb(cx + 2, FLOOR + 2, DAIS_Z + 2, "red_concrete")

    # Bedroom: a big enclosed room (front-left) + long red carpet to the throne
    c("=== GROTE SLAAPKAMER + LANG ROOD TAPIJT NAAR DE TROON ===")
    BRX, BRZ = cx - 10, cz - WALL + 9
    for (x1, z1, x2, z2) in [
        (BRX - 5, BRZ - 5, BRX + 5, BRZ - 5),
        (BRX - 5, BRZ + 5, BRX + 5, BRZ + 5),
        (BRX - 5, BRZ - 5, BRX - 5, BRZ + 5),
        (BRX + 5, BRZ - 5, BRX + 5, BRZ + 5),
    ]:
        fill(x1, FLOOR + 1, z1, x2, FLOOR + 4, z2, WALLB)
    # carpet floor inside, then beds + furniture on top
    fill(BRX - 4, FLOOR + 1, BRZ - 4, BRX + 4, FLOOR + 1, BRZ + 4, "red_carpet")
    # doorway toward the centre (+x wall)
    setb(BRX + 5, FLOOR + 1, BRZ, "air")
    setb(BRX + 5, FLOOR + 2, BRZ, "air")
    # two royal beds with headboards
    for bx in (BRX - 3, BRX + 3):
        setb(bx, FLOOR + 1, BRZ - 3, "red_wool")
        setb(bx, FLOOR + 1, BRZ - 2, "red_wool")
        setb(bx, FLOOR + 2, BRZ - 4, "dark_oak_planks")
    # bookshelves, chests, table
    for bx in (BRX - 1, BRX, BRX + 1):
        setb(bx, FLOOR + 1, BRZ + 4, "bookshelf")
    setb(BRX - 4, FLOOR + 1, BRZ + 4, "chest")
    setb(BRX + 4, FLOOR + 1, BRZ + 4, "chest")
    setb(BRX, FLOOR + 1, BRZ, "crafting_table")
    # plenty of light (lanterns + torches, no glass)
    setb(BRX - 4, FLOOR + 3, BRZ - 4, "lantern")
    setb(BRX + 4, FLOOR + 3, BRZ - 4, "lantern")
    setb(BRX - 4, FLOOR + 3, BRZ + 4, "torch")
    setb(BRX + 4, FLOOR + 3, BRZ + 4, "torch")
    setb(BRX, FLOOR + 4, BRZ, "lantern")
    # the long red carpet from the bedroom door to the throne dais
    for z in range(BRZ, DAIS_Z + 1):
        setb(cx, FLOOR + 1, z, "red_carpet")
        setb(cx - 1, FLOOR + 1, z, "red_carpet")
        setb(cx + 1, FLOOR + 1, z, "red_carpet")
    for x in range(BRX + 5, cx + 2):
        setb(x, FLOOR + 1, BRZ, "red_carpet")
        setb(x, FLOOR + 1, BRZ + 1, "red_carpet")
    # torches lining the carpet
    for z in range(BRZ, DAIS_Z, 5):
        setb(cx - 3, FLOOR + 3, z, "torch")
        setb(cx + 3, FLOOR + 3, z, "torch")

    # Kitchen: a big enclosed room (back-right) with a long counter
    c("=== GROTE KEUKEN (achter-rechts) ===")
    KX, KZ = cx + 11, cz + WALL - 10
    for (x1, z1, x2, z2) in [
        (KX - 5, KZ - 5, KX + 5, KZ - 5),
        (KX - 5, KZ + 5, KX + 5, KZ + 5),
        (KX - 5, KZ - 5, KX - 5, KZ + 5),
        (KX + 5, KZ - 5, KX + 5, KZ + 5),
    ]:
        fill(x1, FLOOR + 1, z1, x2, FLOOR + 4, z2, WALLB)
    setb(KX - 5, FLOOR + 1, KZ, "air")   # doorway (-x wall)
    setb(KX - 5, FLOOR + 2, KZ, "air")
    # long counter of ovens
    for i, bx in enumerate(range(KX - 4, KX + 5)):
        setb(bx, FLOOR + 1, KZ - 4, "furnace" if i % 2 == 0 else "smoker")
    # work tables + pots
    for bx in range(KX - 4, KX + 5, 2):
        setb(bx, FLOOR + 1, KZ - 2, "crafting_table")
    setb(KX - 3, FLOOR + 1, KZ, "cauldron")
    setb(KX - 1, FLOOR + 1, KZ, "cauldron")
    setb(KX + 1, FLOOR + 1, KZ, "barrel")
    setb(KX + 3, FLOOR + 1, KZ, "barrel")
    setb(KX, FLOOR + 1, KZ - 2, "cake")
    setb(KX + 4, FLOOR + 1, KZ + 4, "chest")
    setb(KX - 4, FLOOR + 1, KZ + 4, "chest")
    # Een brandend kampvuur (rookt continu) waar de kok soep op kookt
    setb(KX, FLOOR + 1, KZ + 2, "campfire")
    setb(KX - 1, FLOOR + 1, KZ + 2, "cauldron")
    setb(KX + 1, FLOOR + 1, KZ + 2, "cauldron")
    # plenty of light
    setb(KX - 4, FLOOR + 3, KZ - 4, "lantern")
    setb(KX + 4, FLOOR + 3, KZ - 4, "lantern")
    setb(KX, FLOOR + 4, KZ, "lantern")
    setb(KX - 4, FLOOR + 3, KZ + 4, "torch")
    setb(KX + 4, FLOOR + 3, KZ + 4, "torch")

    # Middle floor: dining + workshop
    c("=== MIDDEN-VERDIEPING: EETKAMER + WERKPLAATS ===")
    F1 = floors_y[1]
    for x in range(cx - 5, cx + 6):
        setb(x, F1 + 1, cz, "dark_oak_slab")
    for x in range(cx - 5, cx + 6, 2):
        setb(x, F1 + 1, cz - 1, "dark_oak_stairs")
        setb(x, F1 + 1, cz + 1, "dark_oak_stairs")
    setb(cx, F1 + 2, cz, p["lantern"])
    WX, WZ = cx + WALL - 6, cz + WALL - 6
    setb(WX, F1 + 1, WZ, "crafting_table")
    setb(WX - 1, F1 + 1, WZ, "anvil")
    setb(WX + 1, F1 + 1, WZ, "grindstone")
    setb(WX, F1 + 1, WZ - 1, "brewing_stand")
    setb(WX - 1, F1 + 1, WZ - 1, "cartography_table")
    setb(WX + 1, F1 + 1, WZ - 1, "redstone_block")
    setb(WX, F1 + 1, WZ - 2, "lectern")

    # The inventor's catapult on the courtyard (ours only), aimed north
    if mode == "ours":
        c("=== KATAPULT VAN DE UITVINDER (binnenplaats, noordkant) ===")
        catx, catz = cx + 14, cz - 52
        # wooden base + wheels
        fill(catx - 2, FLOOR, catz - 1, catx + 2, FLOOR, catz + 1, "oak_planks")
        setb(catx - 2, FLOOR, catz - 1, "oak_log")
        setb(catx - 2, FLOOR, catz + 1, "oak_log")
        setb(catx + 2, FLOOR, catz - 1, "oak_log")
        setb(catx + 2, FLOOR, catz + 1, "oak_log")
        # throwing arm (fences going up and leaning north) + bucket
        setb(catx, FLOOR + 1, catz + 1, "oak_fence")
        setb(catx, FLOOR + 2, catz + 1, "oak_fence")
        setb(catx, FLOOR + 3, catz, "oak_fence")
        setb(catx, FLOOR + 4, catz - 1, "cauldron")   # the "bucket"
        # a dispenser-looking launcher + redstone flair (inventor's gadget)
        setb(catx, FLOOR + 1, catz - 1, "dropper")
        setb(catx - 1, FLOOR + 1, catz, "redstone_block")
        setb(catx + 1, FLOOR + 1, catz, "redstone_lamp")
        setb(catx, FLOOR + 5, catz - 1, "torch")

        # Vijand-spawnplatform: een vlak plein net buiten de noordpoort,
        # op HETZELFDE grondniveau als de binnenplaats.
        c("=== VIJAND SPAWN-PLATFORM (buiten de noordpoort) ===")
        pz1, pz2 = cz - COURT - 24, cz - COURT - 1
        chunk_fill(cx - 18, FLOOR, pz1 - 1, cx + 18, FLOOR + 4, pz2 + 1, "air")
        chunk_fill(cx - 17, FLOOR - 1, pz1, cx + 17, FLOOR - 1, pz2, p["plaza"])
        # lage rand zodat ze er niet afvallen
        fill(cx - 17, FLOOR, pz1, cx + 17, FLOOR, pz1, p["wall"])
        fill(cx - 17, FLOOR, pz1, cx - 17, FLOOR, pz2, p["wall"])
        fill(cx + 17, FLOOR, pz1, cx + 17, FLOOR, pz2, p["wall"])
        # fakkels op de hoeken
        setb(cx - 17, FLOOR + 1, pz1, p["torch"])
        setb(cx + 17, FLOOR + 1, pz1, p["torch"])
        # bordje-blok in het midden
        setb(cx, FLOOR, pz1 + 1, "redstone_lamp")

    # Top floor: bedrooms
    c("=== BOVENSTE VERDIEPING: EXTRA SLAAPKAMERS ===")
    F2 = floors_y[2]
    for (bx, bz) in [(cx - WALL + 5, cz - WALL + 5), (cx + WALL - 5, cz - WALL + 5),
                     (cx - WALL + 5, cz + WALL - 5), (cx + WALL - 5, cz + WALL - 5)]:
        setb(bx, F2 + 1, bz, "red_wool")
        setb(bx, F2 + 1, bz + 1, "red_wool")
        setb(bx, F2 + 4, bz, p["lantern"])

    # Cellar
    c("=== KELDER ===")
    CELL_Y = FLOOR - 8
    fill(cx - 10, CELL_Y, cz - 10, cx + 10, CELL_Y + 5, cz + 10, "air")
    fill(cx - 11, CELL_Y - 1, cz - 11, cx + 11, CELL_Y - 1, cz + 11, p["cellar"])
    for (x1, z1, x2, z2) in [
        (cx - 11, cz - 11, cx + 11, cz - 11), (cx - 11, cz + 11, cx + 11, cz + 11),
        (cx - 11, cz - 11, cx - 11, cz + 11), (cx + 11, cz - 11, cx + 11, cz + 11),
    ]:
        fill(x1, CELL_Y, z1, x2, CELL_Y + 5, z2, p["cellar"])
    fill(cx - 11, CELL_Y + 6, cz - 11, cx + 11, CELL_Y + 6, cz + 11, WALLB)
    dsx, dsz = cx + WALL - 4, cz - WALL + 4
    for step in range(0, 9):
        setb(dsx, FLOOR - step, dsz + step, p["stairs"])
        setb(dsx, FLOOR - step + 1, dsz + step, "air")
        setb(dsx, FLOOR - step + 2, dsz + step, "air")
    for dx in (-8, -4, 0, 4, 8):
        for dz in (-8, 0, 8):
            setb(cx + dx, CELL_Y + 1, cz + dz, "barrel")
    setb(cx - 6, CELL_Y + 1, cz - 6, "chest")
    setb(cx + 6, CELL_Y + 1, cz + 6, "chest")
    for dx in (-9, 0, 9):
        for dz in (-9, 0, 9):
            setb(cx + dx, CELL_Y + 4, cz + dz, p["torch"])

    return lines


# NB: alle block-id's hieronder zijn Bedrock-namen die de bestaande, werkende
# mods in deze repo ook gebruiken (stone_bricks, stone_brick_wall, nether_brick
# (enkelvoud!), red_concrete, sea_lantern, soul_lantern, ...). Gebruik GEEN
# Java-namen zoals "red_nether_bricks" of "cobblestone_wall".
OUR = {
    "wall": "stone_bricks", "floor": "polished_andesite", "foundation": "stone_bricks",
    "cellar": "cobblestone", "merlon": "stone_brick_wall", "plaza": "stone_bricks",
    "stairs": "stone_brick_stairs", "glass": "glass_pane", "torch": "torch",
    "lantern": "lantern", "spire_light": "sea_lantern", "flag": "red_wool",
    "gate_light": "sea_lantern", "area": "ridder_kasteel",
}
ROOD = {
    "wall": "red_concrete", "floor": "red_nether_brick", "foundation": "red_nether_brick",
    "cellar": "netherrack", "merlon": "stone_brick_wall", "plaza": "red_nether_brick",
    "stairs": "stone_brick_stairs", "glass": "red_stained_glass", "torch": "torch",
    "lantern": "soul_lantern", "spire_light": "sea_lantern", "flag": "black_wool",
    "gate_light": "soul_lantern", "area": "rood_kasteel",
}


def write(name, lines):
    out = os.path.join(FUNC_DIR, name)
    with open(out, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(lines) + "\n")
    print(f"wrote {out} ({len(lines)} lines)")


our = build_castle(2000, 2000, OUR, "ours")
our.append("scoreboard players set rmKasteel rm_state 1")
write("build_kasteel.mcfunction", our)

rood = build_castle(2000, 1700, ROOD, "rood")
rood.append("scoreboard players set rmRood rm_state 1")
write("build_rood_kasteel.mcfunction", rood)
