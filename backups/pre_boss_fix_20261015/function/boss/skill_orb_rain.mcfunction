# ==============================================================================
# BOSS 4 — SKILL B: MƯA ĐẠN HUYỀN KHÔNG (ORB RAIN)
# Mưa dragon_breath particle trên toàn arena + Levitation
# Arena Boss 4: X=-45..−23, Y=108..128, Z=100..130
# Tâm Boss 4: X=-35, Y=111, Z=115
# ==============================================================================

# Hiệu ứng hạt dragon breath rải khắp arena
particle minecraft:dragon_breath -35 115 115 6 1 6 0.05 300 force
particle minecraft:end_rod -35 115 115 5 2 5 0.08 200 force
particle minecraft:sonic_boom -35 115 115 0 0 0 0 1 force

# Gây Levitation cho người chơi trong arena
effect give @a[x=-45,y=108,z=100,dx=22,dy=20,dz=30] minecraft:levitation 2 0 false

# Hiệu ứng hạt tại các góc arena
particle minecraft:dragon_breath -45 115 100 1 1 1 0.05 50 force
particle minecraft:dragon_breath -23 115 100 1 1 1 0.05 50 force
particle minecraft:dragon_breath -45 115 130 1 1 1 0.05 50 force
particle minecraft:dragon_breath -23 115 130 1 1 1 0.05 50 force

# Âm thanh
playsound minecraft:entity.ender_dragon.growl master @a -35 111 115 5.0 1.0
playsound minecraft:entity.enderman.teleport master @a -35 111 115 2.0 0.6

# Thông báo actionbar
title @a[x=-45,y=108,z=100,dx=22,dy=20,dz=30] actionbar {"text":"✨ HƯ KHÔNG: MƯA ĐẠN HUYỀN KHÔNG! ✨","color":"light_purple","bold":true}
