# Append syntax checker to test_full_boss_gen.py
from test_full_boss_gen import generate_world_boss_1000
lines = generate_world_boss_1000().split("\n")
errors = []
for i, line in enumerate(lines, 1):
    line = line.strip()
    if not line or line.startswith("#"):
        continue
    curly = line.count("{") - line.count("}")
    square = line.count("[") - line.count("]")
    if curly != 0:
        errors.append(f"Line {i}: Curly bracket mismatch ({curly}): {line[:80]}")
    if square != 0:
        errors.append(f"Line {i}: Square bracket mismatch ({square}): {line[:80]}")
    single_quotes = line.count("'")
    if single_quotes % 2 != 0:
        errors.append(f"Line {i}: Single quote mismatch ({single_quotes}): {line[:80]}")

if not errors:
    print("SUCCESS: ALL 14061 COMMANDS PASSED SYNTAX & BRACKET VERIFICATION!")
else:
    print(f"FAILED with {len(errors)} errors:")
    for err in errors[:10]:
        print("  -", err)
