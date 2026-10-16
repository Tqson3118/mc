# ==============================================================================
# PHẦN THƯỞNG CHINH PHỤC ĐỈNH THÁP PARKOUR 30 TẦNG
# ==============================================================================

# Trao 50 Khối Ngọc Lục Bảo ($50,000 Xu) & Mở khóa Danh Hiệu
give @s emerald_block 50
scoreboard players add @s eco_add 50000
tag @s add title_parkour

# Trao 1 Chìa Khóa Thần Thoại (Mythic Key)
give @s ominous_trial_key[custom_data={crate_key:"mythic"},item_name='{"text":"Chìa Khóa Thần Thoại","color":"light_purple","bold":true}',lore=['{"text":"Phần thưởng vinh quang từ Đỉnh Tháp Parkour!","color":"gold"}','{"text":"Dùng để mở Hòm Thần Thoại tại Spawn!","color":"light_purple"}']] 1

# Trao 2 Tinh Thể Phong Lôi (Catalyst Độc Quyền world_parkour)
give @s wind_charge[custom_data={ancient_mat:"storm_crystal"},item_name='{"text":"⚡ Tinh Thể Phong Lôi ⚡","color":"yellow","bold":true}',lore=['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}','{"text":"Ngưng tụ từ cuồng lôi trên đỉnh Tháp 50 Tầng!","color":"gray","italic":true}','{"text":"⚡ Dùng để chế Bùa Boss 6 & Rèn Tier 15","color":"yellow"}','{"text":"[Nguồn]: Tháp Parkour Phong Lôi world_parkour","color":"aqua","bold":true}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}']] 2

# Thưởng 250 Điểm Tinh Anh
scoreboard players add @s gems_add 250

# Trao Cúp Vàng Parkour Kỷ Niệm
give @s gold_block[custom_data={parkour_trophy:1b},item_name='{"text":"🏆 CÚP VÀNG VUA PARKOUR 🏆","color":"gold","bold":true}',lore=['{"text":"Chứng nhận chinh phục thành công","color":"yellow"}','{"text":"Đỉnh Tháp Thử Thách 50 Tầng!","color":"green"}']] 1

# Bắn pháo hoa rực rỡ trên đỉnh tháp
summon firework_rocket 45 177 -43 {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",colors:[16755200,16711680,65535],fade_colors:[16776960]}]}}}}
summon firework_rocket 43 177 -45 {LifeTime:25,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[65280,16755200],fade_colors:[16777215]}]}}}}

# Âm thanh chiến thắng
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.5 1.5
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.0

# Thông báo toàn server
tellraw @a [{"text":"═══════════════════════════════════════════════\n","color":"gold","bold":true},{"text":"★ VINH QUANG ĐỈNH CAO PARKOUR! ★\n","color":"yellow","bold":true},{"text":"Người chơi ","color":"white"},{"selector":"@s","color":"aqua","bold":true},{"text":" đã xuất sắc chinh phục ĐỈNH THÁP PHONG LÔI!\n","color":"green"},{"text":"Nhận thưởng: ","color":"yellow"},{"text":"$50,000 Xu, 250 Điểm Tinh Anh, 1 Mythic Key & 2 Tinh Thể Phong Lôi!\n","color":"light_purple","bold":true},{"text":"═══════════════════════════════════════════════","color":"gold","bold":true}]

# Mở khóa danh hiệu [🏃 Bậc Thầy Parkour]
tag @s add title_parkour
tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Chúc mừng bạn đã mở khóa danh hiệu: ","color":"yellow"},{"text":"[🏃 Bậc Thầy Parkour]","color":"blue","bold":true},{"text":"! (Gõ /danhhieu để đeo)","color":"green"}]

# Xóa thẻ checkpoint để chuẩn bị cho lần thử thách tiếp theo
tag @s remove pk_cp1
tag @s remove pk_cp2
tag @s remove pk_cp1_msg
tag @s remove pk_cp2_msg

# Dịch chuyển người chơi về Spawn
execute in minecraft:overworld run teleport @s 0.5 122.0 0.5 0 0
