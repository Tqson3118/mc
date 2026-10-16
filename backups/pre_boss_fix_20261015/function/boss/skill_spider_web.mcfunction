# ==============================================================================
# BOSS 1 — SKILL A: PHUN TƠ ĐỘC
# Gây Poison + Slowness AOE cho toàn bộ người chơi trong arena Boss 1
# Arena Boss 1: X=-40..−18, Y=108..123, Z=75..95
# ==============================================================================

# Gây hiệu ứng độc và trói chân cho người chơi trong arena
effect give @a[x=-40,y=108,z=75,dx=22,dy=15,dz=20] minecraft:slowness 5 2 false
effect give @a[x=-40,y=108,z=75,dx=22,dy=15,dz=20] minecraft:poison 3 0 false

# Hiệu ứng hạt tơ nhện xung quanh boss
particle minecraft:item_slime -29 112 85 3 1 3 0.1 80 force
particle minecraft:witch -29 112 85 2 1 2 0.05 30 force

# Âm thanh
playsound minecraft:entity.spider.ambient master @a -29 111 85 3.0 0.5

# Thông báo actionbar trong arena
title @a[x=-40,y=108,z=75,dx=22,dy=15,dz=20] actionbar {"text":"🕸 NỮ HOÀNG: PHUN TƠ ĐỘC! 🕸","color":"dark_green","bold":true}
