# -*- coding: utf-8 -*-
import os, json, re, sys
sys.stdout.reconfigure(encoding='utf-8')

function_dir = r"C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\world\datapacks\skyblock_spawn\data\skyblock\function"
files = []
for root, dirs, fnames in os.walk(function_dir):
    for fn in fnames:
        if fn.endswith(".mcfunction"):
            files.append(os.path.relpath(os.path.join(root, fn), function_dir).replace("\\", "/"))
files.sort()
errors = []

for filename in files:
    filepath = os.path.join(function_dir, filename)
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.readlines()
    print(f"Checking {filename} ({len(lines)} lines)...")
    for i, line in enumerate(lines, 1):
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        
        # Check bracket balances
        curly = line.count("{") - line.count("}")
        square = line.count("[") - line.count("]")
        if curly != 0:
            errors.append(f"{filename}:{i} Curly bracket mismatch ({curly}): {line[:80]}...")
        if square != 0:
            errors.append(f"{filename}:{i} Square bracket mismatch ({square}): {line[:80]}...")
        
        # Check single quotes balance
        single_quotes = line.count("'")
        if single_quotes % 2 != 0:
            errors.append(f"{filename}:{i} Single quote mismatch ({single_quotes}): {line[:80]}...")

if not errors:
    print("SUCCESS: ALL FILES PASSED SYNTAX AND BRACKET CHECKS!")
else:
    print(f"Found {len(errors)} issues:")
    for err in errors:
        print("  -", err)
    sys.exit(1)
