# ==============================================================================
# BOSS 2 — SKILL B: MÙ LÒA HẮC ÁM
# Gây Blindness + Wither AOE cho người chơi trong arena Boss 2
# Arena Boss 2: X=18..40, Y=108..123, Z=75..95
# ==============================================================================

# Gây hiệu ứng mù lòa và Wither cho người chơi gần boss
execute at @e[tag=boss_2,limit=1] run effect give @a[distance=..35] minecraft:blindness 4 0 false
execute at @e[tag=boss_2,limit=1] run effect give @a[distance=..35] minecraft:wither 3 0 false

# Hiệu ứng hạt khói đen quanh boss
execute at @e[tag=boss_2,limit=1] run particle minecraft:smoke ~ ~1 ~ 3 2 3 0.1 100 force
execute at @e[tag=boss_2,limit=1] run particle minecraft:squid_ink ~ ~1 ~ 2 2 2 0.3 60 force

# Âm thanh quanh boss
execute at @e[tag=boss_2,limit=1] run playsound minecraft:entity.wither.ambient master @a[distance=..35] ~ ~ ~ 3.0 1.0

# Thông báo actionbar cho người chơi gần boss
execute at @e[tag=boss_2,limit=1] as @a[distance=..35] run title @s actionbar {"text":"💀 ĐAO PHỦ: GIÁC NGỤ — MÀN ĐÊM HỦY DIỆT! 💀","color":"dark_red","bold":true}
