# ==============================================================================
# HỆ THỐNG RƯƠNG BÁU HOÀNG GIA (CRATES SYSTEM) TẠI CÁNH NAM SPAWN HUB
# Vị trí: X=-5, 0, +5 | Y=121 | Z=58..60 (Quảng Trường Rương Báu Hoàng Gia)
# ==============================================================================

# Xóa các entity tương tác & hiển thị rương cũ để tránh trùng lặp
kill @e[type=interaction,tag=crate_interact]
kill @e[type=armor_stand,tag=crate_hologram]
kill @e[type=armor_stand,tag=crate_stand]

# ------------------------------------------------------------------------------
# 1. HÒM ĐỒNG (COMMON CRATE) - X=-5, Y=121, Z=58
# ------------------------------------------------------------------------------
summon interaction -5 121 58 {Tags:["crate_interact","crate_common"],width:1.2f,height:1.2f,response:1b}
summon armor_stand -5 122.8 58 {Tags:["crate_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"✦ HÒM BÁU ĐỒNG ✦","color":"gold","bold":true}'}

# ------------------------------------------------------------------------------
# 2. HÒM HOÀNG KIM (RARE CRATE) - X=0, Y=121, Z=60
# ------------------------------------------------------------------------------
summon interaction 0 121 60 {Tags:["crate_interact","crate_rare"],width:1.2f,height:1.2f,response:1b}
summon armor_stand 0 122.8 60 {Tags:["crate_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"✦ HÒM HOÀNG KIM (RARE) ✦","color":"yellow","bold":true}'}

# ------------------------------------------------------------------------------
# 3. HÒM THẦN THOẠI (MYTHIC CRATE) - X=5, Y=121, Z=58
# ------------------------------------------------------------------------------
summon interaction 5 121 58 {Tags:["crate_interact","crate_mythic"],width:1.2f,height:1.2f,response:1b}
summon armor_stand 5 122.8 58 {Tags:["crate_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"✦ HÒM THẦN THOẠI (MYTHIC) ✦","color":"light_purple","bold":true}'}

# ------------------------------------------------------------------------------
# Biển chỉ dẫn trung tâm khu Crates (X=0, Y=121, Z=56)
# ------------------------------------------------------------------------------
setblock 0 121 56 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"★ RƯƠNG BÁU SPAWN ★","color":"gold","bold":true}','{"text":"1. Nhận chìa từ /kit","color":"yellow"}','{"text":"2. Mua chìa /shop","color":"aqua"}','{"text":"3. Chuột phải nhận quà!","color":"green"}']}}
