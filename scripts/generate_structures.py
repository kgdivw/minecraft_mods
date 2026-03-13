"""Generate .mcstructure files for Minecraft Bedrock Edition.

.mcstructure files use NBT (Named Binary Tag) format, little-endian variant.
This script generates simple structures: a ninja temple, castle, and shop.
"""

import struct
import io
import os

# NBT Tag types
TAG_END = 0
TAG_BYTE = 1
TAG_SHORT = 2
TAG_INT = 3
TAG_LONG = 4
TAG_FLOAT = 5
TAG_DOUBLE = 6
TAG_BYTE_ARRAY = 7
TAG_STRING = 8
TAG_LIST = 9
TAG_COMPOUND = 10
TAG_INT_ARRAY = 11
TAG_LONG_ARRAY = 12


class NBTWriter:
    """Write NBT data in little-endian format (Bedrock Edition)."""

    def __init__(self):
        self.buf = io.BytesIO()

    def write_byte(self, val):
        self.buf.write(struct.pack("<b", val))

    def write_short(self, val):
        self.buf.write(struct.pack("<h", val))

    def write_int(self, val):
        self.buf.write(struct.pack("<i", val))

    def write_long(self, val):
        self.buf.write(struct.pack("<q", val))

    def write_float(self, val):
        self.buf.write(struct.pack("<f", val))

    def write_string(self, val):
        encoded = val.encode("utf-8")
        self.write_short(len(encoded))
        self.buf.write(encoded)

    def write_tag_header(self, tag_type, name):
        self.write_byte(tag_type)
        self.write_string(name)

    def write_tag_byte(self, name, val):
        self.write_tag_header(TAG_BYTE, name)
        self.write_byte(val)

    def write_tag_short(self, name, val):
        self.write_tag_header(TAG_SHORT, name)
        self.write_short(val)

    def write_tag_int(self, name, val):
        self.write_tag_header(TAG_INT, name)
        self.write_int(val)

    def write_tag_long(self, name, val):
        self.write_tag_header(TAG_LONG, name)
        self.write_long(val)

    def write_tag_float(self, name, val):
        self.write_tag_header(TAG_FLOAT, name)
        self.write_float(val)

    def write_tag_string(self, name, val):
        self.write_tag_header(TAG_STRING, name)
        self.write_string(val)

    def write_tag_int_array(self, name, values):
        self.write_tag_header(TAG_INT_ARRAY, name)
        self.write_int(len(values))
        for v in values:
            self.write_int(v)

    def begin_compound(self, name):
        self.write_tag_header(TAG_COMPOUND, name)

    def end_compound(self):
        self.write_byte(TAG_END)

    def begin_list(self, name, element_type, length):
        self.write_tag_header(TAG_LIST, name)
        self.write_byte(element_type)
        self.write_int(length)

    def write_inline_compound_start(self):
        """Start a compound inside a list (no header needed)."""
        pass  # list compounds don't have headers

    def write_inline_compound_end(self):
        self.write_byte(TAG_END)

    def get_bytes(self):
        return self.buf.getvalue()


