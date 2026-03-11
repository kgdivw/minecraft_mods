"""Validate .mcstructure files by parsing their NBT data.

Reads back the little-endian NBT and checks:
- Root compound has required tags (format_version, size, structure_world_origin, structure)
- block_indices has 2 sublists of correct length (size_x * size_y * size_z)
- palette > default > block_palette exists with entries
- Each palette entry has name, states, version
"""

import struct
import io
import sys
import os

TAG_NAMES = {
    0: "TAG_End", 1: "TAG_Byte", 2: "TAG_Short", 3: "TAG_Int",
    4: "TAG_Long", 5: "TAG_Float", 6: "TAG_Double", 7: "TAG_Byte_Array",
    8: "TAG_String", 9: "TAG_List", 10: "TAG_Compound", 11: "TAG_Int_Array",
    12: "TAG_Long_Array"
}


class NBTReader:
    def __init__(self, data):
        self.buf = io.BytesIO(data)
        self.errors = []
        self.warnings = []

    def read_byte(self):
        return struct.unpack("<b", self.buf.read(1))[0]

    def read_ubyte(self):
        return struct.unpack("<B", self.buf.read(1))[0]

    def read_short(self):
        return struct.unpack("<h", self.buf.read(2))[0]

    def read_int(self):
        return struct.unpack("<i", self.buf.read(4))[0]

    def read_long(self):
        return struct.unpack("<q", self.buf.read(8))[0]

    def read_float(self):
        return struct.unpack("<f", self.buf.read(4))[0]

    def read_double(self):
        return struct.unpack("<d", self.buf.read(8))[0]

    def read_string(self):
        length = struct.unpack("<H", self.buf.read(2))[0]
        return self.buf.read(length).decode("utf-8")

    def read_tag(self, tag_type, name="", depth=0):
        indent = "  " * depth

        if tag_type == 0:  # TAG_End
            return None
        elif tag_type == 1:  # TAG_Byte
            return self.read_byte()
        elif tag_type == 2:  # TAG_Short
            return self.read_short()
        elif tag_type == 3:  # TAG_Int
            return self.read_int()
        elif tag_type == 4:  # TAG_Long
            return self.read_long()
        elif tag_type == 5:  # TAG_Float
            return self.read_float()
        elif tag_type == 6:  # TAG_Double
            return self.read_double()
        elif tag_type == 7:  # TAG_Byte_Array
            length = self.read_int()
            return [self.read_byte() for _ in range(length)]
        elif tag_type == 8:  # TAG_String
            return self.read_string()
        elif tag_type == 9:  # TAG_List
            elem_type = self.read_ubyte()
            length = self.read_int()
            items = []
            for _ in range(length):
                items.append(self.read_tag(elem_type, "", depth + 1))
            return {"_list_type": elem_type, "_items": items}
        elif tag_type == 10:  # TAG_Compound
            result = {}
            while True:
                child_type = self.read_ubyte()
                if child_type == 0:
                    break
                child_name = self.read_string()
                child_value = self.read_tag(child_type, child_name, depth + 1)
                result[child_name] = child_value
            return result
        elif tag_type == 11:  # TAG_Int_Array
            length = self.read_int()
            return [self.read_int() for _ in range(length)]
        elif tag_type == 12:  # TAG_Long_Array
            length = self.read_int()
            return [self.read_long() for _ in range(length)]
        else:
            self.errors.append(f"Unknown tag type: {tag_type}")
            return None

    def read_root(self):
        """Read the root compound tag."""
        tag_type = self.read_ubyte()
        if tag_type != 10:
            self.errors.append(f"Root tag must be TAG_Compound (10), got {tag_type}")
            return None
        name = self.read_string()
        return self.read_tag(10, name)


