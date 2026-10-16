# -*- coding: utf-8 -*-
import math

def gen_north_causeway():
    cmds = []
    # Z from -25 down to -260 (length 235)
    # Y from 110 down to 75 (drop 35)
    z_min, z_max = -260, -25
    total_z = z_max - z_min # 235
    
    # Calculate intervals of constant Y
    y_intervals = []
    current_y = None
    cur_z_start = None
    
    for z in range(z_max, z_min - 1, -1):
        progress = (z_max - z) / float(total_z)
        y = int(round(110 - 35 * progress))
        if y != current_y:
            if current_y is not None:
                y_intervals.append((current_y, cur_z_start, z + 1))
            current_y = y
            cur_z_start = z
    if current_y is not None:
        y_intervals.append((current_y, cur_z_start, z_min))
        
    cmds.append("# Đại Lộ Bắc (North Grand Causeway 7 blocks rộng, giật cấp Y=110..75)")
    for y, z_high, z_low in y_intervals:
        # Walkway 5 blocks wide (-2 to 2)
        cmds.append(f"fill -2 {y} {z_low} 2 {y} {z_high} polished_blackstone_bricks")
        cmds.append(f"fill -2 {y-1} {z_low} 2 {y-1} {z_high} blackstone")
        # Curbs at -3 and 3
        cmds.append(f"fill -3 {y} {z_low} -3 {y} {z_high} polished_blackstone")
        cmds.append(f"fill 3 {y} {z_low} 3 {y} {z_high} polished_blackstone")
        # Railings
        cmds.append(f"fill -3 {y+1} {z_low} -3 {y+1} {z_high} polished_blackstone_brick_wall")
        cmds.append(f"fill 3 {y+1} {z_low} 3 {y+1} {z_high} polished_blackstone_brick_wall")

    # Lampposts every 12 blocks along Z
    for z in range(z_max, z_min - 1, -1):
        if abs(z) % 12 == 0:
            progress = (z_max - z) / float(total_z)
            y = int(round(110 - 35 * progress))
            cmds.append(f"setblock -3 {y+2} {z} polished_blackstone_brick_wall")
            cmds.append(f"setblock -3 {y+3} {z} soul_lantern[hanging=false]")
            cmds.append(f"setblock 3 {y+2} {z} polished_blackstone_brick_wall")
            cmds.append(f"setblock 3 {y+3} {z} soul_lantern[hanging=false]")
            
    return cmds

def gen_diagonal_bridge(sx, sz, name):
    cmds = []
    cmds.append(f"# Đại Lộ Chéo {name} (5 blocks rộng, Y=110..100)")
    # s from 20 to 155
    s_start, s_end = 20, 155
    total_s = s_end - s_start # 135
    
    # Perpendicular unit direction
    px = -sz
    pz = sx
    
    for s in range(s_start, s_end + 1):
        progress = (s - s_start) / float(total_s)
        y = int(round(110 - 10 * progress))
        cx = sx * s
        cz = sz * s
        
        # Walkway 3x3 patch
        cmds.append(f"fill {cx-1} {y} {cz-1} {cx+1} {y} {cz+1} polished_blackstone_bricks")
        cmds.append(f"fill {cx-1} {y-1} {cz-1} {cx+1} {y-1} {cz+1} blackstone")
        
        # Left curb & railing (offset by 2 * perpendicular)
        lx = cx + 2 * px
        lz = cz + 2 * pz
        cmds.append(f"setblock {lx} {y} {lz} polished_blackstone")
        cmds.append(f"setblock {lx} {y+1} {lz} polished_blackstone_brick_wall")
        
        # Extra railing seal between diagonal steps
        lx_extra = lx + sx
        lz_extra = lz
        cmds.append(f"setblock {lx_extra} {y+1} {lz_extra} polished_blackstone_brick_wall")
        
        # Right curb & railing (offset by -2 * perpendicular)
        rx = cx - 2 * px
        rz = cz - 2 * pz
        cmds.append(f"setblock {rx} {y} {rz} polished_blackstone")
        cmds.append(f"setblock {rx} {y+1} {rz} polished_blackstone_brick_wall")
        
        # Extra railing seal
        rx_extra = rx + sx
        rz_extra = rz
        cmds.append(f"setblock {rx_extra} {y+1} {rz_extra} polished_blackstone_brick_wall")
        
        # Lampposts every 12 steps
        if s % 12 == 0:
            cmds.append(f"setblock {lx} {y+2} {lz} soul_lantern[hanging=false]")
            cmds.append(f"setblock {rx} {y+2} {rz} soul_lantern[hanging=false]")
            
    return cmds

north = gen_north_causeway()
print(f"North causeway: {len(north)} commands.")
diag1 = gen_diagonal_bridge(-1, -1, "Tây Bắc -> Đấu Trường 1")
print(f"Diag 1 bridge: {len(diag1)} commands.")
