import os
import glob
import re

count = 0
for f in glob.glob('world/datapacks/skyblock_spawn/data/skyblock/function/cotyphu/*.mcfunction'):
    with open(f, 'r', encoding='utf-8') as fp:
        content = fp.read()
    
    # Replace eco take @s <amount> with scoreboard players remove @s sb_money <amount>
    new_content = re.sub(r'\beco take @s (\d+)', r'scoreboard players remove @s sb_money \1', content)
    # Replace eco give @s <amount> with scoreboard players add @s eco_add <amount>
    new_content = re.sub(r'\beco give @s (\d+)', r'scoreboard players add @s eco_add \1', new_content)
    
    if new_content != content:
        with open(f, 'w', encoding='utf-8') as fp:
            fp.write(new_content)
        count += 1
        print(f"Updated: {f}")

print(f"Total cotyphu files updated: {count}")
