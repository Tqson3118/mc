# Master Skyblock Spawn Architecture Build
tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"Đang tái tạo Siêu Quần Đảo Spawn Hub (Hybrid Fantasy Citadel)...","color":"yellow"}]

# 1. Xây Đảo Trung Tâm
function skyblock:builder/hub_core

# 2. Xây Cánh Bắc: Thánh Điện Rèn 15 Tiers
function skyblock:builder/hub_north

# 3. Xây Cánh Nam: Rương Báu & BXH
function skyblock:builder/hub_south

# 4. Xây Cánh Đông: Đại Cổng Stargate
function skyblock:builder/hub_east

# 5. Xây Cánh Tây: Đại Chợ & Casino
function skyblock:builder/hub_west

# 6. Triệu hồi NPC & Thương Nhân đúng tọa độ mới
function skyblock:build_trade
function skyblock:build_evolution_npc
function skyblock:build_crates
function skyblock:build_casino

setworldspawn 0 122 0
tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"Siêu Quần Đảo Spawn Hub Mới đã hoàn thành lộng lẫy và sẵn sàng!","color":"green","bold":true}]