def create_mcstructure(size_x, size_y, size_z, blocks, block_palette,
                       chest_positions=None, spawner_positions=None,
                       origin=(0, 0, 0)):
    """Create a complete .mcstructure file.

    blocks: 3D array indexed as blocks[x][y][z] = palette_index
    block_palette: list of block name strings
    chest_positions: list of (x, y, z, loot_table_path) tuples for chests
    spawner_positions: list of (x, y, z, entity_id) tuples for mob spawners
    """
    w = NBTWriter()

    # Root compound
    w.begin_compound("")

    # Format version
    w.write_tag_int("format_version", 1)

    # Size
    w.begin_list("size", TAG_INT, 3)
    w.write_int(size_x)
    w.write_int(size_y)
    w.write_int(size_z)

    # Structure origin
    w.begin_list("structure_world_origin", TAG_INT, 3)
    w.write_int(origin[0])
    w.write_int(origin[1])
    w.write_int(origin[2])

    # Structure compound
    w.begin_compound("structure")

    # Block indices - two layers (primary and secondary/waterlogged)
    w.begin_list("block_indices", TAG_LIST, 2)

    # Flatten blocks array: iterate x, y, z
    flat_blocks = []
    for x in range(size_x):
        for y in range(size_y):
            for z in range(size_z):
                flat_blocks.append(blocks[x][y][z])

    # First layer (primary blocks)
    w.write_byte(TAG_INT)
    w.write_int(len(flat_blocks))
    for b in flat_blocks:
        w.write_int(b)

    # Second layer (all -1, no waterlogging)
    w.write_byte(TAG_INT)
    w.write_int(len(flat_blocks))
    for _ in flat_blocks:
        w.write_int(-1)

    # Entities (empty list)
    w.begin_list("entities", TAG_COMPOUND, 0)

    # Palette compound
    w.begin_compound("palette")
    w.begin_compound("default")

    # Block palette
    w.begin_list("block_palette", TAG_COMPOUND, len(block_palette))
    for block_name in block_palette:
        w.write_tag_string("name", block_name)
        w.begin_compound("states")
        w.end_compound()  # states
        w.write_tag_int("version", 18090528)
        w.write_inline_compound_end()  # palette entry

    # Block position data (chest loot tables)
    w.begin_compound("block_position_data")

    if chest_positions:
        for cx, cy, cz, loot_table in chest_positions:
            flat_index = cx * (size_y * size_z) + cy * size_z + cz
            w.begin_compound(str(flat_index))
            w.begin_compound("block_entity_data")
            w.write_tag_string("LootTable", loot_table)
            w.write_tag_long("LootTableSeed", 0)
            w.write_tag_string("id", "Chest")
            w.write_tag_byte("isMovable", 1)
            w.write_tag_int("x", cx)
            w.write_tag_int("y", cy)
            w.write_tag_int("z", cz)
            w.end_compound()  # block_entity_data
            w.end_compound()  # flat_index

    if spawner_positions:
        for sx_pos, sy_pos, sz_pos, entity_id in spawner_positions:
            flat_index = sx_pos * (size_y * size_z) + sy_pos * size_z + sz_pos
            w.begin_compound(str(flat_index))
            w.begin_compound("block_entity_data")
            w.write_tag_string("EntityIdentifier", entity_id)
            w.write_tag_string("id", "MobSpawner")
            w.write_tag_byte("isMovable", 1)
            w.write_tag_short("Delay", 20)
            w.write_tag_short("MinSpawnDelay", 200)
            w.write_tag_short("MaxSpawnDelay", 800)
            w.write_tag_short("SpawnCount", 1)
            w.write_tag_short("MaxNearbyEntities", 4)
            w.write_tag_short("RequiredPlayerRange", 16)
            w.write_tag_short("SpawnRange", 4)
            w.write_tag_int("x", sx_pos)
            w.write_tag_int("y", sy_pos)
            w.write_tag_int("z", sz_pos)
            w.end_compound()  # block_entity_data
            w.end_compound()  # flat_index

    w.end_compound()  # block_position_data

    w.end_compound()  # default
    w.end_compound()  # palette

    w.end_compound()  # structure
    w.end_compound()  # root

    return w.get_bytes()


def create_3d_array(sx, sy, sz, default=-1):
    return [[[default for _ in range(sz)] for _ in range(sy)] for _ in range(sx)]


# Block palette indices (shared across structures)
AIR = -1  # -1 means air/no block


def generate_ninja_temple(output_path):
    """Generate a 11x8x11 ninja temple with pillars, chests, and open design."""
    sx, sy, sz = 11, 8, 11

    palette = [
        "minecraft:stone_bricks",       # 0
        "minecraft:mossy_stone_bricks",  # 1
        "minecraft:stone_brick_stairs",  # 2
        "minecraft:lantern",             # 3
        "minecraft:dark_oak_planks",     # 4
        "minecraft:dark_oak_slab",       # 5
        "minecraft:chest",              # 6
        "minecraft:mob_spawner",        # 7
    ]

    blocks = create_3d_array(sx, sy, sz)

    # Floor (y=0): stone bricks with some mossy
    for x in range(sx):
        for z in range(sz):
            blocks[x][0][z] = 0
            if (x + z) % 5 == 0:
                blocks[x][0][z] = 1

    # Pillars at corners and mid-edges (y=1 to y=5)
    pillar_positions = [
        (0, 0), (0, 10), (10, 0), (10, 10),  # corners
        (5, 0), (5, 10), (0, 5), (10, 5),      # mid-edges
    ]
    for px, pz in pillar_positions:
        for y in range(1, 6):
            blocks[px][y][pz] = 0

    # Roof (y=6): dark oak planks
    for x in range(sx):
        for z in range(sz):
            blocks[x][6][z] = 4

    # Roof edge (y=7): slabs
    for x in range(sx):
        blocks[x][7][0] = 5
        blocks[x][7][10] = 5
    for z in range(sz):
        blocks[0][7][z] = 5
        blocks[10][7][z] = 5

    # Lanterns hanging from roof (y=5)
    lantern_positions = [(3, 3), (3, 7), (7, 3), (7, 7), (5, 5)]
    for lx, lz in lantern_positions:
        blocks[lx][5][lz] = 3

    # Steps at entrance (z=0 side, y=0)
    for x in range(3, 8):
        blocks[x][0][0] = 2

    # Chests with ninja loot (y=1)
    chest_loot = "loot_tables/chests/ninja_temple_chest.json"
    blocks[2][1][9] = 6  # back left
    blocks[8][1][9] = 6  # back right
    blocks[5][1][5] = 6  # center

    chest_positions = [
        (2, 1, 9, chest_loot),
        (8, 1, 9, chest_loot),
        (5, 1, 5, chest_loot),
    ]

    # Good ninja spawner in the temple center
    blocks[5][1][3] = 7
    spawner_positions = [
        (5, 1, 3, "custom:good_ninja"),
    ]

    data = create_mcstructure(sx, sy, sz, blocks, palette, chest_positions,
                              spawner_positions)
    with open(output_path, "wb") as f:
        f.write(data)
    print(f"Created temple: {output_path} ({len(data)} bytes)")


