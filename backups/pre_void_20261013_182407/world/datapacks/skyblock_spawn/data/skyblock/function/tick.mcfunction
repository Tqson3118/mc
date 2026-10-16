# ==============================================================================
# SKYBLOCK TICK FUNCTION - MINECRAFT PAPER 1.21.4
# Đạt chuẩn Data Components & Tương thích Minecraft 1.21.4
# ==============================================================================

# 0.5. Tự động hút quặng & đá khi đào vào túi (Auto-Pickup trong bán kính 6 block, không hút đồ vứt bằng Q)
execute as @e[type=item,nbt={Age:0s..20s}] unless data entity @s Thrower at @s run tp @s @p[distance=..6]

# Safe Zone at Grand Spawn Hub (Radius 75) - Full immunity from PvP & Hunger
execute in minecraft:overworld run effect give @a[x=-75,y=95,z=-75,dx=150,dy=50,dz=150] minecraft:resistance 2 255 true
execute in minecraft:overworld run effect give @a[x=-75,y=95,z=-75,dx=150,dy=50,dz=150] minecraft:weakness 2 255 true
execute in minecraft:overworld run effect give @a[x=-75,y=95,z=-75,dx=150,dy=50,dz=150] minecraft:saturation 2 255 true

# 0.6. BẢO VỆ CÁC KHU VỰC CÔNG CỘNG KHỎI QUÁI VẬT TỰ NHIÊN
# (Bảo toàn tuyệt đối 10 lồng spawner tại Khu Mob Farm X=-82..-58 và 4 Đấu trường Boss Z > 70)
execute in minecraft:overworld run kill @e[type=phantom]
execute in minecraft:overworld run kill @e[type=creeper]
execute in minecraft:overworld as @e[type=#minecraft:skeletons,x=-75,y=90,z=-75,dx=150,dy=55,dz=150] unless entity @s[tag=server_boss] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=#minecraft:zombies,x=-75,y=90,z=-75,dx=150,dy=55,dz=150] unless entity @s[tag=server_boss] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=spider,x=-75,y=90,z=-75,dx=150,dy=55,dz=150] unless entity @s[tag=server_boss] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=cave_spider,x=-75,y=90,z=-75,dx=150,dy=55,dz=150] unless entity @s[tag=server_boss] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=enderman,x=-75,y=90,z=-75,dx=150,dy=55,dz=150] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=witch,x=-75,y=90,z=-75,dx=150,dy=55,dz=150] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=slime,x=-75,y=90,z=-75,dx=150,dy=55,dz=150] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=#minecraft:skeletons,x=20,y=110,z=20,dx=35,dy=25,dz=35] unless entity @s[tag=server_boss] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=#minecraft:zombies,x=20,y=110,z=20,dx=35,dy=25,dz=35] unless entity @s[tag=server_boss] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=spider,x=20,y=110,z=20,dx=35,dy=25,dz=35] unless entity @s[tag=server_boss] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=cave_spider,x=20,y=110,z=20,dx=35,dy=25,dz=35] unless entity @s[tag=server_boss] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=enderman,x=20,y=110,z=20,dx=35,dy=25,dz=35] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=witch,x=20,y=110,z=20,dx=35,dy=25,dz=35] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=slime,x=20,y=110,z=20,dx=35,dy=25,dz=35] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=#minecraft:skeletons,x=-15,y=108,z=50,dx=30,dy=20,dz=18] unless entity @s[tag=server_boss] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=#minecraft:zombies,x=-15,y=108,z=50,dx=30,dy=20,dz=18] unless entity @s[tag=server_boss] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=spider,x=-15,y=108,z=50,dx=30,dy=20,dz=18] unless entity @s[tag=server_boss] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=cave_spider,x=-15,y=108,z=50,dx=30,dy=20,dz=18] unless entity @s[tag=server_boss] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=enderman,x=-15,y=108,z=50,dx=30,dy=20,dz=18] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=witch,x=-15,y=108,z=50,dx=30,dy=20,dz=18] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=slime,x=-15,y=108,z=50,dx=30,dy=20,dz=18] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=#minecraft:skeletons,x=30,y=105,z=-65,dx=35,dy=80,dz=35] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=#minecraft:zombies,x=30,y=105,z=-65,dx=35,dy=80,dz=35] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=spider,x=30,y=105,z=-65,dx=35,dy=80,dz=35] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=cave_spider,x=30,y=105,z=-65,dx=35,dy=80,dz=35] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=enderman,x=30,y=105,z=-65,dx=35,dy=80,dz=35] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=witch,x=30,y=105,z=-65,dx=35,dy=80,dz=35] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=slime,x=30,y=105,z=-65,dx=35,dy=80,dz=35] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=#minecraft:skeletons,x=-20,y=105,z=-90,dx=40,dy=30,dz=40] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=#minecraft:zombies,x=-20,y=105,z=-90,dx=40,dy=30,dz=40] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=spider,x=-20,y=105,z=-90,dx=40,dy=30,dz=40] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=cave_spider,x=-20,y=105,z=-90,dx=40,dy=30,dz=40] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=enderman,x=-20,y=105,z=-90,dx=40,dy=30,dz=40] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=witch,x=-20,y=105,z=-90,dx=40,dy=30,dz=40] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=slime,x=-20,y=105,z=-90,dx=40,dy=30,dz=40] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=#minecraft:skeletons,x=55,y=108,z=-15,dx=30,dy=25,dz=30] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=#minecraft:zombies,x=55,y=108,z=-15,dx=30,dy=25,dz=30] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=spider,x=55,y=108,z=-15,dx=30,dy=25,dz=30] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=cave_spider,x=55,y=108,z=-15,dx=30,dy=25,dz=30] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=enderman,x=55,y=108,z=-15,dx=30,dy=25,dz=30] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=witch,x=55,y=108,z=-15,dx=30,dy=25,dz=30] run tp @s ~ -300 ~
execute in minecraft:overworld as @e[type=slime,x=55,y=108,z=-15,dx=30,dy=25,dz=30] run tp @s ~ -300 ~

# PvP Arena Zone (X >= 74, Z: -35..38, Y: 105..130) - Combat Active!
execute in minecraft:overworld run effect clear @a[x=74,y=105,z=-35,dx=45,dy=25,dz=75] minecraft:resistance
execute in minecraft:overworld run effect clear @a[x=74,y=105,z=-35,dx=45,dy=25,dz=75] minecraft:weakness
execute in minecraft:overworld run title @a[x=74,y=105,z=-35,dx=45,dy=25,dz=75] actionbar {"text":"⚔ KHU VỰC PVP - HÃY CẨN THẬN ĐỐI THỦ! ⚔","color":"red","bold":true}

# Mob Farm Safe Platform Actionbar (X: -104..-76)
execute in minecraft:overworld run title @a[x=-104,y=108,z=-14,dx=28,dy=17,dz=28] actionbar {"text":"☠ KHU FARM QUÁI - ĐÁNH QUÁI NHẬN EXP & MOB DROPS ☠","color":"green","bold":true}

# Fishing Area Actionbar (Z: -108..-76)
execute in minecraft:overworld run title @a[x=-18,y=108,z=-108,dx=36,dy=17,dz=34] actionbar {"text":"🎣 KHU VỰC CÂU CÁ - THƯ GIÃN & ĐỔI CÁ LẤY XU 🎣","color":"aqua","bold":true}

# Boss Arena Zone (Combat Active: Z >= 74)
execute in minecraft:overworld run effect clear @a[x=-50,y=105,z=74,dx=100,dy=30,dz=60] minecraft:resistance
execute in minecraft:overworld run effect clear @a[x=-50,y=105,z=74,dx=100,dy=30,dz=60] minecraft:weakness
execute in minecraft:overworld run title @a[x=-50,y=105,z=74,dx=100,dy=30,dz=60] actionbar {"text":"☠ ĐẤU TRƯỜNG BOSS - HỢP LỰC CHINH PHỤC QUỶ VƯƠNG! ☠","color":"dark_red","bold":true}

# Enable trigger cho toan bo nguoi choi
scoreboard players enable @a nung
scoreboard players enable @a evolution
scoreboard players enable @a setup
scoreboard players enable @a huongdan
scoreboard players enable @a danhhieu
scoreboard players enable @a buy_title
scoreboard players enable @a equip_title
scoreboard players enable @a remove_title
scoreboard players enable @a banexp
scoreboard players enable @a bottle

# Khi nguoi choi go /nung (kich hoat trigger nung >= 1)
execute as @a[scores={nung=1..}] at @s run function skyblock:smelt_ores

# Khi nguoi choi go /trigger evolution (kich hoat nhan vat pham test tien hoa)
execute as @a[scores={evolution=1..}] at @s run function skyblock:build_evolution_items
scoreboard players set @a[scores={evolution=1..}] evolution 0

# Khi nguoi choi go /trigger setup (kich hoat cai dat lai he thong)
execute as @a[scores={setup=1..}] at @s run function skyblock:setup
scoreboard players set @a[scores={setup=1..}] setup 0

# Khi nguoi choi go /huongdan hoac /guide (kich hoat trigger huongdan >= 1)
execute as @a[scores={huongdan=1..}] at @s run function skyblock:guide/menu
scoreboard players set @a[scores={huongdan=1..}] huongdan 0

# Hệ thống Danh Hiệu Triggers
execute as @a[scores={danhhieu=1..}] at @s run function skyblock:title/menu
scoreboard players set @a[scores={danhhieu=1..}] danhhieu 0

execute as @a[scores={buy_title=1..}] at @s run function skyblock:title/buy

execute as @a[scores={equip_title=1..}] at @s run function skyblock:title/equip
scoreboard players set @a[scores={equip_title=1..}] equip_title 0

execute as @a[scores={remove_title=1..}] at @s run function skyblock:title/remove
scoreboard players set @a[scores={remove_title=1..}] remove_title 0

# Mở khóa danh hiệu [🎣 Lão Ngư] khi câu đạt 5 con cá
execute as @a[scores={fish_caught=5..}] unless entity @s[tag=title_laongu] run tag @s add title_laongu
execute as @a[scores={fish_caught=5..}] unless entity @s[tag=laongu_announced] at @s run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Chiến tích câu cá xuất sắc! Bạn đã mở khóa danh hiệu độc quyền: ","color":"yellow"},{"text":"[🎣 Lão Ngư]","color":"dark_aqua","bold":true},{"text":"! (Gõ /danhhieu để đeo)","color":"green"}]
execute as @a[scores={fish_caught=5..}] unless entity @s[tag=laongu_announced] run playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.0 1.2
execute as @a[scores={fish_caught=5..}] unless entity @s[tag=laongu_announced] run tag @s add laongu_announced

# ==============================================================================
# HỆ THỐNG BẮT SỰ KIỆN BOSS TIÊU DIỆT (DEF-01)
# ==============================================================================
execute if score #boss_1_alive boss_status matches 1 unless entity @e[tag=boss_1] run function skyblock:boss/boss_1_defeated
execute if score #boss_2_alive boss_status matches 1 unless entity @e[tag=boss_2] run function skyblock:boss/boss_2_defeated
execute if score #boss_3_alive boss_status matches 1 unless entity @e[tag=boss_3] run function skyblock:boss/boss_3_defeated
execute if score #boss_4_alive boss_status matches 1 unless entity @e[tag=boss_4] run function skyblock:boss/boss_4_defeated

# ==============================================================================
# HỆ THỐNG TƯƠNG TÁC NPC & DỊCH CHUYỂN AN TOÀN
# ==============================================================================

# Tương tác NPC Thợ Săn Boss (Milestone M2)
execute as @e[type=interaction,tag=boss_hunter_interact] if data entity @s interaction on target run function skyblock:boss/hunter_menu
execute as @e[type=interaction,tag=boss_hunter_interact] run data remove entity @s interaction

# Tương tác NPC Hướng Dẫn Viên Tân Thủ (Milestone M5)
execute as @e[type=interaction,tag=guide_interact] if data entity @s interaction on target run function skyblock:guide/menu
execute as @e[type=interaction,tag=guide_interact] run data remove entity @s interaction

# Tương tác Hòm Báu Crates (DEF-02)
execute as @e[type=interaction,tag=crate_common] if data entity @s interaction on target run function skyblock:crates/open_common
execute as @e[type=interaction,tag=crate_rare] if data entity @s interaction on target run function skyblock:crates/open_rare
execute as @e[type=interaction,tag=crate_mythic] if data entity @s interaction on target run function skyblock:crates/open_mythic
execute as @e[type=interaction,tag=crate_interact] run data remove entity @s interaction

# Tương tác Casino Quầy Coinflip & Vé Số (DEF-03)
execute as @e[type=interaction,tag=cf_interact] if data entity @s interaction on target run function skyblock:commands/cf
execute as @e[type=interaction,tag=cf_interact] run data remove entity @s interaction
execute as @e[type=interaction,tag=xoso_interact] if data entity @s interaction on target run function skyblock:commands/xoso
execute as @e[type=interaction,tag=xoso_interact] run data remove entity @s interaction

# Tương tác Rương Đỉnh Tháp & Bệ Chiến Thắng Parkour (DEF-04)
execute as @e[type=interaction,tag=parkour_chest_interact] if data entity @s interaction on target run function skyblock:parkour_win
execute as @e[type=interaction,tag=parkour_chest_interact] run data remove entity @s interaction
execute in minecraft:overworld as @a[x=44,y=173,z=-46,dx=2,dy=2,dz=2] run function skyblock:parkour_win

# Hệ thống Lưu Checkpoint & Cứu Hộ Rơi Ngã Parkour (DEF-04)
execute as @a[x=48,y=129,z=-37,dx=2,dy=2,dz=2] unless entity @s[tag=pk_cp1] run tag @s add pk_cp1
execute as @a[x=48,y=129,z=-37,dx=2,dy=2,dz=2] unless entity @s[tag=pk_cp1_msg] at @s run tellraw @s [{"text":"[Parkour] ","color":"gold","bold":true},{"text":"✦ ĐÃ LƯU CHECKPOINT 1 (TẦNG 10/30)! ✦","color":"green","bold":true}]
execute as @a[x=48,y=129,z=-37,dx=2,dy=2,dz=2] unless entity @s[tag=pk_cp1_msg] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute as @a[x=48,y=129,z=-37,dx=2,dy=2,dz=2] unless entity @s[tag=pk_cp1_msg] run tag @s add pk_cp1_msg

execute as @a[x=49,y=149,z=-44,dx=2,dy=2,dz=2] unless entity @s[tag=pk_cp2] run tag @s add pk_cp2
execute as @a[x=49,y=149,z=-44,dx=2,dy=2,dz=2] unless entity @s[tag=pk_cp2_msg] at @s run tellraw @s [{"text":"[Parkour] ","color":"gold","bold":true},{"text":"✦ ĐÃ LƯU CHECKPOINT 2 (TẦNG 20/30)! ✦","color":"aqua","bold":true}]
execute as @a[x=49,y=149,z=-44,dx=2,dy=2,dz=2] unless entity @s[tag=pk_cp2_msg] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute as @a[x=49,y=149,z=-44,dx=2,dy=2,dz=2] unless entity @s[tag=pk_cp2_msg] run tag @s add pk_cp2_msg

execute in minecraft:overworld as @a[x=28,y=103,z=-62,dx=34,dy=11,dz=34,tag=pk_cp2] run teleport @s 50.5 151.0 -43.0 0.0 0.0
execute in minecraft:overworld as @a[x=28,y=103,z=-62,dx=34,dy=11,dz=34,tag=pk_cp1,tag=!pk_cp2] run teleport @s 49.5 131.0 -36.0 0.0 0.0
execute in minecraft:overworld as @a[x=28,y=103,z=-62,dx=34,dy=11,dz=34,tag=!pk_cp1,tag=!pk_cp2] run teleport @s 35.5 116.0 -35.0 0.0 0.0

execute in minecraft:overworld as @a[x=34,y=115,z=-36,dx=2,dy=2,dz=2] run tag @s remove pk_cp1
execute in minecraft:overworld as @a[x=34,y=115,z=-36,dx=2,dy=2,dz=2] run tag @s remove pk_cp2
execute in minecraft:overworld as @a[x=34,y=115,z=-36,dx=2,dy=2,dz=2] run tag @s remove pk_cp1_msg
execute in minecraft:overworld as @a[x=34,y=115,z=-36,dx=2,dy=2,dz=2] run tag @s remove pk_cp2_msg

# Bệ Dịch Chuyển Rút Lui Khẩn Cấp 4 Đấu Trường Boss (Milestone M2 Fail-Safe)
execute in minecraft:overworld as @a[x=-19,y=110,z=74,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 76.0 0.0 0.0
execute in minecraft:overworld as @a[x=18,y=110,z=74,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 76.0 0.0 0.0
execute in minecraft:overworld as @a[x=2,y=110,z=101,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 76.0 0.0 0.0
execute in minecraft:overworld as @a[x=-26,y=110,z=101,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 76.0 0.0 0.0

# ==============================================================================
# HỆ THỐNG TIẾN HÓA TRANG BỊ CỔ ĐẠI - CƠ CHẾ THỰC CHIẾN
# ==============================================================================

# 1. CƠ CHẾ CÚP CỔ ĐẠI TIER 10+ (ĐÀO NỔ 3x3)
# Không phá huỷ các khu vực công cộng: Spawn (-35..35), Boss Arena (-20..20, Z: 50..90), PvP (55..85), Câu cá (-20..20, Z: -90..-60)
execute as @a[scores={use_n_pick=1..}] if items entity @s weapon.mainhand *[custom_data~{explosive_mining:1b}] at @s unless entity @s[x=-35,y=90,z=-35,dx=70,dy=60,dz=70] unless entity @s[x=-25,y=90,z=50,dx=50,dy=60,dz=45] unless entity @s[x=50,y=90,z=-20,dx=40,dy=60,dz=40] unless entity @s[x=-25,y=90,z=-95,dx=50,dy=60,dz=45] anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air destroy
execute as @a[scores={use_n_pick=1..}] if items entity @s weapon.mainhand *[custom_data~{explosive_mining:1b}] at @s unless entity @s[x=-35,y=90,z=-35,dx=70,dy=60,dz=70] unless entity @s[x=-25,y=90,z=50,dx=50,dy=60,dz=45] unless entity @s[x=50,y=90,z=-20,dx=40,dy=60,dz=40] unless entity @s[x=-25,y=90,z=-95,dx=50,dy=60,dz=45] anchored eyes positioned ^ ^ ^2.5 run particle minecraft:explosion_emitter ~ ~ ~ 0.5 0.5 0.5 0 1 normal
execute as @a[scores={use_n_pick=1..}] if items entity @s weapon.mainhand *[custom_data~{explosive_mining:1b}] at @s unless entity @s[x=-35,y=90,z=-35,dx=70,dy=60,dz=70] unless entity @s[x=-25,y=90,z=50,dx=50,dy=60,dz=45] unless entity @s[x=50,y=90,z=-20,dx=40,dy=60,dz=40] unless entity @s[x=-25,y=90,z=-95,dx=50,dy=60,dz=45] anchored eyes positioned ^ ^ ^2.5 run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1.2 1.0

# Hỗ trợ cả trường hợp dùng Cúp Kim Cương nếu có nổ
execute as @a[scores={use_d_pick=1..}] if items entity @s weapon.mainhand *[custom_data~{explosive_mining:1b}] at @s unless entity @s[x=-35,y=90,z=-35,dx=70,dy=60,dz=70] unless entity @s[x=-25,y=90,z=50,dx=50,dy=60,dz=45] unless entity @s[x=50,y=90,z=-20,dx=40,dy=60,dz=40] unless entity @s[x=-25,y=90,z=-95,dx=50,dy=60,dz=45] anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air destroy
execute as @a[scores={use_d_pick=1..}] if items entity @s weapon.mainhand *[custom_data~{explosive_mining:1b}] at @s unless entity @s[x=-35,y=90,z=-35,dx=70,dy=60,dz=70] unless entity @s[x=-25,y=90,z=50,dx=50,dy=60,dz=45] unless entity @s[x=50,y=90,z=-20,dx=40,dy=60,dz=40] unless entity @s[x=-25,y=90,z=-95,dx=50,dy=60,dz=45] anchored eyes positioned ^ ^ ^2.5 run particle minecraft:explosion_emitter ~ ~ ~ 0.5 0.5 0.5 0 1 normal
execute as @a[scores={use_d_pick=1..}] if items entity @s weapon.mainhand *[custom_data~{explosive_mining:1b}] at @s unless entity @s[x=-35,y=90,z=-35,dx=70,dy=60,dz=70] unless entity @s[x=-25,y=90,z=50,dx=50,dy=60,dz=45] unless entity @s[x=50,y=90,z=-20,dx=40,dy=60,dz=40] unless entity @s[x=-25,y=90,z=-95,dx=50,dy=60,dz=45] anchored eyes positioned ^ ^ ^2.5 run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1.2 1.0

scoreboard players set @a[scores={use_n_pick=1..}] use_n_pick 0
scoreboard players set @a[scores={use_d_pick=1..}] use_d_pick 0

# 2. CƠ CHẾ KIẾM CỔ ĐẠI TIER 10+ (HÚT MÁU & SẤM SÉT)
execute as @a[scores={dealt_dmg=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_lifesteal:1b}] at @s run effect give @s minecraft:instant_health 1 0 true
execute as @a[scores={dealt_dmg=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_lifesteal:1b}] at @s run effect give @s minecraft:regeneration 3 1 true
execute as @a[scores={dealt_dmg=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_lifesteal:1b}] at @s run particle minecraft:heart ~ ~1.5 ~ 0.5 0.5 0.5 0.05 6 normal
execute as @a[scores={dealt_dmg=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_lifesteal:1b}] at @s run playsound minecraft:entity.player.burp player @s ~ ~ ~ 0.5 1.5

execute as @a[scores={dealt_dmg=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_lightning:1b}] at @s run effect give @s minecraft:fire_resistance 2 0 true
execute as @a[scores={dealt_dmg=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_lightning:1b}] at @s anchored eyes positioned ^ ^ ^3.5 run summon lightning_bolt ~ ~ ~
execute as @a[scores={dealt_dmg=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_lightning:1b}] at @s anchored eyes positioned ^ ^ ^3.5 run particle minecraft:electric_spark ~ ~ ~ 1 1 1 0.1 20 normal
execute as @a[scores={dealt_dmg=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_lightning:1b}] at @s run playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 0.8 1.2

scoreboard players set @a[scores={dealt_dmg=1..}] dealt_dmg 0

# 3. CƠ CHẾ RÌU CỔ ĐẠI (TREECAPITATOR ĐỐN GỖ NHANH - CÚ PHÁP CHUẨN 1.21.4)
execute as @a[scores={use_n_axe=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_axe:1b}] at @s anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~ ~-1 ~1 ~15 ~1 air replace #minecraft:logs
execute as @a[scores={use_d_axe=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_axe:1b}] at @s anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~ ~-1 ~1 ~15 ~1 air replace #minecraft:logs
scoreboard players set @a[scores={use_n_axe=1..}] use_n_axe 0
scoreboard players set @a[scores={use_d_axe=1..}] use_d_axe 0

# 4. HIỆU ỨNG BỘ GIÁP CỔ ĐẠI (BUFF MÁU, KHÁNG, SPEED, FLY)
execute as @a if items entity @s armor.chest *[custom_data~{ancient_armor_t10:1b}] run effect give @s minecraft:resistance 2 1 true
execute as @a if items entity @s armor.feet *[custom_data~{ancient_armor_t10:1b}] run effect give @s minecraft:speed 2 1 true

execute as @a if items entity @s armor.chest *[custom_data~{ancient_armor_t15:1b}] run effect give @s minecraft:resistance 2 3 true
execute as @a if items entity @s armor.chest *[custom_data~{ancient_armor_t15:1b}] run effect give @s minecraft:regeneration 2 1 true
execute as @a if items entity @s armor.chest *[custom_data~{ancient_armor_t15:1b}] run effect give @s minecraft:fire_resistance 2 0 true
execute as @a if items entity @s armor.feet *[custom_data~{ancient_armor_t15:1b}] run effect give @s minecraft:speed 2 2 true
execute as @a if items entity @s armor.feet *[custom_data~{ancient_armor_t15:1b}] run effect give @s minecraft:slow_falling 2 0 true
execute as @a if items entity @s armor.feet *[custom_data~{ancient_armor_t15:1b}] run effect give @s minecraft:jump_boost 2 1 true
execute as @a at @s if items entity @s armor.chest *[custom_data~{ancient_armor_t15:1b}] run particle minecraft:end_rod ~ ~0.2 ~ 0.2 0.1 0.2 0.02 2 normal

# 5. HIỆU ỨNG TIA SÁNG XOAY 360 ĐỘ CỦA HẢI ĐĂNG (LIGHTHOUSE BEAM)
execute as @e[type=armor_stand,tag=lighthouse_core] at @s run minecraft:teleport @s ~ ~ ~ ~6 ~
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^2 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^4 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^7 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^10 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^14 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^18 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^22 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^26 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^-2 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^-4 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^-7 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^-10 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^-14 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^-18 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^-22 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] rotated ~ 0 run particle minecraft:end_rod ^0 ^0.5 ^-26 0 0 0 0 1 force
execute at @e[type=armor_stand,tag=lighthouse_core] run particle minecraft:glow ~ ~0.5 ~ 0.3 0.3 0.3 0.05 3 force

# ==============================================================================
# HỆ THỐNG ĐỆM PHÓNG LAUNCH PADS (8 BỆ PHÓNG TOÀN DIỆN TẠI QUẦN ĐẢO SPAWN)
# ==============================================================================
# 1. Từ Đảo Trung Tâm đi 4 Cánh:
execute in minecraft:overworld as @a[x=-1,y=120,z=-19,dx=2,dy=2,dz=2] at @s if block ~ ~ ~ heavy_weighted_pressure_plate run function skyblock:launch/to_north
execute in minecraft:overworld as @a[x=-1,y=120,z=17,dx=2,dy=2,dz=2] at @s if block ~ ~ ~ heavy_weighted_pressure_plate run function skyblock:launch/to_south
execute in minecraft:overworld as @a[x=17,y=120,z=-1,dx=2,dy=2,dz=2] at @s if block ~ ~ ~ heavy_weighted_pressure_plate run function skyblock:launch/to_east
execute in minecraft:overworld as @a[x=-19,y=120,z=-1,dx=2,dy=2,dz=2] at @s if block ~ ~ ~ heavy_weighted_pressure_plate run function skyblock:launch/to_west

# 2. Từ 4 Cánh quay về Đảo Trung Tâm:
execute in minecraft:overworld as @a[x=-1,y=120,z=-44,dx=2,dy=2,dz=2] at @s if block ~ ~ ~ heavy_weighted_pressure_plate run function skyblock:launch/to_center
execute in minecraft:overworld as @a[x=-1,y=120,z=42,dx=2,dy=2,dz=2] at @s if block ~ ~ ~ heavy_weighted_pressure_plate run function skyblock:launch/to_center
execute in minecraft:overworld as @a[x=42,y=120,z=-1,dx=2,dy=2,dz=2] at @s if block ~ ~ ~ heavy_weighted_pressure_plate run function skyblock:launch/to_center
execute in minecraft:overworld as @a[x=-44,y=120,z=-1,dx=2,dy=2,dz=2] at @s if block ~ ~ ~ heavy_weighted_pressure_plate run function skyblock:launch/to_center

# ==============================================================================
# HỆ THỐNG 5 CỔNG DỊCH CHUYỂN MINI TẠI CÁNH ĐÔNG (COSMIC STARGATE REALMS)
# ==============================================================================
execute in minecraft:overworld as @a[x=52,y=120,z=-8,dx=2,dy=2,dz=2] at @s if block ~ ~ ~ stone_pressure_plate run tp @s 0.5 111.0 76.0 0 0
execute in minecraft:overworld as @a[x=47,y=120,z=-6,dx=2,dy=2,dz=2] at @s if block ~ ~ ~ stone_pressure_plate run tp @s -80.5 111.0 0.5 90 0
execute in minecraft:overworld as @a[x=47,y=120,z=4,dx=2,dy=2,dz=2] at @s if block ~ ~ ~ stone_pressure_plate run tp @s 0.5 111.0 -78.0 180 0
execute in minecraft:overworld as @a[x=52,y=120,z=6,dx=2,dy=2,dz=2] at @s if block ~ ~ ~ stone_pressure_plate run tp @s 76.5 111.0 0.5 -90 0

# ==============================================================================
# MENU WARP TƯƠNG TÁC (/WARP, /WARPS)
# ==============================================================================
scoreboard players enable @a warp_menu
execute as @a[scores={warp_menu=1..}] at @s run function skyblock:warp_menu
scoreboard players set @a[scores={warp_menu=1..}] warp_menu 0
