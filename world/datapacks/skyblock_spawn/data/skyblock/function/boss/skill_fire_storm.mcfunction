# ==============================================================================
# BOSS 2 — SKILL A: BÃO LỬA ĐỊA NGỤC
# Triệu hồi 5 fireball từ trên xuống xung quanh boss
# Arena Boss 2: X=18..40, Y=108..123, Z=75..95
# ==============================================================================

# Triệu hồi 5 fireball xung quanh boss từ trên xuống
execute at @e[tag=boss_2,limit=1] run summon small_fireball ~3 ~6 ~0 {Motion:[0.0,-0.5,0.0],ExplosionPower:0}
execute at @e[tag=boss_2,limit=1] run summon small_fireball ~-3 ~6 ~3 {Motion:[0.0,-0.5,0.0],ExplosionPower:0}
execute at @e[tag=boss_2,limit=1] run summon small_fireball ~0 ~6 ~-3 {Motion:[0.0,-0.5,0.0],ExplosionPower:0}
execute at @e[tag=boss_2,limit=1] run summon small_fireball ~4 ~6 ~-4 {Motion:[0.0,-0.5,0.0],ExplosionPower:0}
execute at @e[tag=boss_2,limit=1] run summon small_fireball ~-4 ~6 ~4 {Motion:[0.0,-0.5,0.0],ExplosionPower:0}

# Hiệu ứng hạt lửa quanh boss
execute at @e[tag=boss_2,limit=1] run particle minecraft:flame ~ ~2 ~ 4 2 4 0.1 80 force
execute at @e[tag=boss_2,limit=1] run particle minecraft:lava ~ ~1 ~ 3 1 3 0.05 40 force

# Âm thanh
execute at @e[tag=boss_2,limit=1] run playsound minecraft:entity.blaze.shoot master @a[distance=..35] ~ ~ ~ 3.0 0.8
execute at @e[tag=boss_2,limit=1] run playsound minecraft:entity.generic.burn master @a[distance=..35] ~ ~ ~ 1.0 1.0

# Thông báo actionbar cho người chơi gần boss
execute at @e[tag=boss_2,limit=1] as @a[distance=..35] run title @s actionbar {"text":"🔥 ĐAO PHỦ: BÃO LỬA ĐỊA NGỤC! 🔥","color":"red","bold":true}
