"""Generate 3D armor texture for the ninja harnas attachable.

Body cube [9, 13, 5] at UV [0, 0]:
- Top:    [5, 0]   size 9x5
- Bottom: [14, 0]  size 9x5
- Right:  [0, 5]   size 5x13
- Front:  [5, 5]   size 9x13
- Left:   [14, 5]  size 5x13
- Back:   [19, 5]  size 9x13

Left arm [4, 12, 4] at UV [0, 32]:
- Top:    [4, 32]  size 4x4
- Bottom: [8, 32]  size 4x4
- Right:  [0, 36]  size 4x12
- Front:  [4, 36]  size 4x12
- Left:   [8, 36]  size 4x12
- Back:   [12, 36] size 4x12

Right arm [4, 12, 4] at UV [24, 32]:
- Top:    [28, 32] size 4x4
- Bottom: [32, 32] size 4x4
- Right:  [24, 36] size 4x12
- Front:  [28, 36] size 4x12
- Left:   [32, 36] size 4x12
- Back:   [36, 36] size 4x12
"""
import struct
import zlib
import os


def create_png(width, height, pixels):
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


def fill_rect(px, x0, y0, w, h, color):
    for dy in range(h):
        for dx in range(w):
            if y0 + dy < len(px) and x0 + dx < len(px[0]):
                px[y0 + dy][x0 + dx] = color


def generate_harnas_texture():
    W, H = 64, 64
    t = (0, 0, 0, 0)
    black = (25, 25, 30, 255)
    dark_gray = (40, 40, 45, 255)
    red_accent = (140, 20, 20, 255)
    gold_trim = (180, 150, 50, 255)

    px = [[t for _ in range(W)] for _ in range(H)]

    # === BODY ===
    # Top face
    fill_rect(px, 5, 0, 9, 5, dark_gray)
    # Bottom face
    fill_rect(px, 14, 0, 9, 5, dark_gray)
    # Right face
    fill_rect(px, 0, 5, 5, 13, black)
    # Front face
    fill_rect(px, 5, 5, 9, 13, black)
    # Left face
    fill_rect(px, 14, 5, 5, 13, black)
    # Back face
    fill_rect(px, 19, 5, 9, 13, black)

    # Front: red cross/X pattern for ninja style
    for i in range(7):
        fill_rect(px, 5 + 1 + i, 5 + 2 + i, 1, 1, red_accent)
        fill_rect(px, 5 + 7 - i, 5 + 2 + i, 1, 1, red_accent)

    # Gold trim at top of front
    fill_rect(px, 5, 5, 9, 1, gold_trim)
    # Gold trim at bottom of front
    fill_rect(px, 5, 17, 9, 1, gold_trim)
    # Gold trim on back top/bottom
    fill_rect(px, 19, 5, 9, 1, gold_trim)
    fill_rect(px, 19, 17, 9, 1, gold_trim)

    # === LEFT ARM ===
    fill_rect(px, 4, 32, 4, 4, dark_gray)   # top
    fill_rect(px, 8, 32, 4, 4, dark_gray)   # bottom
    fill_rect(px, 0, 36, 4, 12, black)      # right
    fill_rect(px, 4, 36, 4, 12, black)      # front
    fill_rect(px, 8, 36, 4, 12, black)      # left
    fill_rect(px, 12, 36, 4, 12, black)     # back
    # Gold shoulder band
    fill_rect(px, 0, 36, 16, 1, gold_trim)
    # Red stripe down arm front
    fill_rect(px, 5, 38, 2, 8, red_accent)

    # === RIGHT ARM ===
    fill_rect(px, 28, 32, 4, 4, dark_gray)  # top
    fill_rect(px, 32, 32, 4, 4, dark_gray)  # bottom
    fill_rect(px, 24, 36, 4, 12, black)     # right
    fill_rect(px, 28, 36, 4, 12, black)     # front
    fill_rect(px, 32, 36, 4, 12, black)     # left
    fill_rect(px, 36, 36, 4, 12, black)     # back
    # Gold shoulder band
    fill_rect(px, 24, 36, 16, 1, gold_trim)
    # Red stripe down arm front
    fill_rect(px, 29, 38, 2, 8, red_accent)

    return px


if __name__ == "__main__":
    base = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    tex_dir = os.path.join(base, "ninja_mod", "RP", "textures", "entity")
    os.makedirs(tex_dir, exist_ok=True)

    pixels = generate_harnas_texture()
    data = create_png(64, 64, pixels)
    path = os.path.join(tex_dir, "ninja_harnas_model.png")
    with open(path, "wb") as f:
        f.write(data)
    print(f"Created harnas 3D texture: {path} ({len(data)} bytes)")
