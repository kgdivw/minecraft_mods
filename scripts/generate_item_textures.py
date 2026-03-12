"""Generate 16x16 pixel item textures for ninja items."""
import struct
import zlib
import os


def create_png(width, height, pixels):
    """Create a PNG file from pixel data. pixels[y][x] = (r, g, b, a)"""
    def chunk(chunk_type, data):
        c = chunk_type + data
        crc = struct.pack(">I", zlib.crc32(c) & 0xFFFFFFFF)
        return struct.pack(">I", len(data)) + c + crc

    header = b'\x89PNG\r\n\x1a\n'
    ihdr = chunk(b'IHDR', struct.pack(">IIBBBBB", width, height, 8, 6, 0, 0, 0))

    raw = b''
    for y in range(height):
        raw += b'\x00'
        for x in range(width):
            r, g, b, a = pixels[y][x]
            raw += struct.pack("BBBB", r, g, b, a)

    idat = chunk(b'IDAT', zlib.compress(raw))
    iend = chunk(b'IEND', b'')
    return header + ihdr + idat + iend


def transparent():
    return (0, 0, 0, 0)


def generate_katana():
    """Iron katana - long thin blade, dark handle."""
    px = [[transparent() for _ in range(16)] for _ in range(16)]
    # Blade (silver/white, diagonal from top-right to center)
    blade = (200, 210, 220, 255)
    blade_edge = (230, 235, 240, 255)
    for i in range(9):
        x, y = 14 - i, 1 + i
        if 0 <= x < 16 and 0 <= y < 16:
            px[y][x] = blade_edge
        if 0 <= x-1 < 16 and 0 <= y < 16:
            px[y][x-1] = blade
    # Guard (gold)
    guard = (180, 150, 40, 255)
    px[9][5] = guard
    px[9][4] = guard
    px[10][6] = guard
    # Handle (dark brown/black)
    handle = (60, 30, 20, 255)
    wrap = (80, 40, 25, 255)
    for i in range(4):
        x, y = 4 - i, 11 + i
        if 0 <= x < 16 and 0 <= y < 16:
            px[y][x] = handle if i % 2 == 0 else wrap
    return px


def generate_diamond_katana():
    """Diamond katana - blue/cyan blade, gold handle."""
    px = [[transparent() for _ in range(16)] for _ in range(16)]
    # Blade (diamond blue, diagonal)
    blade = (70, 200, 220, 255)
    blade_edge = (100, 230, 245, 255)
    for i in range(9):
        x, y = 14 - i, 1 + i
        if 0 <= x < 16 and 0 <= y < 16:
            px[y][x] = blade_edge
        if 0 <= x-1 < 16 and 0 <= y < 16:
            px[y][x-1] = blade
    # Guard (gold)
    guard = (220, 180, 50, 255)
    px[9][5] = guard
    px[9][4] = guard
    px[10][6] = guard
    # Handle (dark purple)
    handle = (80, 30, 100, 255)
    wrap = (100, 50, 120, 255)
    for i in range(4):
        x, y = 4 - i, 11 + i
        if 0 <= x < 16 and 0 <= y < 16:
            px[y][x] = handle if i % 2 == 0 else wrap
    return px


def generate_bo_stok():
    """Bo staff - long wooden stick."""
    px = [[transparent() for _ in range(16)] for _ in range(16)]
    wood_light = (160, 120, 60, 255)
    wood_dark = (130, 95, 45, 255)
    # Vertical staff
    for y in range(1, 15):
        px[y][7] = wood_light
        px[y][8] = wood_dark
    # Top and bottom caps
    px[0][7] = (100, 75, 35, 255)
    px[0][8] = (100, 75, 35, 255)
    px[15][7] = (100, 75, 35, 255)
    px[15][8] = (100, 75, 35, 255)
    # Wrapping bands
    band = (200, 50, 50, 255)
    for x in [7, 8]:
        px[4][x] = band
        px[11][x] = band
    return px


def generate_shuriken():
    """Shuriken - 4-pointed star."""
    px = [[transparent() for _ in range(16)] for _ in range(16)]
    metal = (160, 165, 170, 255)
    metal_dark = (120, 125, 130, 255)
    edge = (200, 205, 210, 255)
    # Center
    for dy in [-1, 0, 1]:
        for dx in [-1, 0, 1]:
            px[7+dy][7+dx] = metal
    px[7][7] = metal_dark
    # Four points
    # Up
    for i in range(1, 5):
        px[7-i][7] = edge
        if i > 1:
            px[7-i][7-1] = metal
            px[7-i][7+1] = metal
    # Down
    for i in range(1, 5):
        px[7+i][7] = edge
        if i > 1:
            px[7+i][7-1] = metal
            px[7+i][7+1] = metal
    # Left
    for i in range(1, 5):
        px[7][7-i] = edge
        if i > 1:
            px[7-1][7-i] = metal
            px[7+1][7-i] = metal
    # Right
    for i in range(1, 5):
        px[7][7+i] = edge
        if i > 1:
            px[7-1][7+i] = metal
            px[7+1][7+i] = metal
    return px


def generate_ninja_masker():
    """Ninja mask - black face covering."""
    px = [[transparent() for _ in range(16)] for _ in range(16)]
    black = (30, 30, 35, 255)
    dark = (45, 45, 50, 255)
    eye_slit = (200, 50, 50, 255)  # Red eyes
    # Mask shape
    for y in range(3, 13):
        for x in range(3, 13):
            px[y][x] = black
    # Slightly lighter edges
    for y in range(3, 13):
        px[y][3] = dark
        px[y][12] = dark
    for x in range(3, 13):
        px[3][x] = dark
        px[12][x] = dark
    # Eye slits
    px[6][5] = eye_slit
    px[6][6] = eye_slit
    px[6][9] = eye_slit
    px[6][10] = eye_slit
    # Nose bridge
    px[7][7] = dark
    px[7][8] = dark
    return px


def generate_ninja_harnas():
    """Ninja armor/chestplate - dark with red accents."""
    px = [[transparent() for _ in range(16)] for _ in range(16)]
    black = (35, 35, 40, 255)
    dark = (50, 50, 55, 255)
    red = (150, 30, 30, 255)
    # Main body
    for y in range(2, 14):
        for x in range(3, 13):
            px[y][x] = black
    # Shoulder pads
    for x in range(2, 5):
        px[2][x] = dark
        px[3][x] = dark
    for x in range(11, 14):
        px[2][x] = dark
        px[3][x] = dark
    # Red trim/accents
    for x in range(4, 12):
        px[2][x] = red  # collar
    px[5][5] = red  # chest cross
    px[5][10] = red
    px[6][6] = red
    px[6][9] = red
    px[7][7] = red
    px[7][8] = red
    # Belt
    for x in range(4, 12):
        px[11][x] = red
    return px


if __name__ == "__main__":
    base = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    tex_dir = os.path.join(base, "ninja_mod", "RP", "textures", "items")
    os.makedirs(tex_dir, exist_ok=True)

    items = {
        "katana": generate_katana,
        "diamond_katana": generate_diamond_katana,
        "bo_stok": generate_bo_stok,
        "shuriken": generate_shuriken,
        "ninja_masker": generate_ninja_masker,
        "ninja_harnas": generate_ninja_harnas,
    }

    for name, gen_func in items.items():
        pixels = gen_func()
        data = create_png(16, 16, pixels)
        path = os.path.join(tex_dir, f"{name}.png")
        with open(path, "wb") as f:
            f.write(data)
        print(f"Created {name}: {path} ({len(data)} bytes)")

    print("All item textures generated!")