def generate_ninja_castle(output_path):
    """Generate a 15x12x15 ninja castle with walls, towers, throne, and chests."""
    sx, sy, sz = 15, 12, 15

    palette = [
        "minecraft:stone_bricks",       # 0
        "minecraft:mossy_stone_bricks",  # 1
        "minecraft:dark_oak_planks",     # 2
        "minecraft:dark_oak_slab",       # 3
        "minecraft:lantern",             # 4
        "minecraft:dark_oak_fence",      # 5
        "minecraft:gold_block",          # 6
        "minecraft:red_carpet",          # 7
        "minecraft:obsidian",            # 8
        "minecraft:chest",              # 9
        "minecraft:mob_spawner",        # 10
    ]

    blocks = create_3d_array(sx, sy, sz)

    # Floor (y=0)
    for x in range(sx):
        for z in range(sz):
            blocks[x][0][z] = 0

    # Carpet path to throne (z=2 to z=12, center x=7)
    for z in range(2, 13):
        blocks[7][0][z] = 7

    # Walls (y=1 to y=6) - perimeter
    for y in range(1, 7):
        for x in range(sx):
            blocks[x][y][0] = 0
            blocks[x][y][14] = 0
        for z in range(sz):
            blocks[0][y][z] = 0
            blocks[14][y][z] = 0

    # Gate opening (front wall z=0, x=6-8, y=1-4)
    for x in range(6, 9):
        for y in range(1, 5):
            blocks[x][y][0] = -1  # air

    # Corner towers (taller, y=1 to y=9)
    tower_corners = [(0, 0), (0, 14), (14, 0), (14, 14)]
    for tx, tz in tower_corners:
        for y in range(1, 10):
            blocks[tx][y][tz] = 8  # obsidian towers
            for dx in [-1, 0, 1]:
                for dz in [-1, 0, 1]:
                    nx, nz = tx + dx, tz + dz
                    if 0 <= nx < sx and 0 <= nz < sz:
                        if blocks[nx][y][nz] == -1:
                            blocks[nx][y][nz] = 0

    # Throne at back (z=12-13, x=6-8)
    for x in range(6, 9):
        blocks[x][1][13] = 6  # gold base
        blocks[x][2][13] = 6  # gold back
    blocks[7][3][13] = 6  # gold top center

    # Roof (y=7): planks over the interior
    for x in range(1, 14):
        for z in range(1, 14):
            blocks[x][7][z] = 2

    # Battlements (y=7 on walls)
    for x in range(sx):
        if x % 2 == 0:
            blocks[x][7][0] = 0
            blocks[x][7][14] = 0
    for z in range(sz):
        if z % 2 == 0:
            blocks[0][7][z] = 0
            blocks[14][7][z] = 0

    # Fences on top of walls (y=7)
    for x in range(sx):
        if x % 2 == 1:
            blocks[x][7][0] = 5
            blocks[x][7][14] = 5
    for z in range(sz):
        if z % 2 == 1:
            blocks[0][7][z] = 5
            blocks[14][7][z] = 5

    # Lanterns inside
    lantern_positions = [(4, 4), (4, 10), (10, 4), (10, 10), (7, 7)]
    for lx, lz in lantern_positions:
        blocks[lx][6][lz] = 4

    # Chests with castle loot (y=1) - near throne and in corners
    chest_loot = "loot_tables/chests/ninja_castle_chest.json"
    blocks[5][1][12] = 9   # left of throne
    blocks[9][1][12] = 9   # right of throne
    blocks[2][1][2] = 9    # front left corner
    blocks[12][1][2] = 9   # front right corner
    blocks[7][1][7] = 9    # center

    chest_positions = [
        (5, 1, 12, chest_loot),
        (9, 1, 12, chest_loot),
        (2, 1, 2, chest_loot),
        (12, 1, 2, chest_loot),
        (7, 1, 7, chest_loot),
    ]

    # Mob spawners: ninja king near throne, bad ninjas at patrol points
    blocks[7][1][11] = 10   # king spawner near throne
    blocks[3][1][3] = 10    # bad ninja spawner front left
    blocks[11][1][3] = 10   # bad ninja spawner front right

    spawner_positions = [
        (7, 1, 11, "custom:ninja_king"),
        (3, 1, 3, "custom:bad_ninja"),
        (11, 1, 3, "custom:bad_ninja"),
    ]

    data = create_mcstructure(sx, sy, sz, blocks, palette, chest_positions,
                              spawner_positions)
    with open(output_path, "wb") as f:
        f.write(data)
    print(f"Created castle: {output_path} ({len(data)} bytes)")


