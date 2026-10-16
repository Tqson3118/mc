import os
import re

issues = []
for root, _, files in os.walk('world/datapacks/skyblock_spawn'):
    for f in files:
        if not f.endswith('.mcfunction'):
            continue
        path = os.path.join(root, f)
        with open(path, 'r', encoding='utf-8', errors='ignore') as fp:
            for idx, line in enumerate(fp, 1):
                raw = line.strip()
                if not raw or raw.startswith('#'):
                    continue
                if re.search(r'setblock\s+[\S\s]+\s+replace\s+\w+', raw):
                    issues.append((path, idx, 'setblock with replace <filter>', raw))
                if re.search(r'attribute\s+@e\[[^\]]*\]', raw) and 'limit=1' not in raw:
                    issues.append((path, idx, 'attribute selector without limit=1', raw))
                if re.match(r'^(execute\s+.*run\s+)?eco\s+', raw):
                    issues.append((path, idx, 'unsupported eco command in mcfunction', raw))
                if 'extra":[]' in raw or 'extra": []' in raw:
                    issues.append((path, idx, 'invalid empty extra:[] in tellraw', raw))
                if re.search(r'\[[^\]]*[xyz]=\.\.', raw):
                    issues.append((path, idx, 'invalid range in coord selector', raw))
                if 'cut_copper_block' in raw:
                    issues.append((path, idx, 'invalid cut_copper_block', raw))

print(f'Total issues found: {len(issues)}')
for p, i, d, l in issues:
    print(f'{p}:{i} [{d}] -> {l[:80]}')
