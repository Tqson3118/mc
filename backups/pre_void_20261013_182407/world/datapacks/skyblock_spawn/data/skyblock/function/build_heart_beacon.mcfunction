# ===============================================================
# SKYBLOCK - TRÁI TIM HẢI ĐĂNG PHÁT SÁNG (HEART WITH BEACON BEAM)
# ===============================================================

# 1. Âm thanh kích hoạt
execute at @s run playsound minecraft:block.beacon.activate master @a ~ ~ ~ 2.5 1.0
execute at @s run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 1.5 1.5
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.3

# 2. Xóa sạch cột không khí phía trên tâm trái tim để tia sáng không bị cản
execute at @s rotated ~ 0 run fill ^0 ^1 ^6 ^0 ^319 ^6 air replace

# 3. Xây bệ Kim Cương 4 tầng ngay dưới chân trái tim (tâm tại ^0 ^0 ^6)
execute at @s rotated ~ 0 run fill ^-4 ^-4 ^2 ^4 ^-4 ^10 diamond_block
execute at @s rotated ~ 0 run fill ^-3 ^-3 ^3 ^3 ^-3 ^9 diamond_block
execute at @s rotated ~ 0 run fill ^-2 ^-2 ^4 ^2 ^-2 ^8 diamond_block
execute at @s rotated ~ 0 run fill ^-1 ^-1 ^5 ^1 ^-1 ^7 diamond_block
execute at @s rotated ~ 0 run setblock ^0 ^0 ^6 beacon
execute at @s rotated ~ 0 run data merge block ^0 ^0 ^6 {primary_effect:"minecraft:haste",secondary_effect:"minecraft:regeneration"}

