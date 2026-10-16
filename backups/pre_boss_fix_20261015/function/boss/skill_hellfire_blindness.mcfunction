# ==============================================================================
# BOSS 2 — SKILL B: MÙ LÒA HẮC ÁM
# Gây Blindness + Wither AOE cho người chơi trong arena Boss 2
# Arena Boss 2: X=18..40, Y=108..123, Z=75..95
# ==============================================================================

# Gây hiệu ứng mù lòa và Wither
effect give @a[x=18,y=108,z=75,dx=22,dy=15,dz=20] minecraft:blindness 4 0 false
effect give @a[x=18,y=108,z=75,dx=22,dy=15,dz=20] minecraft:wither 3 0 false

# Hiệu ứng hạt khói đen
particle minecraft:smoke 29 112 85 3 2 3 0.1 100 force
particle minecraft:squid_ink 29 112 85 2 2 2 0.3 60 force

# Âm thanh
playsound minecraft:entity.wither.ambient master @a 29 111 85 3.0 1.0

# Thông báo actionbar trong arena
title @a[x=18,y=108,z=75,dx=22,dy=15,dz=20] actionbar {"text":"💀 ĐAO PHỦ: GIÁC NGỤ — MÀN ĐÊM HỦY DIỆT! 💀","color":"dark_red","bold":true}
