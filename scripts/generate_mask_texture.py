"""Generate 3D mask texture for the ninja masker attachable.

UV layout for a 9x9x9 cube starting at [0,0] in a 64x32 texture:
- Top face:    [9, 0]  size 9x9
- Bottom face: [18, 0] size 9x9
- Right face:  [0, 9]  size 9x9
- Front face:  [9, 9]  size 9x9
- Left face:   [18, 9] size 9x9
- Back face:   [27, 9] size 9x9
"""
import struct
import zlib
import os


def create_png(width, height, pixels):
    """Create a PNG from pixels[y][x] = (r, g, b, a)"""
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


def generate_mask_texture():
    """64x32 texture for the ninja mask 3D model."""
    W, H = 64, 32
    t = (0, 0, 0, 0)  # transparent
    black = (25, 25, 30, 255)
    dark = (40, 40, 45, 255)
    red_eye = (200, 40, 40, 255)

    px = [[t for _ in range(W)] for _ in range(H)]

    # Fill all face areas with black mask color
    # Top face: [9, 0] size 9x9
    for dy in range(9):
        for dx in range(9):
            px[0 + dy][9 + dx] = dark

    # Bottom face: [18, 0] size 9x9
    for dy in range(9):
        for dx in range(9):
            px[0 + dy][18 + dx] = dark

    # Right face: [0, 9] size 9x9
    for dy in range(9):
        for dx in range(9):
            px[9 + dy][0 + dx] = black

    # Front face: [9, 9] size 9x9 - THIS IS THE FACE WITH EYES
    for dy in range(9):
        for dx in range(9):
            px[9 + dy][9 + dx] = black

    # Red eye slits on front face (relative to face start at [9, 9])
    # Left eye: 2 pixels wide at row 3
    px[9 + 3][9 + 2] = red_eye
    px[9 + 3][9 + 3] = red_eye
    # Right eye: 2 pixels wide at row 3
    px[9 + 3][9 + 5] = red_eye
    px[9 + 3][9 + 6] = red_eye

    # Slight nose shadow
    px[9 + 5][9 + 4] = dark

    # Left face: [18, 9] size 9x9
    for dy in range(9):
        for dx in range(9):
            px[9 + dy][18 + dx] = black

    # Back face: [27, 9] size 9x9
    for dy in range(9):
        for dx in range(9):
            px[9 + dy][27 + dx] = black

    # Add subtle fabric wrinkle details to sides
    for face_x in [0, 18, 27]:  # right, left, back
        px[9 + 4][face_x + 3] = dark
        px[9 + 4][face_x + 5] = dark
        px[9 + 6][face_x + 4] = dark

    return px


if __name__ == "__main__":
    base = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    tex_dir = os.path.join(base, "ninja_mod", "RP", "textures", "entity")
    os.makedirs(tex_dir, exist_ok=True)

    pixels = generate_mask_texture()
    data = create_png(64, 32, pixels)
    path = os.path.join(tex_dir, "ninja_masker_model.png")
    with open(path, "wb") as f:
        f.write(data)
    print(f"Created mask 3D texture: {path} ({len(data)} bytes)")
