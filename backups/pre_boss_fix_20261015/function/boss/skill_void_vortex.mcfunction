# ==============================================================================
# BOSS 4 — SKILL A: HỐ ĐEN (VOID VORTEX)
# Kéo người chơi trong arena về phía boss bằng teleport
# Arena Boss 4: X=-45..−23, Y=108..128, Z=100..130
# Tâm Boss 4: X=-35, Y=111, Z=115
# ==============================================================================

# Teleport người chơi trong arena (cách boss > 3 block) về gần tâm boss
execute as @a[x=-45,y=108,z=100,dx=22,dy=20,dz=30,distance=3..] at @s run tp @s -35 111 115

# Hiệu ứng hạt hố đen
particle minecraft:reverse_portal -35 113 115 4 2 4 0.1 200 force
particle minecraft:portal -35 112 115 3 1 3 0.3 150 force

# Âm thanh hút
playsound minecraft:block.beacon.activate master @a -35 111 115 4.0 0.5
playsound minecraft:entity.warden.sonic_boom master @a -35 111 115 3.0 0.8

# Gây Darkness brief
effect give @a[x=-45,y=108,z=100,dx=22,dy=20,dz=30] minecraft:darkness 3 0 false

# Thông báo actionbar
title @a[x=-45,y=108,z=100,dx=22,dy=20,dz=30] actionbar {"text":"🌌 HƯ KHÔNG CHI VƯƠNG: HỐ ĐEN! 🌌","color":"dark_purple","bold":true}
