# ==============================================================================
# KIỂM TRA ĐIỀU KIỆN & TRIỆU HỒI BOSS 2: ĐAO PHỦ ĐỊA NGỤC
# Yêu cầu: Fighting Lv.10 + Bùa Hỏa Ngục (totem:"boss_2")
# ==============================================================================

# 1. Kiểm tra Boss đã sống hay chưa
execute if score #boss_2_alive boss_status matches 1 run tellraw @p [{"text":"[Triệu Hồi Boss] ","color":"red","bold":true},{"text":"Đao Phủ Địa Ngục hiện đang chiến đấu! Hãy tham chiến hỗ trợ đồng đội!","color":"yellow"}]

# 2. Kiểm tra Cấp Độ Kỹ Năng Fighting (< 10 hoặc chưa đạt)
execute if score #boss_2_alive boss_status matches 0 unless score @p askill_fighting matches 10.. unless entity @p[tag=boss_bypass] run tellraw @p [{"text":"[Cổng Kỹ Năng] ","color":"red","bold":true},{"text":"Bạn chưa đủ cấp độ! Yêu cầu Kỹ Năng Chiến Đấu ","color":"yellow"},{"text":"(Fighting) tối thiểu Cấp 10","color":"gold","bold":true},{"text":" để mở Đấu Trường này! (Gõ /skills để xem)","color":"yellow"}]
execute if score #boss_2_alive boss_status matches 0 unless score @p askill_fighting matches 10.. unless entity @p[tag=boss_bypass] run playsound minecraft:entity.villager.no player @p ~ ~ ~ 1.0 1.0

# 3. Kiểm tra Bùa Triệu Hồi khi đã đủ cấp độ
# 3.1 Thiếu Bùa Hỏa Ngục
execute if score #boss_2_alive boss_status matches 0 if score @p askill_fighting matches 10.. unless items entity @p container.* *[custom_data~{totem:"boss_2"}] unless entity @p[tag=boss_bypass] run tellraw @p [{"text":"[Triệu Hồi Boss] ","color":"red","bold":true},{"text":"Bạn không có ","color":"yellow"},{"text":"[🔥 Bùa Hỏa Ngục 🔥]","color":"red","bold":true},{"text":" trong túi đồ! Hãy chế tạo tại NPC Thuật Sĩ Triệu Hồi (16 Que Blaze + 64 Than).","color":"yellow"}]
execute if score #boss_2_alive boss_status matches 0 if score @p askill_fighting matches 10.. unless items entity @p container.* *[custom_data~{totem:"boss_2"}] unless entity @p[tag=boss_bypass] run playsound minecraft:entity.villager.no player @p ~ ~ ~ 1.0 1.0

# 3.2 Đủ điều kiện và có Bùa: Tiêu hao 1 Bùa và Triệu Hồi Boss
execute if score #boss_2_alive boss_status matches 0 if score @p askill_fighting matches 10.. if items entity @p container.* *[custom_data~{totem:"boss_2"}] run tellraw @p [{"text":"[Hiến Tế] ","color":"green","bold":true},{"text":"Bạn đã hiến tế ","color":"yellow"},{"text":"[Bùa Hỏa Ngục]","color":"gold","bold":true},{"text":"! Lửa ngục bốc cháy dữ dội!","color":"red"}]
execute if score #boss_2_alive boss_status matches 0 if score @p askill_fighting matches 10.. if items entity @p container.* *[custom_data~{totem:"boss_2"}] run function skyblock:summon_boss_2
execute if score #boss_2_alive boss_status matches 1 if score @p askill_fighting matches 10.. run clear @p *[custom_data~{totem:"boss_2"}] 1

# 3.3 Hỗ trợ bypass cho Admin/Tester
execute if score #boss_2_alive boss_status matches 0 if entity @p[tag=boss_bypass] unless items entity @p container.* *[custom_data~{totem:"boss_2"}] run function skyblock:summon_boss_2
