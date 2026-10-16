# ==============================================================================
# BOSS 3 — PHASE 2 ACTIVATE: CHÚA TỂ HỒI SINH
# Hồi máu, triệu hồi thêm hộ vệ, tăng radius cloud, tăng tốc
# ==============================================================================

# Gắn tag để chỉ kích hoạt 1 lần
tag @e[tag=boss_3] add boss_3_phase2

# Boss hồi máu liên tục (Regeneration II)
effect give @e[tag=boss_3] minecraft:regeneration 10 1 true

# Tăng tốc độ boss (0.35 → 0.42)
attribute @e[tag=boss_3,limit=1] minecraft:movement_speed base set 0.42

# Triệu hồi thêm 2 Wither Skeleton hộ vệ điên cuồng quanh boss
execute at @e[tag=boss_3,limit=1] run summon wither_skeleton ~3 ~ ~-3 {Tags:["minion_boss_3"],CustomName:'{"text":"Cận Vệ Điên Cuồng","color":"dark_red","bold":true}',CustomNameVisible:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:40.0},{id:"minecraft:attack_damage",base:10.0},{id:"minecraft:movement_speed",base:0.38}],Health:40f}
execute at @e[tag=boss_3,limit=1] run summon wither_skeleton ~-3 ~ ~3 {Tags:["minion_boss_3"],CustomName:'{"text":"Cận Vệ Điên Cuồng","color":"dark_red","bold":true}',CustomNameVisible:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:40.0},{id:"minecraft:attack_damage",base:10.0},{id:"minecraft:movement_speed",base:0.38}],Health:40f}

# Triệu hồi đám mây độc lớn hơn tức thì (Phase 2 cloud mạnh hơn) quanh boss
execute at @e[tag=boss_3,limit=1] run summon area_effect_cloud ~ ~1 ~ {Radius:6f,RadiusPerTick:-0.003f,Duration:100,Particle:{type:"minecraft:entity_effect",options:{r:0.3,g:0.8,b:0.0,a:1.0}},Effects:[{id:"minecraft:poison",duration:100,amplifier:2}],Tags:["boss3_cloud"]}

# Sấm sét ngay lập tức
function skyblock:boss/skill_lightning_beam

# Thông báo Phase 2
title @a times 5 40 10
title @a title {"text":"⚠ PHASE 2 ⚠","color":"dark_red","bold":true}
title @a subtitle {"text":"Chúa Tể Bóng Tối hồi sinh — Mạnh hơn bao giờ hết!","color":"dark_purple"}

# Âm thanh quanh boss
execute at @e[tag=boss_3,limit=1] run playsound minecraft:entity.warden.roar master @a[distance=..50] ~ ~ ~ 5.0 0.6
execute at @e[tag=boss_3,limit=1] run playsound minecraft:entity.ender_dragon.growl master @a[distance=..50] ~ ~ ~ 4.0 0.7
