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

# Triệu hồi 2 minion bản sao Hư Không (Endermite tăng cường)
summon endermite -37 111 112 {Tags:["minion_boss_4"],CustomName:'{"text":"Phân Thân Hư Không","color":"dark_purple","bold":true}',CustomNameVisible:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:60.0},{id:"minecraft:attack_damage",base:8.0},{id:"minecraft:movement_speed",base:0.4}],Health:60f}
summon endermite -33 111 118 {Tags:["minion_boss_4"],CustomName:'{"text":"Phân Thân Hư Không","color":"dark_purple","bold":true}',CustomNameVisible:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:60.0},{id:"minecraft:attack_damage",base:8.0},{id:"minecraft:movement_speed",base:0.4}],Health:60f}

# Thêm Shulker hộ vệ
summon shulker -35 116 112 {Tags:["minion_boss_4"],Color:5b,CustomName:'{"text":"Mắt Hư Không Điên Cuồng","color":"light_purple","bold":true}',CustomNameVisible:1b,PersistenceRequired:1b}

# Kích hoạt Hố Đen cường độ mạnh ngay lập tức (2 lần)
function skyblock:boss/skill_void_vortex
function skyblock:boss/skill_orb_rain

# Gây Darkness và Weakness kéo dài
effect give @a[x=-45,y=108,z=100,dx=22,dy=20,dz=30] minecraft:darkness 8 0 false
effect give @a[x=-45,y=108,z=100,dx=22,dy=20,dz=30] minecraft:weakness 6 1 false

# Thông báo Phase 2
title @a times 5 40 10
title @a title {"text":"⚠ PHASE 2 ⚠","color":"dark_purple","bold":true}
title @a subtitle {"text":"Hư Không Chi Vương — Sức Mạnh Tối Thượng Bùng Nổ!","color":"light_purple"}

# Âm thanh
playsound minecraft:entity.warden.roar master @a -35 111 115 5.0 0.5
playsound minecraft:block.beacon.activate master @a -35 111 115 4.0 1.5
playsound minecraft:entity.ender_dragon.growl master @a -35 111 115 4.0 0.7

# Hiệu ứng hạt tối thượng
particle minecraft:explosion_emitter -35 112 115 0 0 0 0 1 force
particle minecraft:sonic_boom -35 112 115 0 0 0 0 1 force
particle minecraft:portal -35 115 115 5 3 5 0.5 300 force
