# ===============================================================
# SKYBLOCK - NGỌN THÁP HẢI ĐĂNG HOÀNG GIA (LIGHTHOUSE TOWER)
# ===============================================================

# 1. Âm thanh kích hoạt kỳ vĩ
execute at @s run playsound minecraft:block.beacon.activate master @a ~ ~ ~ 3.0 1.0
execute at @s run playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 2.0 1.2

# 2. Xóa sạch cột không khí thẳng đứng từ đáy lên đỉnh mây để tia sáng không bị cản
execute at @s run fill ~ ~1 ~ ~ 319 ~ air replace

# 3. Xây bệ Kim Cương 4 tầng kích hoạt Beacon tối thượng
execute at @s run fill ~-4 ~-4 ~-4 ~4 ~-4 ~4 diamond_block
execute at @s run fill ~-3 ~-3 ~-3 ~3 ~-3 ~3 diamond_block
execute at @s run fill ~-2 ~-2 ~-2 ~2 ~-2 ~2 diamond_block
execute at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 diamond_block
execute at @s run setblock ~ ~ ~ beacon
execute at @s run data merge block ~ ~ ~ {primary_effect:"minecraft:haste",secondary_effect:"minecraft:regeneration"}

# 4. Kính đổi màu cột sáng Hải Đăng (Gradient Xanh Lam - Trắng - Vàng hoàng kim)
execute at @s run setblock ~ ~1 ~ light_blue_stained_glass
execute at @s run setblock ~ ~2 ~ light_blue_stained_glass
execute at @s run setblock ~ ~3 ~ white_stained_glass
execute at @s run setblock ~ ~4 ~ white_stained_glass
execute at @s run setblock ~ ~5 ~ yellow_stained_glass
execute at @s run setblock ~ ~6 ~ yellow_stained_glass

# 5. Xây thân tháp Hải Đăng (Hình trụ sọc Xanh Lam - Trắng lộng lẫy)
# Tầng đế Y=0..1: Đá phiến sâu gạch & Bậc thang
execute at @s run fill ~-3 ~0 ~-3 ~3 ~0 ~3 deepslate_bricks
execute at @s run fill ~-2 ~1 ~-2 ~2 ~1 ~2 smooth_quartz

# Thân tháp sọc Trắng & Xanh Lam lộng lẫy (Y=2..10)
execute at @s run fill ~-2 ~2 ~-2 ~2 ~3 ~2 light_blue_concrete
execute at @s run fill ~-1 ~2 ~-1 ~1 ~3 ~1 air
execute at @s run fill ~-2 ~4 ~-2 ~2 ~5 ~2 white_concrete
execute at @s run fill ~-1 ~4 ~-1 ~1 ~5 ~1 air
execute at @s run fill ~-2 ~6 ~-2 ~2 ~7 ~2 light_blue_concrete
execute at @s run fill ~-1 ~6 ~-1 ~1 ~7 ~1 air
execute at @s run fill ~-2 ~8 ~-2 ~2 ~9 ~2 white_concrete
execute at @s run fill ~-1 ~8 ~-1 ~1 ~9 ~1 air
execute at @s run fill ~-2 ~10 ~-2 ~2 ~10 ~2 light_blue_concrete
execute at @s run fill ~-1 ~10 ~-1 ~1 ~10 ~1 air

# Cửa vào tháp ở mặt phía Nam (Z: +2)
execute at @s run fill ~-1 ~1 ~2 ~1 ~3 ~2 air

# Ban công ngắm cảnh (Y=11): Sàn thạch anh 7x7 & Lan can sắt
execute at @s run fill ~-3 ~11 ~-3 ~3 ~11 ~3 smooth_quartz
execute at @s run fill ~-1 ~11 ~-1 ~1 ~11 ~1 air
execute at @s run fill ~-3 ~12 ~-3 ~3 ~12 ~3 iron_bars
execute at @s run fill ~-2 ~12 ~-2 ~2 ~12 ~2 air

# Buồng đèn Hải Đăng (Lantern Dome) Y=12..14: Kính trong suốt & Đèn biển 4 góc
execute at @s run fill ~-2 ~12 ~-2 ~2 ~14 ~2 glass
execute at @s run fill ~-1 ~12 ~-1 ~1 ~14 ~1 air
execute at @s run setblock ~-2 ~12 ~-2 sea_lantern
execute at @s run setblock ~2 ~12 ~-2 sea_lantern
execute at @s run setblock ~-2 ~12 ~2 sea_lantern
execute at @s run setblock ~2 ~12 ~2 sea_lantern

# Mái vòm Hải Đăng (Y=15..16): Chóp tháp thạch anh & Cột thu lôi
execute at @s run fill ~-2 ~15 ~-2 ~2 ~15 ~2 smooth_quartz
execute at @s run setblock ~ ~15 ~ glass
execute at @s run fill ~-1 ~16 ~-1 ~1 ~16 ~1 smooth_quartz
execute at @s run setblock ~ ~16 ~ glass
execute at @s run setblock ~ ~17 ~ lightning_rod

# 6. Triệu hồi Tâm Đèn Hải Đăng Xoay Vòng 360 độ (Rotating Light Beam Core)
execute at @s run kill @e[type=armor_stand,tag=lighthouse_core,distance=..15]
execute at @s run summon armor_stand ~ ~13 ~ {Tags:["lighthouse_core"],Invisible:1b,NoGravity:1b,Invulnerable:1b,Marker:1b}

# 7. Cấp bùa lợi Hải Đăng & dịch chuyển người chơi lên ban công ngắm cảnh
execute at @s run effect give @s minecraft:haste 99999 1 true
execute at @s run effect give @s minecraft:speed 99999 1 true
execute at @s run effect give @s minecraft:night_vision 99999 0 true
execute at @s run effect give @s minecraft:glowing 30 0 true
execute at @s run minecraft:teleport @s ~2.5 ~12 ~ 90 0

# 8. Bắn pháo hoa rực rỡ chào mừng khánh thành Hải Đăng
execute at @s run summon firework_rocket ~ ~18 ~ {LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:1b,has_trail:1b,colors:[3847130,16777215,16766720],fade_colors:[16755200,65535]}]}}}}

# 9. Thông báo tellraw
tellraw @s [{"text":"\n🏛️ [NGỌN THÁP HẢI ĐĂNG HOÀNG GIA] ","color":"gold","bold":true},{"text":"Đã dựng thành công Tháp Hải Đăng cao 16 tầng lộng lẫy!\n","color":"yellow"},{"text":"⚡ Cột sáng Beacon: ","color":"aqua","bold":true},{"text":"Đổi màu Xanh - Trắng - Vàng vút lên mây!\n","color":"white"},{"text":"🌟 Chùm tia xoay 360°: ","color":"gold","bold":true},{"text":"Quét sáng ngang biển đêm rực rỡ!\n","color":"yellow"},{"text":"🛡️ Bùa lợi nhận được: ","color":"green","bold":true},{"text":"Đào Nhanh II, Tốc Độ II, Mắt Sáng Ban Đêm & Hào Quang!\n","color":"light_purple"}]
