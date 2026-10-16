# ==================================================
# TRAO THƯỞNG GIẢI ĐẤU PVP CUỐI TUẦN
# Cách dùng: Đứng gần người thắng gõ /function skyblock:pvp_reward
# ==================================================

tellraw @a [{"text":"[PVP TOURNAMENT] ","color":"gold","bold":true},{"text":"Chúc mừng Đấu Sĩ Vô Địch Giải Đấu PvP Cuối Tuần!","color":"yellow"}]
title @a title {"text":"🏆 QUÁN QUÂN PVP 🏆","color":"gold","bold":true}
title @a subtitle {"text":"Đã nhận Cúp Vô Địch & Kho Báu Giải Đấu!","color":"yellow"}

# Pháo hoa chúc mừng
summon firework_rocket 70 115 0 {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_trail:1b,has_twinkle:1b,colors:[-16711681,-65281,-256]}]}}}}
summon firework_rocket 70 115 2 {LifeTime:25,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",has_trail:1b,has_twinkle:1b,colors:[-65536,-16776961]}]}}}}
summon firework_rocket 70 115 -2 {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",has_trail:1b,has_twinkle:1b,colors:[-16711936,-1]}]}}}}

# Trao Cúp Vàng & Phần thưởng vật phẩm cho người chơi gần nhất
give @p netherite_sword[custom_name='{"text":"🏆 Cúp Quán Quân PvP 🏆","color":"gold","bold":true}',enchantments={levels:{"minecraft:sharpness":5,"minecraft:unbreaking":3,"minecraft:looting":3,"minecraft:fire_aspect":2}}] 1
give @p diamond 16
give @p emerald 32
give @p enchanted_golden_apple 2

# Mở khóa danh hiệu [🩸 Đấu Sĩ Bất Bại]
tag @p add title_pvp
tellraw @p [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Chúc mừng bạn đã mở khóa danh hiệu: ","color":"yellow"},{"text":"[🩸 Đấu Sĩ Bất Bại]","color":"red","bold":true},{"text":"! (Gõ /danhhieu để đeo)","color":"green"}]
