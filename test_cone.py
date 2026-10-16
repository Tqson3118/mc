# -*- coding: utf-8 -*-
import math

def gen_cylinder_slices(cx, cz, y_min, y_max, r, block, inner_r=None):
    lines = []
    r_ceil = int(math.ceil(r))
    for y in range(y_min, y_max + 1):
        for dz in range(-r_ceil, r_ceil + 1):
            z = cz + dz
            dsq = dz * dz
            if dsq > r * r:
                continue
            max_dx = int(math.floor(math.sqrt(r * r - dsq)))
            x_min = cx - max_dx
            x_max = cx + max_dx
            if inner_r and inner_r > 0 and dsq < inner_r * inner_r:
                inner_dx = int(math.floor(math.sqrt(inner_r * inner_r - dsq)))
                left_max = cx - inner_dx - 1
                right_min = cx + inner_dx + 1
                if x_min <= left_max:
                    lines.append(f"fill {x_min} {y} {z} {left_max} {y} {z} {block}")
                if right_min <= x_max:
                    lines.append(f"fill {right_min} {y} {z} {x_max} {y} {z} {block}")
                continue
            lines.append(f"fill {x_min} {y} {z} {x_max} {y} {z} {block}")
    return lines

def gen_cone_base(cx, cz, y_min, y_max, r_min, r_max, block):
    lines = []
    dy = y_max - y_min
    if dy <= 0:
        return lines
    for y in range(y_min, y_max + 1):
        progress = (y - y_min) / float(dy)
        r = r_min + (r_max - r_min) * (progress ** 0.8)
        lines.extend(gen_cylinder_slices(cx, cz, y, y, r, block))
    return lines

print("Testing gen_cone_base:")
res = gen_cone_base(0, 0, 95, 108, 4, 30, "polished_blackstone_bricks")
print(f"Generated {len(res)} lines for cone base.")
