# ==============================================================================
# BOSS 2 — PHASE 2 ACTIVATE: ĐAO PHỦ CUỒNG NỘ
# Gắn tag phase2, tăng tốc độ, bùng phát lửa AOE, giảm cooldown skill
# ==============================================================================

# Gắn tag để chỉ kích hoạt 1 lần
tag @e[tag=boss_2] add boss_2_phase2

# Tăng tốc độ boss (0.33 → 0.44)
attribute @e[tag=boss_2,limit=1] minecraft:movement_speed base set 0.44

# Tăng sát thương boss
attribute @e[tag=boss_2,limit=1] minecraft:attack_damage base set 20.0

# Bùng phát explosion particle AOE
execute at @e[tag=boss_2,limit=1] run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute at @e[tag=boss_2,limit=1] run particle minecraft:explosion_emitter ~-3 ~1 ~-3 0 0 0 0 1 force
execute at @e[tag=boss_2,limit=1] run particle minecraft:explosion_emitter ~3 ~1 ~3 0 0 0 0 1 force

# Triệu hồi thêm 2 Blaze hộ vệ quanh boss
execute at @e[tag=boss_2,limit=1] run summon blaze ~-2 ~1 ~-2 {Tags:["minion_boss_2"],CustomName:'{"text":"Lính Lửa Điên Cuồng","color":"red","bold":true}',CustomNameVisible:1b,PersistenceRequired:1b}
execute at @e[tag=boss_2,limit=1] run summon blaze ~2 ~1 ~2 {Tags:["minion_boss_2"],CustomName:'{"text":"Lính Lửa Điên Cuồng","color":"red","bold":true}',CustomNameVisible:1b,PersistenceRequired:1b}

# Kích hoạt bão lửa liên tiếp
function skyblock:boss/skill_fire_storm

# Thông báo Phase 2
title @a times 5 40 10
title @a title {"text":"⚠ PHASE 2 ⚠","color":"dark_red","bold":true}
title @a subtitle {"text":"Đao Phủ cuồng nộ — Sức mạnh tăng gấp đôi!","color":"red"}

# Âm thanh quanh boss
execute at @e[tag=boss_2,limit=1] run playsound minecraft:entity.warden.roar master @a[distance=..50] ~ ~ ~ 4.0 0.8
execute at @e[tag=boss_2,limit=1] run playsound minecraft:entity.blaze.shoot master @a[distance=..50] ~ ~ ~ 3.0 0.6
