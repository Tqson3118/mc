# ==============================================================================
# BOSS 4 — PHASE 2 ACTIVATE: HƯ KHÔNG CHI VƯƠNG TRỖI DẬY
# Triệu hồi bản sao, hố đen cường độ mạnh, buff tối thượng
# ==============================================================================

# Gắn tag để chỉ kích hoạt 1 lần
tag @e[tag=boss_4] add boss_4_phase2

# Tăng tốc độ boss (0.36 → 0.48)
attribute @e[tag=boss_4,limit=1] minecraft:movement_speed base set 0.48

# Tăng sát thương boss
attribute @e[tag=boss_4,limit=1] minecraft:attack_damage base set 32.0

# Triệu hồi 2 minion bản sao Hư Không (Endermite tăng cường) quanh boss
execute at @e[tag=boss_4,limit=1] run summon endermite ~-2 ~ ~-2 {Tags:["minion_boss_4"],CustomName:'{"text":"Phân Thân Hư Không","color":"dark_purple","bold":true}',CustomNameVisible:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:60.0},{id:"minecraft:attack_damage",base:8.0},{id:"minecraft:movement_speed",base:0.4}],Health:60f}
execute at @e[tag=boss_4,limit=1] run summon endermite ~2 ~ ~2 {Tags:["minion_boss_4"],CustomName:'{"text":"Phân Thân Hư Không","color":"dark_purple","bold":true}',CustomNameVisible:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:60.0},{id:"minecraft:attack_damage",base:8.0},{id:"minecraft:movement_speed",base:0.4}],Health:60f}

# Thêm Shulker hộ vệ trên cao gần boss
execute at @e[tag=boss_4,limit=1] run summon shulker ~0 ~5 ~-3 {Tags:["minion_boss_4"],Color:5b,CustomName:'{"text":"Mắt Hư Không Điên Cuồng","color":"light_purple","bold":true}',CustomNameVisible:1b,PersistenceRequired:1b}

# Kích hoạt Hố Đen cường độ mạnh ngay lập tức (2 lần)
function skyblock:boss/skill_void_vortex
function skyblock:boss/skill_orb_rain

# Gây Darkness và Weakness kéo dài cho người chơi gần boss
execute at @e[tag=boss_4,limit=1] run effect give @a[distance=..35] minecraft:darkness 8 0 false
execute at @e[tag=boss_4,limit=1] run effect give @a[distance=..35] minecraft:weakness 6 1 false

# Thông báo Phase 2
title @a times 5 40 10
title @a title {"text":"⚠ PHASE 2 ⚠","color":"dark_purple","bold":true}
title @a subtitle {"text":"Hư Không Chi Vương — Sức Mạnh Tối Thượng Bùng Nổ!","color":"light_purple"}

# Âm thanh quanh boss
execute at @e[tag=boss_4,limit=1] run playsound minecraft:entity.warden.roar master @a[distance=..50] ~ ~ ~ 5.0 0.5
execute at @e[tag=boss_4,limit=1] run playsound minecraft:block.beacon.activate master @a[distance=..50] ~ ~ ~ 4.0 1.5
execute at @e[tag=boss_4,limit=1] run playsound minecraft:entity.ender_dragon.growl master @a[distance=..50] ~ ~ ~ 4.0 0.7

# Hiệu ứng hạt tối thượng quanh boss
execute at @e[tag=boss_4,limit=1] run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute at @e[tag=boss_4,limit=1] run particle minecraft:sonic_boom ~ ~1 ~ 0 0 0 0 1 force
execute at @e[tag=boss_4,limit=1] run particle minecraft:portal ~ ~2 ~ 5 3 5 0.5 300 force
