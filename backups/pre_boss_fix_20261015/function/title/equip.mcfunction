# ==============================================================================
# HỆ THỐNG ĐEO DANH HIỆU (EQUIP TITLE)
# ==============================================================================

# 1. [🌱 Tân Binh] - Miễn phí
execute if score @s equip_title matches 1 run tag @s add title_tanbinh
execute if score @s equip_title matches 1 run team join tag_tanbinh @s
execute if score @s equip_title matches 1 run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[🌱 Tân Binh]","color":"green","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 1 run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5

# 2. [⛏ Thợ Mỏ] - $50,000
execute if score @s equip_title matches 2 if entity @s[tag=title_thomo] run team join tag_thomo @s
execute if score @s equip_title matches 2 if entity @s[tag=title_thomo] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[⛏ Thợ Mỏ]","color":"gray","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 2 if entity @s[tag=title_thomo] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 2 unless entity @s[tag=title_thomo] run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Bạn chưa sở hữu danh hiệu ","color":"yellow"},{"text":"[⛏ Thợ Mỏ]","color":"gray","bold":true},{"text":"! Hãy bấm [MUA] ($50,000) trong menu để mở khóa.","color":"yellow"}]
execute if score @s equip_title matches 2 unless entity @s[tag=title_thomo] run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8

# 3. [🪓 Tiều Phu] - $150,000
execute if score @s equip_title matches 3 if entity @s[tag=title_tieuphu] run team join tag_tieuphu @s
execute if score @s equip_title matches 3 if entity @s[tag=title_tieuphu] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[🪓 Tiều Phu]","color":"dark_green","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 3 if entity @s[tag=title_tieuphu] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 3 unless entity @s[tag=title_tieuphu] run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Bạn chưa sở hữu danh hiệu ","color":"yellow"},{"text":"[🪓 Tiều Phu]","color":"dark_green","bold":true},{"text":"! Hãy bấm [MUA] ($150,000) trong menu để mở khóa.","color":"yellow"}]
execute if score @s equip_title matches 3 unless entity @s[tag=title_tieuphu] run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8

# 4. [🌾 Nông Thần] - $300,000
execute if score @s equip_title matches 4 if entity @s[tag=title_nongthan] run team join tag_nongthan @s
execute if score @s equip_title matches 4 if entity @s[tag=title_nongthan] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[🌾 Nông Thần]","color":"yellow","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 4 if entity @s[tag=title_nongthan] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 4 unless entity @s[tag=title_nongthan] run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Bạn chưa sở hữu danh hiệu ","color":"yellow"},{"text":"[🌾 Nông Thần]","color":"yellow","bold":true},{"text":"! Hãy bấm [MUA] ($300,000) trong menu để mở khóa.","color":"yellow"}]
execute if score @s equip_title matches 4 unless entity @s[tag=title_nongthan] run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8

# 5. [💎 Triệu Phú] - $1,000,000
execute if score @s equip_title matches 5 if entity @s[tag=title_trieuphu] run team join tag_trieuphu @s
execute if score @s equip_title matches 5 if entity @s[tag=title_trieuphu] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[💎 Triệu Phú]","color":"aqua","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 5 if entity @s[tag=title_trieuphu] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 5 unless entity @s[tag=title_trieuphu] run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Bạn chưa sở hữu danh hiệu ","color":"yellow"},{"text":"[💎 Triệu Phú]","color":"aqua","bold":true},{"text":"! Hãy bấm [MUA] ($1,000,000) trong menu để mở khóa.","color":"yellow"}]
execute if score @s equip_title matches 5 unless entity @s[tag=title_trieuphu] run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8

# 6. [👑 ĐẠI PHÚ HÀO] - $5,000,000
execute if score @s equip_title matches 6 if entity @s[tag=title_daiphuhao] run team join tag_daiphuhao @s
execute if score @s equip_title matches 6 if entity @s[tag=title_daiphuhao] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[👑 ĐẠI PHÚ HÀO]","color":"gold","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 6 if entity @s[tag=title_daiphuhao] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 6 unless entity @s[tag=title_daiphuhao] run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Bạn chưa sở hữu danh hiệu ","color":"yellow"},{"text":"[👑 ĐẠI PHÚ HÀO]","color":"gold","bold":true},{"text":"! Hãy bấm [MUA] ($5,000,000) trong menu để mở khóa.","color":"yellow"}]
execute if score @s equip_title matches 6 unless entity @s[tag=title_daiphuhao] run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8

# 7. [🔱 TÀI PHIỆT] - $20,000,000
execute if score @s equip_title matches 7 if entity @s[tag=title_taiphiet] run team join tag_taiphiet @s
execute if score @s equip_title matches 7 if entity @s[tag=title_taiphiet] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[🔱 TÀI PHIỆT]","color":"light_purple","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 7 if entity @s[tag=title_taiphiet] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 7 unless entity @s[tag=title_taiphiet] run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Bạn chưa sở hữu danh hiệu ","color":"yellow"},{"text":"[🔱 TÀI PHIỆT]","color":"light_purple","bold":true},{"text":"! Hãy bấm [MUA] ($20,000,000) trong menu để mở khóa.","color":"yellow"}]
execute if score @s equip_title matches 7 unless entity @s[tag=title_taiphiet] run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8

# 8. [☠ Sát Thủ Boss]
execute if score @s equip_title matches 8 if entity @s[tag=title_boss] run team join tag_boss @s
execute if score @s equip_title matches 8 if entity @s[tag=title_boss] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[☠ Sát Thủ Boss]","color":"dark_red","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 8 if entity @s[tag=title_boss] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 8 unless entity @s[tag=title_boss] run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Bạn chưa mở khóa danh hiệu ","color":"yellow"},{"text":"[☠ Sát Thủ Boss]","color":"dark_red","bold":true},{"text":"! Hãy hạ gục Chúa Tể Bóng Tối tại /warp boss để nhận!","color":"yellow"}]
execute if score @s equip_title matches 8 unless entity @s[tag=title_boss] run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8

