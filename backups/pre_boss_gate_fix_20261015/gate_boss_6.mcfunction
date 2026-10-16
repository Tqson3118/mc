# ==============================================================================
# KIỂM TRA ĐIỀU KIỆN & TRIỆU HỒI BOSS 6: THẦN DIỆT THẾ THIÊN CUNG (COSMIC OVERLORD)
# Yêu cầu: Fighting Lv.50 + Bùa Thần Diệt Thế (totem:"boss_6")
# ==============================================================================

# 1. Kiểm tra Boss đã sống hay chưa
execute if score #boss_6_alive boss_status matches 1 run tellraw @p [{"text":"[Triệu Hồi Boss] ","color":"red","bold":true},{"text":"Hoàng Đế Tinh Tú Vĩnh Hằng hiện đang chiến đấu! Hãy tham chiến hỗ trợ đồng đội!","color":"yellow"}]

# 2. Kiểm tra Cấp Độ Kỹ Năng Fighting (< 50 hoặc chưa đạt)
execute if score #boss_6_alive boss_status matches 0 unless score @p askill_fighting matches 50.. unless entity @p[tag=boss_bypass] run tellraw @p [{"text":"[Cổng Kỹ Năng] ","color":"red","bold":true},{"text":"Bạn chưa đủ cấp độ! Yêu cầu Kỹ Năng Chiến Đấu ","color":"yellow"},{"text":"(Fighting) TỐI CAO Cấp 50","color":"gold","bold":true},{"text":" để mở Thiên Cung Sáng Thế! (Gõ /skills để xem)","color":"yellow"}]
execute if score #boss_6_alive boss_status matches 0 unless score @p askill_fighting matches 50.. unless entity @p[tag=boss_bypass] run playsound minecraft:entity.villager.no player @p ~ ~ ~ 1.0 1.0

# 3. Kiểm tra Bùa Triệu Hồi khi đã đủ cấp độ
# 3.1 Thiếu Bùa Thần Diệt Thế
execute if score #boss_6_alive boss_status matches 0 if score @p askill_fighting matches 50.. unless items entity @p container.* *[custom_data~{totem:"boss_6"}] unless entity @p[tag=boss_bypass] run tellraw @p [{"text":"[Triệu Hồi Boss] ","color":"red","bold":true},{"text":"Bạn không có ","color":"yellow"},{"text":"[🌌 Bùa Thần Diệt Thế 🌌]","color":"gold","bold":true},{"text":" trong túi đồ! Hãy chế tạo tại NPC Thuật Sĩ (8 Khối Netherite + 1 Tinh Thể Phong Lôi + 1 Mảnh Linh Hồn).","color":"yellow"}]
execute if score #boss_6_alive boss_status matches 0 if score @p askill_fighting matches 50.. unless items entity @p container.* *[custom_data~{totem:"boss_6"}] unless entity @p[tag=boss_bypass] run playsound minecraft:entity.villager.no player @p ~ ~ ~ 1.0 1.0

# 3.2 Đủ điều kiện và có Bùa: Tiêu hao 1 Bùa và Triệu Hồi Boss
execute if score #boss_6_alive boss_status matches 0 if score @p askill_fighting matches 50.. if items entity @p container.* *[custom_data~{totem:"boss_6"}] run tellraw @p [{"text":"[Hiến Tế Tối Thượng] ","color":"gold","bold":true},{"text":"Bạn đã hiến tế ","color":"yellow"},{"text":"[Bùa Thần Diệt Thế]","color":"gold","bold":true},{"text":"! Thiên Hà rung chuyển, Hoàng Đế Tinh Tú giáng lâm!","color":"light_purple"}]
execute if score #boss_6_alive boss_status matches 0 if score @p askill_fighting matches 50.. if items entity @p container.* *[custom_data~{totem:"boss_6"}] run function skyblock:summon_boss_6
execute if score #boss_6_alive boss_status matches 1 if score @p askill_fighting matches 50.. run clear @p *[custom_data~{totem:"boss_6"}] 1

# 3.3 Hỗ trợ bypass cho Admin/Tester
execute if score #boss_6_alive boss_status matches 0 if entity @p[tag=boss_bypass] unless items entity @p container.* *[custom_data~{totem:"boss_6"}] run function skyblock:summon_boss_6
