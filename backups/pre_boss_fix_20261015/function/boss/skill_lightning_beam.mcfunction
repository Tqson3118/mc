# ==============================================================================
# BOSS 3 — SKILL B: BÃO SẤM SÉT (LIGHTNING BEAM)
# Sét đánh nhiều điểm dọc theo trục Z của arena Boss 3
# Arena Boss 3: X=-18..18, Y=108..128, Z=100..130
# Tâm Boss 3: X=0, Y=111, Z=115
# ==============================================================================

# Sét đánh 6 điểm dọc trục Z của arena (Z=102 đến Z=128)
summon lightning_bolt 0 111 102
summon lightning_bolt -8 111 108
summon lightning_bolt 8 111 108
summon lightning_bolt -8 111 122
summon lightning_bolt 8 111 122
summon lightning_bolt 0 111 128

# Hiệu ứng hạt sét
particle minecraft:electric_spark 0 112 115 4 2 4 0.1 80 force
particle minecraft:flash 0 112 115 3 1 3 0 5 force

# Âm thanh sấm sét
playsound minecraft:entity.lightning_bolt.thunder master @a 0 111 115 5.0 0.8
playsound minecraft:entity.ender_dragon.growl master @a 0 111 115 3.0 1.2

# Thông báo actionbar
title @a[x=-18,y=108,z=100,dx=36,dy=20,dz=30] actionbar {"text":"⚡ CHÚA TỂ: BÃO SẤM SÉT THIÊN KIẾP! ⚡","color":"yellow","bold":true}
