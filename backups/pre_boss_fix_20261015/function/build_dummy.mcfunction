# ==============================================================================
# KHU VỰC BIA ĐÁNH DUMMY (IMMORTAL DPS TRAINING DUMMIES)
# Vị trí: X=11..15, Y=121, Z=2..5 (Sảnh tập luyện gần Cổng PvP Đông)
# ==============================================================================

# Xóa các dummy cũ
kill @e[type=armor_stand,tag=dummy_target]
kill @e[type=armor_stand,tag=dummy_hologram]
kill @e[type=text_display,tag=dummy_display]

# ------------------------------------------------------------------------------
# 1. SÀN ĐẤU VÕ ĐÀO TẠO (TRAINING MAT - X=11..15, Z=2..5, Y=120)
# ------------------------------------------------------------------------------
fill 11 120 2 15 120 5 stripped_spruce_wood
fill 12 120 2 14 120 4 target
setblock 11 120 2 polished_andesite
setblock 15 120 2 polished_andesite
setblock 11 120 5 polished_andesite
setblock 15 120 5 polished_andesite

# Thảm lót sàn rơm & target
setblock 12 121 2 red_carpet
setblock 14 121 2 red_carpet
setblock 12 121 5 red_carpet
setblock 14 121 5 red_carpet

# Đèn chiếu sáng sàn tập
setblock 11 121 2 lantern
setblock 15 121 2 lantern

# Biển hướng dẫn Bia Đánh Dummy
setblock 11 122 3 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"⚔ BIA ĐÁNH DUMMY ⚔","color":"red","bold":true}','{"text":"Thử sát thương vũ khí","color":"yellow"}','{"text":"Bù nhìn bất tử!","color":"green"}','{"text":"Hiện Damage chi tiết","color":"aqua"}']}}

# ------------------------------------------------------------------------------
# 2. BÙ NHÌN RƠM (STRAW DUMMY - SÁT THƯƠNG VẬT LÝ) - X=12.5, Y=121, Z=3.5
# ------------------------------------------------------------------------------
summon armor_stand 12.5 121 3.5 {Tags:["dummy_target","dummy_straw"],CustomName:'{"text":"🎯 BÙ NHÌN RƠM BẤT TỬ 🎯","color":"gold","bold":true}',CustomNameVisible:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:leather_boots",count:1},{id:"minecraft:leather_leggings",count:1},{id:"minecraft:leather_chestplate",count:1},{id:"minecraft:carved_pumpkin",count:1}]}

# Hologram hiển thị hướng dẫn Dummy rơm
summon armor_stand 12.5 123.5 3.5 {Tags:["dummy_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"[ Chém để test sát thương DPS ]","color":"yellow"}'}

# ------------------------------------------------------------------------------
# 3. BÙ NHÌN BỌC THÉP (TANK DUMMY - GIÁP CAO CẤP) - X=14.5, Y=121, Z=3.5
# ------------------------------------------------------------------------------
summon armor_stand 14.5 121 3.5 {Tags:["dummy_target","dummy_iron"],CustomName:'{"text":"🛡 BÙ NHÌN BỌC THÉP 🛡","color":"aqua","bold":true}',CustomNameVisible:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:iron_boots",count:1},{id:"minecraft:iron_leggings",count:1},{id:"minecraft:iron_chestplate",count:1},{id:"minecraft:iron_helmet",count:1}],HandItems:[{id:"minecraft:shield",count:1},{}]}

# Hologram hiển thị hướng dẫn Dummy sắt
summon armor_stand 14.5 123.5 3.5 {Tags:["dummy_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"[ Test Xuyên Giáp Vũ Khí 15-Tier ]","color":"aqua"}'}
