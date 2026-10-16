# ==============================================================================
# BOSS 1 — SKILL B: BẪY TƠ NHỆN (TELEPORT BẪY)
# Teleport ngẫu nhiên tối đa 2 người chơi trong arena về tâm boss
# Arena Boss 1: X=-40..−18, Y=108..123, Z=75..95
# ==============================================================================

# Teleport 2 người chơi ngẫu nhiên về gần tâm boss
execute as @a[x=-40,y=108,z=75,dx=22,dy=15,dz=20,limit=2,sort=random] at @s run tp @s -29 111 85

# Hiệu ứng portal/teleport
particle minecraft:portal -29 112 85 2 2 2 0.2 100 force
particle minecraft:reverse_portal -29 112 85 1 1 1 0.1 50 force

# Âm thanh
playsound minecraft:entity.enderman.teleport master @a -29 111 85 3.0 1.0

# Thông báo actionbar trong arena
title @a[x=-40,y=108,z=75,dx=22,dy=15,dz=20] actionbar {"text":"⚡ NỮ HOÀNG: ĐOÀN GIẢO — BẪY TƠ! ⚡","color":"dark_green","bold":true}
