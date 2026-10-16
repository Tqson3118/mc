# -*- coding: utf-8 -*-
import os
import json
import yaml

# 1. Check help.yml
with open("help.yml", "r", encoding="utf-8") as f:
    help_data = yaml.safe_load(f)
topics = help_data.get("general-topics", {})
print(f"help.yml valid! Loaded {len(topics)} topics.")
assert len(topics) == 18, f"Expected 18 topics, got {len(topics)}"
for name, data in topics.items():
    assert "shortText" in data, f"Topic {name} missing shortText"
    assert "fullText" in data, f"Topic {name} missing fullText"

# 2. Check commands.yml
with open("commands.yml", "r", encoding="utf-8") as f:
    cmd_data = yaml.safe_load(f)
aliases = cmd_data.get("aliases", {})
print(f"commands.yml valid! Loaded {len(aliases)} aliases.")
assert "huongdan" in aliases, "Missing huongdan alias"
assert "guide" in aliases, "Missing guide alias"
assert aliases["huongdan"] == ["trigger huongdan"], f"Invalid huongdan target: {aliases['huongdan']}"
assert aliases["guide"] == ["trigger huongdan"], f"Invalid guide target: {aliases['guide']}"
assert "boss" in aliases, "Missing boss alias"
assert "boss1" in aliases, "Missing boss1 alias"

# 3. Check M5 mcfunction files + verify_syntax.py files
function_dir = r"C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\world\datapacks\skyblock_spawn\data\skyblock\function"
m5_files = [
    "build_spawn.mcfunction",
    os.path.join("guide", "menu.mcfunction"),
    "setup.mcfunction",
    "tick.mcfunction",
    "build_evolution_items.mcfunction",
    "build_evolution_npc.mcfunction",
    "summon_boss.mcfunction"
]

print(f"Checking {len(m5_files)} core & M5 mcfunction files...")
errors = []
for rel_path in m5_files:
    filepath = os.path.join(function_dir, rel_path)
    assert os.path.exists(filepath), f"File missing: {filepath}"
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.readlines()
    for i, line in enumerate(lines, 1):
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        curly = line.count("{") - line.count("}")
        square = line.count("[") - line.count("]")
        quotes = line.count("'")
        if curly != 0:
            errors.append(f"{rel_path}:{i} Curly mismatch ({curly})")
        if square != 0:
            errors.append(f"{rel_path}:{i} Square mismatch ({square})")
        if quotes % 2 != 0:
            errors.append(f"{rel_path}:{i} Quote mismatch ({quotes})")

if not errors:
    print(f"SUCCESS: ALL {len(m5_files)} CORE & M5 FILES PASSED SYNTAX AND BRACKET CHECKS (0 errors)!")
else:
    print(f"Found {len(errors)} errors:")
    for err in errors:
        print("  -", err)
    raise SystemExit(1)

print("\nALL VERIFICATION CHECKS PASSED 100%!")
