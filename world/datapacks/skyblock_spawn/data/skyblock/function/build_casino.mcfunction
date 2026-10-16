# ==============================================================================
# SÒNG BẠC THẦN TÀI HOÀNG KIM (FORTUNE CASINO) TẠI CÁNH TÂY SPAWN HUB
# Tọa độ: X=-61..-49, Z=3..14 | Y=120..128
# ==============================================================================

# Xóa các entity cũ trong casino
kill @e[type=villager,tag=casino_npc]
kill @e[type=interaction,tag=casino_interact]
kill @e[type=armor_stand,tag=casino_hologram]
kill @e[type=text_display,tag=casino_display]

# ------------------------------------------------------------------------------
# 1. BÀN CỜ TUNG ĐỒNG XU COINFLIP (X=-55, Y=121, Z=6)
# ------------------------------------------------------------------------------
setblock -55 121 6 gold_block
setblock -55 122 6 heavy_weighted_pressure_plate
setblock -55 122 5 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ TUNG ĐỒNG XU /CF ]","color":"gold","bold":true}','{"text":"Tỉ lệ 50/50 ăn gấp đôi","color":"yellow"}','{"text":"Cược $1,000 ăn $2,000","color":"green"}','{"text":"Click hoặc gõ /cf","color":"aqua"}']}}

# Entity tương tác & Hologram
summon interaction -55 121 6 {Tags:["casino_interact","cf_interact"],width:1.5f,height:1.5f,response:1b}
summon armor_stand -55 123.5 6 {Tags:["casino_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"🪙 BÀN CỜ TUNG ĐỒNG XU (/CF) 🪙","color":"gold","bold":true}'}

# NPC Thần Tài Coinflip
summon villager -55 121 4 {Tags:["casino_npc","cf_npc"],CustomName:'{"text":"Thần Tài Tung Đồng Xu (/cf)","color":"gold","bold":true}',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{profession:nitwit,type:desert,level:5},Rotation:[180f,0f]}

# ------------------------------------------------------------------------------
# 2. QUẦY VÉ SỐ XỔ SỐ JACKPOT (X=-55, Y=121, Z=10)
# ------------------------------------------------------------------------------
setblock -55 121 10 emerald_block
setblock -55 122 10 heavy_weighted_pressure_plate
setblock -55 122 9 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VÉ SỐ JACKPOT ]","color":"gold","bold":true}','{"text":"Hũ Thưởng: $100,000+","color":"yellow","bold":true}','{"text":"Giá vé: $1,000/vé","color":"white"}','{"text":"Click hoặc gõ /xoso","color":"aqua"}']}}

# Entity tương tác & Hologram
summon interaction -55 121 10 {Tags:["casino_interact","xoso_interact"],width:1.5f,height:1.5f,response:1b}
summon armor_stand -55 123.5 10 {Tags:["casino_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"🎰 QUẦY VÉ SỐ JACKPOT (/XOSO) 🎰","color":"green","bold":true}'}

# NPC Chủ Quầy Vé Số
summon villager -55 121 12 {Tags:["casino_npc","xoso_npc"],CustomName:'{"text":"Chủ Quầy Vé Số Jackpot (/xoso)","color":"green","bold":true}',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{profession:cleric,type:plains,level:5},Rotation:[0f,0f]}
