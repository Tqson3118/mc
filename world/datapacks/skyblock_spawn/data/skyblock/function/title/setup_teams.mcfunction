# ==============================================================================
# HỆ THỐNG DANH HIỆU & RANK CHAT / TABLIST - KHỞI TẠO TEAMS & SCOREBOARDS
# ==============================================================================

# 1. Khởi tạo các Trigger và Dummy Objectives cho Menu Danh Hiệu
scoreboard objectives add danhhieu trigger {"text":"Menu Danh Hiệu","color":"gold"}
scoreboard objectives add buy_title trigger {"text":"Mua Danh Hiệu","color":"yellow"}
scoreboard objectives add equip_title trigger {"text":"Đeo Danh Hiệu","color":"green"}
scoreboard objectives add remove_title trigger {"text":"Tháo Danh Hiệu","color":"red"}

# 2. Khởi tạo Objectives theo dõi chiến tích tự động
scoreboard objectives add pvp_kills playerKillCount
scoreboard objectives add kill_wither_skel minecraft.killed:minecraft.wither_skeleton
scoreboard objectives add fish_caught minecraft.custom:minecraft.fish_caught

# 3. Khởi tạo 14 Scoreboard Teams tương ứng 14 Danh Hiệu

# --- NHÓM PHÚ HÀO (1..7) ---
team add tag_tanbinh
team modify tag_tanbinh prefix {"text":"[🌱 Tân Binh] ","color":"green","bold":true}
team modify tag_tanbinh color green

team add tag_thomo
team modify tag_thomo prefix {"text":"[⛏ Thợ Mỏ] ","color":"gray","bold":true}
team modify tag_thomo color gray

team add tag_tieuphu
team modify tag_tieuphu prefix {"text":"[🪓 Tiều Phu] ","color":"dark_green","bold":true}
team modify tag_tieuphu color dark_green

team add tag_nongthan
team modify tag_nongthan prefix {"text":"[🌾 Nông Thần] ","color":"yellow","bold":true}
team modify tag_nongthan color yellow

team add tag_trieuphu
team modify tag_trieuphu prefix {"text":"[💎 Triệu Phú] ","color":"aqua","bold":true}
team modify tag_trieuphu color aqua

team add tag_daiphuhao
team modify tag_daiphuhao prefix {"text":"[👑 ĐẠI PHÚ HÀO] ","color":"gold","bold":true}
team modify tag_daiphuhao color gold

team add tag_taiphiet
team modify tag_taiphiet prefix {"text":"[🔱 TÀI PHIỆT] ","color":"light_purple","bold":true}
team modify tag_taiphiet color light_purple

# --- NHÓM CHIẾN TÍCH (8..12) ---
team add tag_boss
team modify tag_boss prefix {"text":"[☠ Sát Thủ Boss] ","color":"dark_red","bold":true}
team modify tag_boss color dark_red

team add tag_parkour
team modify tag_parkour prefix {"text":"[🏃 Bậc Thầy Parkour] ","color":"blue","bold":true}
team modify tag_parkour color blue

team add tag_pvp
team modify tag_pvp prefix {"text":"[🩸 Đấu Sĩ Bất Bại] ","color":"red","bold":true}
team modify tag_pvp color red

team add tag_laongu
team modify tag_laongu prefix {"text":"[🎣 Lão Ngư] ","color":"dark_aqua","bold":true}
team modify tag_laongu color dark_aqua

team add tag_tier15
team modify tag_tier15 prefix {"text":"[🌌 Chúa Tể Hư Không] ","color":"dark_purple","bold":true}
team modify tag_tier15 color dark_purple

# --- NHÓM ĐỎ ĐEN (13..14) ---
team add tag_cf
team modify tag_cf prefix {"text":"[🎲 Thần Bài Coinflip] ","color":"gold","bold":true}
team modify tag_cf color gold

team add tag_jackpot
team modify tag_jackpot prefix {"text":"[🎟 Trúng Số Độc Đắc] ","color":"green","bold":true}
team modify tag_jackpot color green

# Đánh dấu đã khởi tạo thành công
scoreboard players set #init_title temp 1