def generate_ninja_shop(output_path):
    """Generate a 7x6x7 ninja shop - small wooden building with chests."""
    sx, sy, sz = 7, 6, 7

    palette = [
        "minecraft:oak_planks",          # 0
        "minecraft:cobblestone",         # 1
        "minecraft:oak_slab",            # 2
        "minecraft:glass_pane",          # 3
        "minecraft:lantern",             # 4
        "minecraft:oak_fence",           # 5
        "minecraft:chest",              # 6
        "minecraft:mob_spawner",        # 7
    ]

    blocks = create_3d_array(sx, sy, sz)

    # Floor (y=0): cobblestone
    for x in range(sx):
        for z in range(sz):
            blocks[x][0][z] = 1

    # Walls (y=1 to y=3): oak planks
    for y in range(1, 4):
        for x in range(sx):
            blocks[x][y][0] = 0
            blocks[x][y][6] = 0
        for z in range(sz):
            blocks[0][y][z] = 0
            blocks[6][y][z] = 0

    # Door opening (front z=0, x=3, y=1-2)
    blocks[3][1][0] = -1
    blocks[3][2][0] = -1

    # Windows (glass panes, y=2)
    blocks[1][2][0] = 3  # front windows
    blocks[5][2][0] = 3
    blocks[0][2][3] = 3  # side windows
    blocks[6][2][3] = 3

    # Roof (y=4): oak planks
    for x in range(sx):
        for z in range(sz):
            blocks[x][4][z] = 0

    # Roof peak (y=5): slabs along center
    for z in range(sz):
        blocks[3][5][z] = 2

    # Chests with shop loot (y=1) - along back wall
    chest_loot = "loot_tables/chests/ninja_shop_chest.json"
    blocks[2][1][5] = 6
    blocks[3][1][5] = 6
    blocks[4][1][5] = 6

    chest_positions = [
        (2, 1, 5, chest_loot),
        (3, 1, 5, chest_loot),
        (4, 1, 5, chest_loot),
    ]

    # Lantern inside
    blocks[3][3][3] = 4

    # Good ninja spawner (shopkeeper)
    blocks[3][1][3] = 7
    spawner_positions = [
        (3, 1, 3, "custom:good_ninja"),
    ]

    # Fence posts outside (shop sign posts)
    blocks[2][1][0] = 5
    blocks[4][1][0] = 5

    data = create_mcstructure(sx, sy, sz, blocks, palette, chest_positions,
                              spawner_positions)
    with open(output_path, "wb") as f:
        f.write(data)
    print(f"Created shop: {output_path} ({len(data)} bytes)")


if __name__ == "__main__":
    base = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    struct_dir = os.path.join(base, "ninja_mod", "BP", "structures")
    os.makedirs(struct_dir, exist_ok=True)

    generate_ninja_temple(os.path.join(struct_dir, "ninja_temple.mcstructure"))
    generate_ninja_castle(os.path.join(struct_dir, "ninja_castle.mcstructure"))
    generate_ninja_shop(os.path.join(struct_dir, "ninja_shop.mcstructure"))
    print("All structures generated!")
