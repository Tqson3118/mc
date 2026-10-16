# -*- coding: utf-8 -*-
import os, glob

base = r"C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\world\datapacks\skyblock_spawn\data\skyblock\function"
files = glob.glob(os.path.join(base, "**", "*.mcfunction"), recursive=True)

errors = []
for filepath in files:
    rel = os.path.relpath(filepath, base)
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.readlines()
    for i, line in enumerate(lines, 1):
        line = line.strip()
        if rel == os.path.join("exp", "menu.mcfunction") and i == 4:
            line = line.replace("}}}", "}}")
        if rel.startswith(os.path.join("exp", "bottle_")) and "o'" in line:
            line = line.replace("o'", "of")
        if not line or line.startswith("#"):
            continue
        curly = line.count("{") - line.count("}")
        square = line.count("[") - line.count("]")
        quotes = line.count("'")
        if curly != 0:
            errors.append(f"{rel}:{i} Curly mismatch ({curly})")
        if square != 0:
            errors.append(f"{rel}:{i} Square mismatch ({square})")
        if quotes % 2 != 0:
            errors.append(f"{rel}:{i} Quote mismatch ({quotes})")

print(f"Tested all {len(files)} files with proposed fix. Errors: {len(errors)}")
if errors:
    for e in errors:
        print("  -", e)
