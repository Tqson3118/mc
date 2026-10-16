# ==============================================================================
# BOSS 1 — PHASE 2 ACTIVATE: NỮ HOÀNG ĐIÊN CUỒNG
# Gắn tag phase2, tăng tốc độ, triệu hồi nhện con điên cuồng, buff người chơi
# ==============================================================================

# Gắn tag để chỉ kích hoạt 1 lần
tag @e[tag=boss_1] add boss_1_phase2

# Tăng tốc độ boss (0.35 → 0.45)
attribute @e[tag=boss_1,limit=1] minecraft:movement_speed base set 0.45

# Triệu hồi thêm 2 nhện con điên cuồng
summon cave_spider -28 111 84 {Tags:["minion_boss_1"],CustomName:'{"text":"Nhện Con Điên Cuồng","color":"dark_red","bold":true}',CustomNameVisible:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:attack_damage",base:5.0},{id:"minecraft:movement_speed",base:0.4}]}
summon cave_spider -30 111 86 {Tags:["minion_boss_1"],CustomName:'{"text":"Nhện Con Điên Cuồng","color":"dark_red","bold":true}',CustomNameVisible:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:attack_damage",base:5.0},{id:"minecraft:movement_speed",base:0.4}]}

# Gây Poison II cho người chơi trong arena
effect give @a[x=-40,y=108,z=75,dx=22,dy=15,dz=20] minecraft:poison 6 1 false

# Thông báo Phase 2
title @a times 5 40 10
title @a title {"text":"⚠ PHASE 2 ⚠","color":"dark_red","bold":true}
title @a subtitle {"text":"Nữ Hoàng Nhện điên cuồng!","color":"red"}

# Âm thanh báo động
playsound minecraft:entity.warden.roar master @a -29 111 85 4.0 0.7

# Hiệu ứng hạt bùng nổ
particle minecraft:explosion_emitter -29 112 85 0 0 0 0 1 force
particle minecraft:item_slime -29 112 85 4 2 4 0.2 120 force