# 9. [🏃 Bậc Thầy Parkour]
execute if score @s equip_title matches 9 if entity @s[tag=title_parkour] run team join tag_parkour @s
execute if score @s equip_title matches 9 if entity @s[tag=title_parkour] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[🏃 Bậc Thầy Parkour]","color":"blue","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 9 if entity @s[tag=title_parkour] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 9 unless entity @s[tag=title_parkour] run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Bạn chưa mở khóa danh hiệu ","color":"yellow"},{"text":"[🏃 Bậc Thầy Parkour]","color":"blue","bold":true},{"text":"! Hãy leo đỉnh tháp 30 tầng tại /warp parkour để nhận!","color":"yellow"}]
execute if score @s equip_title matches 9 unless entity @s[tag=title_parkour] run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8

# 10. [🩸 Đấu Sĩ Bất Bại]
execute if score @s equip_title matches 10 if entity @s[tag=title_pvp] run team join tag_pvp @s
execute if score @s equip_title matches 10 if entity @s[tag=title_pvp] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[🩸 Đấu Sĩ Bất Bại]","color":"red","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 10 if entity @s[tag=title_pvp] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 10 unless entity @s[tag=title_pvp] run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Bạn chưa mở khóa danh hiệu ","color":"yellow"},{"text":"[🩸 Đấu Sĩ Bất Bại]","color":"red","bold":true},{"text":"! Hãy chiến thắng PvP tại /warp pvp để nhận!","color":"yellow"}]
execute if score @s equip_title matches 10 unless entity @s[tag=title_pvp] run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8

# 11. [🎣 Lão Ngư]
execute if score @s equip_title matches 11 if entity @s[tag=title_laongu] run team join tag_laongu @s
execute if score @s equip_title matches 11 if entity @s[tag=title_laongu] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[🎣 Lão Ngư]","color":"dark_aqua","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 11 if entity @s[tag=title_laongu] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 11 unless entity @s[tag=title_laongu] run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Bạn chưa mở khóa danh hiệu ","color":"yellow"},{"text":"[🎣 Lão Ngư]","color":"dark_aqua","bold":true},{"text":"! Hãy câu đủ 5 con cá tại /warp cauca để mở khóa!","color":"yellow"}]
execute if score @s equip_title matches 11 unless entity @s[tag=title_laongu] run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8

# 12. [🌌 Chúa Tể Hư Không]
execute if score @s equip_title matches 12 if entity @s[tag=title_void] run team join tag_tier15 @s
execute if score @s equip_title matches 12 if entity @s[tag=title_tier15] run team join tag_tier15 @s
execute if score @s equip_title matches 12 if entity @s[tag=title_void] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[🌌 Chúa Tể Hư Không]","color":"dark_purple","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 12 if entity @s[tag=title_tier15] unless entity @s[tag=title_void] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[🌌 Chúa Tể Hư Không]","color":"dark_purple","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 12 if entity @s[tag=title_void] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 12 if entity @s[tag=title_tier15] unless entity @s[tag=title_void] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 12 unless entity @s[tag=title_void] unless entity @s[tag=title_tier15] run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Bạn chưa mở khóa danh hiệu ","color":"yellow"},{"text":"[🌌 Chúa Tể Hư Không]","color":"dark_purple","bold":true},{"text":"! Hãy hạ gục Chúa Tể Hư Không hoặc đạt trang bị Tier 15 Vĩnh Cửu để nhận!","color":"yellow"}]
execute if score @s equip_title matches 12 unless entity @s[tag=title_void] unless entity @s[tag=title_tier15] run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8

# 13. [🎲 Thần Bài Coinflip]
execute if score @s equip_title matches 13 if entity @s[tag=title_cf] run team join tag_cf @s
execute if score @s equip_title matches 13 if entity @s[tag=title_cf] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[🎲 Thần Bài Coinflip]","color":"gold","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 13 if entity @s[tag=title_cf] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 13 unless entity @s[tag=title_cf] run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Bạn chưa mở khóa danh hiệu ","color":"yellow"},{"text":"[🎲 Thần Bài Coinflip]","color":"gold","bold":true},{"text":"! Hãy thắng cược Coinflip tại /cf để nhận!","color":"yellow"}]
execute if score @s equip_title matches 13 unless entity @s[tag=title_cf] run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8

# 14. [🎟 Trúng Số Độc Đắc]
execute if score @s equip_title matches 14 if entity @s[tag=title_jackpot] run team join tag_jackpot @s
execute if score @s equip_title matches 14 if entity @s[tag=title_jackpot] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đã trang bị danh hiệu: ","color":"green"},{"text":"[🎟 Trúng Số Độc Đắc]","color":"green","bold":true},{"text":"! Prefix đã cập nhật trên đầu và Tablist!","color":"yellow"}]
execute if score @s equip_title matches 14 if entity @s[tag=title_jackpot] run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s equip_title matches 14 unless entity @s[tag=title_jackpot] run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Bạn chưa mở khóa danh hiệu ","color":"yellow"},{"text":"[🎟 Trúng Số Độc Đắc]","color":"green","bold":true},{"text":"! Hãy nổ hũ Jackpot Giải Đặc Biệt tại /xoso để nhận!","color":"yellow"}]
execute if score @s equip_title matches 14 unless entity @s[tag=title_jackpot] run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8

# Reset trigger
scoreboard players set @s equip_title 0
