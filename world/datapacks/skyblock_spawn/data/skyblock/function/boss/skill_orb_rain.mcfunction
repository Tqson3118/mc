# ==============================================================================
# BOSS 4 — SKILL B: MƯA ĐẠN HUYỀN KHÔNG (ORB RAIN)
# Mưa dragon_breath particle trên toàn arena + Levitation
# Arena Boss 4: X=-45..−23, Y=108..128, Z=100..130
# Tâm Boss 4: X=-35, Y=111, Z=115
# ==============================================================================

# Hiệu ứng hạt dragon breath rải quanh boss
execute at @e[tag=boss_4,limit=1] run particle minecraft:dragon_breath ~ ~3 ~ 6 1 6 0.05 300 force
execute at @e[tag=boss_4,limit=1] run particle minecraft:end_rod ~ ~3 ~ 5 2 5 0.08 200 force
execute at @e[tag=boss_4,limit=1] run particle minecraft:sonic_boom ~ ~3 ~ 0 0 0 0 1 force

# Gây Levitation cho người chơi gần boss
execute at @e[tag=boss_4,limit=1] run effect give @a[distance=..35] minecraft:levitation 2 0 false

# Âm thanh quanh boss
execute at @e[tag=boss_4,limit=1] run playsound minecraft:entity.ender_dragon.growl master @a[distance=..40] ~ ~ ~ 5.0 1.0
execute at @e[tag=boss_4,limit=1] run playsound minecraft:entity.enderman.teleport master @a[distance=..40] ~ ~ ~ 2.0 0.6

# Thông báo actionbar cho người chơi gần boss
execute at @e[tag=boss_4,limit=1] as @a[distance=..35] run title @s actionbar {"text":"✨ HƯ KHÔNG: MƯA ĐẠN HUYỀN KHÔNG! ✨","color":"light_purple","bold":true}
