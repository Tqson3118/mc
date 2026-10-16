# ==============================================================================
# KIỂM TRA ĐIỀU KIỆN & TRIỆU HỒI BOSS 5: CỔ THẦN VỰC THẲM (SCULK GUARDIAN)
# Yêu cầu: Fighting Lv.40 + Bùa Vực Thẳm (totem:"boss_5")
# ==============================================================================

# 1. Kiểm tra Boss đã sống hay chưa
execute if score #boss_5_alive boss_status matches 1 run tellraw @p [{"text":"[Triệu Hồi Boss] ","color":"red","bold":true},{"text":"Cổ Thần Vực Thẳm hiện đang chiến đấu! Hãy tham chiến hỗ trợ đồng đội!","color":"yellow"}]

# 2. Kiểm tra Cấp Độ Kỹ Năng Fighting (< 40 hoặc chưa đạt)
execute if score #boss_5_alive boss_status matches 0 unless score @p askill_fighting matches 40.. unless entity @p[tag=boss_bypass] run tellraw @p [{"text":"[Cổng Kỹ Năng] ","color":"red","bold":true},{"text":"Bạn chưa đủ cấp độ! Yêu cầu Kỹ Năng Chiến Đấu ","color":"yellow"},{"text":"(Fighting) tối thiểu Cấp 40","color":"gold","bold":true},{"text":" để mở Đấu Trường này! (Gõ /skills để xem)","color":"yellow"}]
execute if score #boss_5_alive boss_status matches 0 unless score @p askill_fighting matches 40.. unless entity @p[tag=boss_bypass] run playsound minecraft:entity.villager.no player @p ~ ~ ~ 1.0 1.0

# 3. Kiểm tra Bùa Triệu Hồi khi đã đủ cấp độ
# 3.1 Thiếu Bùa Vực Thẳm
execute if score #boss_5_alive boss_status matches 0 if score @p askill_fighting matches 40.. unless items entity @p container.* *[custom_data~{totem:"boss_5"}] unless entity @p[tag=boss_bypass] run tellraw @p [{"text":"[Triệu Hồi Boss] ","color":"red","bold":true},{"text":"Bạn không có ","color":"yellow"},{"text":"[💠 Bùa Vực Thẳm 💠]","color":"dark_aqua","bold":true},{"text":" trong túi đồ! Hãy chế tạo tại NPC Thuật Sĩ Triệu Hồi (32 Khối Ngọc Lục Bảo + 1 Vảy Thần Biển Sâu từ world_cauca).","color":"yellow"}]
execute if score #boss_5_alive boss_status matches 0 if score @p askill_fighting matches 40.. unless items entity @p container.* *[custom_data~{totem:"boss_5"}] unless entity @p[tag=boss_bypass] run playsound minecraft:entity.villager.no player @p ~ ~ ~ 1.0 1.0

# 3.2 Đủ điều kiện và có Bùa: Tiêu hao 1 Bùa và Triệu Hồi Boss
execute if score #boss_5_alive boss_status matches 0 if score @p askill_fighting matches 40.. if items entity @p container.* *[custom_data~{totem:"boss_5"}] run tag @p add just_summoned_boss_5
execute if entity @p[tag=just_summoned_boss_5] run tellraw @p [{"text":"[Hiến Tế] ","color":"green","bold":true},{"text":"Bạn đã hiến tế ","color":"yellow"},{"text":"[Bùa Vực Thẳm]","color":"gold","bold":true},{"text":"! Cổ Thần Sculk thức tỉnh gầm thét!","color":"dark_aqua"}]
execute if entity @p[tag=just_summoned_boss_5] run clear @p *[custom_data~{totem:"boss_5"}] 1
execute if entity @p[tag=just_summoned_boss_5] run function skyblock:summon_boss_5
execute if entity @p[tag=just_summoned_boss_5] run tag @p remove just_summoned_boss_5

# 3.3 Hỗ trợ bypass cho Admin/Tester
execute if score #boss_5_alive boss_status matches 0 if entity @p[tag=boss_bypass] unless items entity @p container.* *[custom_data~{totem:"boss_5"}] run function skyblock:summon_boss_5