# 4. Xây dựng Bức Tượng Trái Tim với Lõi Kính Màu cho tia sáng xuyên qua
execute at @s rotated ~ 0 run setblock ^0 ^1 ^6 light_blue_stained_glass
execute at @s rotated ~ 0 run setblock ^-1 ^2 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^0 ^2 ^6 white_stained_glass
execute at @s rotated ~ 0 run setblock ^1 ^2 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-2 ^3 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-1 ^3 ^6 white_concrete
execute at @s rotated ~ 0 run setblock ^0 ^3 ^6 yellow_stained_glass
execute at @s rotated ~ 0 run setblock ^1 ^3 ^6 white_concrete
execute at @s rotated ~ 0 run setblock ^2 ^3 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-3 ^4 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-2 ^4 ^6 white_concrete
execute at @s rotated ~ 0 run setblock ^-1 ^4 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^0 ^4 ^6 yellow_stained_glass
execute at @s rotated ~ 0 run setblock ^1 ^4 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^2 ^4 ^6 white_concrete
execute at @s rotated ~ 0 run setblock ^3 ^4 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-4 ^5 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-3 ^5 ^6 white_concrete
execute at @s rotated ~ 0 run fill ^-2 ^5 ^6 ^-1 ^5 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^0 ^5 ^6 yellow_stained_glass
execute at @s rotated ~ 0 run fill ^1 ^5 ^6 ^2 ^5 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^3 ^5 ^6 white_concrete
execute at @s rotated ~ 0 run setblock ^4 ^5 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-5 ^6 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-4 ^6 ^6 white_concrete
execute at @s rotated ~ 0 run fill ^-3 ^6 ^6 ^-1 ^6 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^0 ^6 ^6 yellow_stained_glass
execute at @s rotated ~ 0 run fill ^1 ^6 ^6 ^3 ^6 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^4 ^6 ^6 white_concrete
execute at @s rotated ~ 0 run setblock ^5 ^6 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-6 ^7 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-5 ^7 ^6 white_concrete
execute at @s rotated ~ 0 run fill ^-4 ^7 ^6 ^-2 ^7 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^-1 ^7 ^6 gold_block
execute at @s rotated ~ 0 run setblock ^0 ^7 ^6 yellow_stained_glass
execute at @s rotated ~ 0 run setblock ^1 ^7 ^6 gold_block
execute at @s rotated ~ 0 run fill ^2 ^7 ^6 ^4 ^7 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^5 ^7 ^6 white_concrete
execute at @s rotated ~ 0 run setblock ^6 ^7 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-7 ^8 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-6 ^8 ^6 white_concrete
execute at @s rotated ~ 0 run fill ^-5 ^8 ^6 ^-2 ^8 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^-1 ^8 ^6 gold_block
execute at @s rotated ~ 0 run setblock ^0 ^8 ^6 yellow_stained_glass
execute at @s rotated ~ 0 run setblock ^1 ^8 ^6 gold_block
execute at @s rotated ~ 0 run fill ^2 ^8 ^6 ^5 ^8 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^6 ^8 ^6 white_concrete
execute at @s rotated ~ 0 run setblock ^7 ^8 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-7 ^9 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-6 ^9 ^6 white_concrete
execute at @s rotated ~ 0 run fill ^-5 ^9 ^6 ^-2 ^9 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^-1 ^9 ^6 gold_block
execute at @s rotated ~ 0 run setblock ^0 ^9 ^6 white_stained_glass
execute at @s rotated ~ 0 run setblock ^1 ^9 ^6 gold_block
execute at @s rotated ~ 0 run fill ^2 ^9 ^6 ^5 ^9 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^6 ^9 ^6 white_concrete
execute at @s rotated ~ 0 run setblock ^7 ^9 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-7 ^10 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-6 ^10 ^6 white_concrete
execute at @s rotated ~ 0 run fill ^-5 ^10 ^6 ^-2 ^10 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^-1 ^10 ^6 white_concrete
execute at @s rotated ~ 0 run setblock ^0 ^10 ^6 light_blue_stained_glass
execute at @s rotated ~ 0 run setblock ^1 ^10 ^6 white_concrete
execute at @s rotated ~ 0 run fill ^2 ^10 ^6 ^5 ^10 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^6 ^10 ^6 white_concrete
execute at @s rotated ~ 0 run setblock ^7 ^10 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-6 ^11 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-5 ^11 ^6 sea_lantern
execute at @s rotated ~ 0 run fill ^-4 ^11 ^6 ^-3 ^11 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^-2 ^11 ^6 sea_lantern
execute at @s rotated ~ 0 run setblock ^-1 ^11 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^1 ^11 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^2 ^11 ^6 sea_lantern
execute at @s rotated ~ 0 run fill ^3 ^11 ^6 ^4 ^11 ^6 yellow_concrete
execute at @s rotated ~ 0 run setblock ^5 ^11 ^6 sea_lantern
execute at @s rotated ~ 0 run setblock ^6 ^11 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^-5 ^12 ^6 light_blue_concrete
execute at @s rotated ~ 0 run fill ^-4 ^12 ^6 ^-3 ^12 ^6 white_concrete
execute at @s rotated ~ 0 run setblock ^-2 ^12 ^6 light_blue_concrete
execute at @s rotated ~ 0 run setblock ^2 ^12 ^6 light_blue_concrete
execute at @s rotated ~ 0 run fill ^3 ^12 ^6 ^4 ^12 ^6 white_concrete
execute at @s rotated ~ 0 run setblock ^5 ^12 ^6 light_blue_concrete
execute at @s rotated ~ 0 run fill ^-4 ^13 ^6 ^-3 ^13 ^6 light_blue_concrete
execute at @s rotated ~ 0 run fill ^3 ^13 ^6 ^4 ^13 ^6 light_blue_concrete

# 5. Triệu hồi Hạt ánh sáng & Pháo hoa
execute at @s rotated ~ 0 run particle minecraft:heart ^0 ^7 ^6 3 3 1 0.1 80
execute at @s rotated ~ 0 run particle minecraft:end_rod ^0 ^7 ^6 1 4 1 0.05 40
execute at @s rotated ~ 0 run particle minecraft:firework ^0 ^7 ^6 2 2 1 0.05 50
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^14 ^6 {LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",has_twinkle:1b,colors:[3847130,16777215,16766720]}]}}}}

# 6. Cấp bùa lợi ánh sáng
execute at @s run effect give @s minecraft:haste 99999 1 true
execute at @s run effect give @s minecraft:speed 99999 1 true
execute at @s run effect give @s minecraft:night_vision 99999 0 true
execute at @s run effect give @s minecraft:glowing 30 0 true

# 7. Thông báo tellraw
tellraw @s [{"text": "\n💖 [TRÁI TIM HẢI ĐĂNG HOÀNG GIA] ", "color": "light_purple", "bold": true}, {"text": "Đã xây dựng ", "color": "yellow"}, {"text": "TRÁI TIM PHÁT SÁNG BEACON", "color": "gold", "bold": true}, {"text": " (Xanh Lam - Trắng - Vàng) với cột sáng Hải Đăng xuyên thẳng tâm tim vút lên trời xanh!\n", "color": "aqua"}]
