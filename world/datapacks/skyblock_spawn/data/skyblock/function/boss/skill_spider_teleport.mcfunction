# ==============================================================================
# BOSS 1 — SKILL B: BẪY TƠ NHỆN (TELEPORT BẪY)
# Teleport ngẫu nhiên tối đa 2 người chơi trong arena về tâm boss
# Arena Boss 1: X=-40..−18, Y=108..123, Z=75..95
# ==============================================================================

# Teleport 2 người chơi ngẫu nhiên về gần tâm boss
execute at @e[tag=boss_1,limit=1] as @a[distance=3..35,limit=2,sort=random] run tp @s ~ ~ ~

# Hiệu ứng portal/teleport quanh boss
execute at @e[tag=boss_1,limit=1] run particle minecraft:portal ~ ~1 ~ 2 2 2 0.2 100 force
execute at @e[tag=boss_1,limit=1] run particle minecraft:reverse_portal ~ ~1 ~ 1 1 1 0.1 50 force

# Âm thanh
execute at @e[tag=boss_1,limit=1] run playsound minecraft:entity.enderman.teleport master @a[distance=..35] ~ ~ ~ 3.0 1.0

# Thông báo actionbar cho người chơi gần boss
execute at @e[tag=boss_1,limit=1] as @a[distance=..35] run title @s actionbar {"text":"⚡ NỮ HOÀNG: ĐOÀN GIẢO — BẪY TƠ! ⚡","color":"dark_green","bold":true}
