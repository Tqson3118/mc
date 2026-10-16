# ==============================================================================
# BOSS 3 — SKILL B: BÃO SẤM SÉT (LIGHTNING BEAM)
# Sét đánh nhiều điểm dọc theo trục Z của arena Boss 3
# Arena Boss 3: X=-18..18, Y=108..128, Z=100..130
# Tâm Boss 3: X=0, Y=111, Z=115
# ==============================================================================

# Sét đánh các điểm xung quanh boss
execute at @e[tag=boss_3,limit=1] run summon lightning_bolt ~ ~ ~-8
execute at @e[tag=boss_3,limit=1] run summon lightning_bolt ~-8 ~ ~-4
execute at @e[tag=boss_3,limit=1] run summon lightning_bolt ~8 ~ ~-4
execute at @e[tag=boss_3,limit=1] run summon lightning_bolt ~-8 ~ ~4
execute at @e[tag=boss_3,limit=1] run summon lightning_bolt ~8 ~ ~4
execute at @e[tag=boss_3,limit=1] run summon lightning_bolt ~ ~ ~8

# Hiệu ứng hạt sét quanh boss
execute at @e[tag=boss_3,limit=1] run particle minecraft:electric_spark ~ ~1 ~ 4 2 4 0.1 80 force
execute at @e[tag=boss_3,limit=1] run particle minecraft:flash ~ ~1 ~ 3 1 3 0 5 force

# Âm thanh sấm sét quanh boss
execute at @e[tag=boss_3,limit=1] run playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..40] ~ ~ ~ 5.0 0.8
execute at @e[tag=boss_3,limit=1] run playsound minecraft:entity.ender_dragon.growl master @a[distance=..40] ~ ~ ~ 3.0 1.2

# Thông báo actionbar cho người chơi gần boss
execute at @e[tag=boss_3,limit=1] as @a[distance=..35] run title @s actionbar {"text":"⚡ CHÚA TỂ: BÃO SẤM SÉT THIÊN KIẾP! ⚡","color":"yellow","bold":true}