def validate_mcstructure(filepath):
    """Validate a single .mcstructure file."""
    print(f"\n{'='*60}")
    print(f"Validating: {os.path.basename(filepath)}")
    print(f"{'='*60}")

    with open(filepath, "rb") as f:
        data = f.read()

    print(f"File size: {len(data)} bytes")

    reader = NBTReader(data)
    errors = []
    warnings = []

    try:
        root = reader.read_root()
    except Exception as e:
        print(f"  FAIL: Could not parse NBT: {e}")
        return False

    if root is None:
        print(f"  FAIL: Root compound is None")
        return False

    # Check required root tags
    required_root = ["format_version", "size", "structure_world_origin", "structure"]
    for tag in required_root:
        if tag not in root:
            errors.append(f"Missing required root tag: {tag}")
        else:
            print(f"  OK: Root tag '{tag}' present")

    if errors:
        for e in errors:
            print(f"  FAIL: {e}")
        return False

    # Check format_version
    fmt_ver = root["format_version"]
    if fmt_ver != 1:
        warnings.append(f"format_version is {fmt_ver}, expected 1")
    print(f"  format_version: {fmt_ver}")

    # Check size
    size_data = root["size"]
    if "_items" in size_data:
        size = size_data["_items"]
        print(f"  size: {size[0]}x{size[1]}x{size[2]}")
        total = size[0] * size[1] * size[2]
    else:
        errors.append("size tag is not a valid list")
        print(f"  FAIL: size tag malformed")
        return False

    # Check structure
    structure = root["structure"]
    if not isinstance(structure, dict):
        errors.append("structure is not a compound")
        print(f"  FAIL: structure is not compound")
        return False

    # Check block_indices
    if "block_indices" not in structure:
        errors.append("Missing block_indices in structure")
    else:
        bi = structure["block_indices"]
        if "_items" in bi:
            layers = bi["_items"]
            print(f"  block_indices layers: {len(layers)}")
            if len(layers) != 2:
                errors.append(f"block_indices should have 2 layers, has {len(layers)}")
            for i, layer in enumerate(layers):
                if "_items" in layer:
                    layer_len = len(layer["_items"])
                    print(f"    Layer {i}: {layer_len} entries (expected {total})")
                    if layer_len != total:
                        errors.append(f"Layer {i} has {layer_len} entries, expected {total}")

                    if i == 0:
                        # Check block indices are valid
                        max_idx = max(layer["_items"])
                        min_idx = min(layer["_items"])
                        print(f"    Layer {i} index range: {min_idx} to {max_idx}")
                elif isinstance(layer, list):
                    layer_len = len(layer)
                    print(f"    Layer {i}: {layer_len} entries (expected {total})")
                    if layer_len != total:
                        errors.append(f"Layer {i} has {layer_len} entries, expected {total}")

    # Check palette
    if "palette" not in structure:
        errors.append("Missing palette in structure")
    else:
        palette = structure["palette"]
        if "default" not in palette:
            errors.append("Missing 'default' in palette")
        else:
            default = palette["default"]
            if "block_palette" not in default:
                errors.append("Missing block_palette in palette > default")
            else:
                bp = default["block_palette"]
                if "_items" in bp:
                    entries = bp["_items"]
                    print(f"  block_palette: {len(entries)} entries")
                    for i, entry in enumerate(entries):
                        if isinstance(entry, dict):
                            has_name = "name" in entry
                            has_states = "states" in entry
                            has_version = "version" in entry
                            name = entry.get("name", "???")
                            if not has_name:
                                errors.append(f"Palette entry {i} missing 'name'")
                            if not has_states:
                                errors.append(f"Palette entry {i} missing 'states'")
                            if not has_version:
                                warnings.append(f"Palette entry {i} ({name}) missing 'version' tag")
                            print(f"    [{i}] {name} (name={has_name}, states={has_states}, version={has_version})")

    # Check entities
    if "entities" in structure:
        ent = structure["entities"]
        if "_items" in ent:
            print(f"  entities: {len(ent['_items'])} entries")
        else:
            print(f"  entities: present")
    else:
        warnings.append("No 'entities' tag in structure")

    # Summary
    print()
    if errors:
        for e in errors:
            print(f"  ERROR: {e}")
    if warnings:
        for w in warnings:
            print(f"  WARNING: {w}")

    if not errors:
        print(f"  RESULT: VALID (with {len(warnings)} warnings)")
        return True
    else:
        print(f"  RESULT: INVALID ({len(errors)} errors, {len(warnings)} warnings)")
        return False


if __name__ == "__main__":
    base = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    struct_dir = os.path.join(base, "ninja_mod", "BP", "structures")

    files = [
        os.path.join(struct_dir, "ninja_temple.mcstructure"),
        os.path.join(struct_dir, "ninja_castle.mcstructure"),
        os.path.join(struct_dir, "ninja_shop.mcstructure"),
    ]

    all_valid = True
    for f in files:
        if not validate_mcstructure(f):
            all_valid = False

    print(f"\n{'='*60}")
    if all_valid:
        print("All structures VALID!")
    else:
        print("Some structures have ERRORS - fix needed!")
    print(f"{'='*60}")
