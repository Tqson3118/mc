# Thông báo vinh danh và trao quà hạ gục Boss 3: Chúa Tể Bóng Tối (Boss Tuần)
title @a times 10 90 20
title @a title {"text":"☠ CHÚA TỂ BÓNG TỐI ĐÃ BỊ TIÊU DIỆT! ☠","color":"dark_red","bold":true}
title @a subtitle [{"text":"Huyền thoại ","color":"gold"},{"selector":"@s","color":"aqua","bold":true},{"text":" đã giải cứu vùng đất!","color":"yellow"}]

tellraw @a [{"text":"\n═══════════════════════════════════════════════\n","color":"dark_red","bold":true},{"text":"✦ ĐẠI THẮNG BOSS TUẦN - VANG DANH THIÊN HẠ! ✦\n","color":"gold","bold":true},{"text":"Chiến binh vĩ đại ","color":"white"},{"selector":"@s","color":"aqua","bold":true},{"text":" đã anh dũng hạ sát thành công:\n","color":"white"},{"text":"🏰 CHÚA TỂ BÓNG TỐI (BOSS TUẦN - 600 HP)! 🏰\n","color":"dark_red","bold":true},{"text":"Phần thưởng: ","color":"gold"},{"text":"100% Trái Tim Của Quỷ, Kiếm Thần Thoại & +$5,000 Số Dư!\n","color":"yellow"},{"text":"═══════════════════════════════════════════════\n","color":"dark_red","bold":true}]

# Trao quà trực tiếp vào túi đồ & Số Dư người chơi tiêu diệt
give @s minecraft:fermented_spider_eye[minecraft:custom_name='{"text":"☠ Trái Tim Của Quỷ ☠","color":"dark_red","bold":true,"italic":false}',minecraft:lore=['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Trái tim đen tối vẫn còn đập của Chúa Tể Bóng Tối.","color":"dark_purple","italic":true}','{"text":"⚡ Nguyên liệu ĐỘT PHÁ bắt buộc cho mốc TIER 10!","color":"red","bold":true,"italic":false}','{"text":"✦ Rơi 100% khi hạ gục Chúa Tể Bóng Tối (/warp boss)","color":"gold","italic":false}','{"text":"[Loại]: Nguyên Liệu Đột Phá Hắc Ám","color":"dark_red","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],minecraft:enchantment_glint_override=true,minecraft:custom_data={ancient_mat:"demon_heart"}] 1
give @s netherite_sword[custom_data={ancient_lifesteal:1b,boss_weapon:1b},enchantments={levels:{"minecraft:sharpness":5,"minecraft:fire_aspect":2,"minecraft:unbreaking":3,"minecraft:looting":3}},item_name='{"text":"☠ Kiếm Diệt Quỷ Chúa Tể ☠","color":"dark_red","bold":true}',lore=['{"text":"Thanh kiếm đoạt mệnh từ Chúa Tể Bóng Tối.","color":"gray"}']] 1
give @s totem_of_undying 1
scoreboard players add @s eco_add 5000
experience add @s 1500 points
tellraw @s [{"text":"[Quà Boss] ","color":"gold","bold":true},{"text":"Bạn đã nhận được: ","color":"yellow"},{"text":"1x Trái Tim Của Quỷ, +$5,000 Số Dư, 1x Kiếm Boss Thần Thánh, 1x Totem Bất Tử & 1500 EXP!","color":"green","bold":true}]

# Mở khóa danh hiệu [☠ Sát Thủ Boss]
tag @s add title_boss
tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Chiến tích hiển hách! Bạn đã mở khóa danh hiệu độc quyền: ","color":"yellow"},{"text":"[☠ Sát Thủ Boss]","color":"dark_red","bold":true},{"text":"! (Gõ /danhhieu để đeo)","color":"green"}]

playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2.0 1.0
playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 1.0 1.0
summon firework_rocket 0 115 115 {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[11141120,16755200],fade_colors:[16711680]}]}}}}
summon firework_rocket 0 117 115 {LifeTime:25,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",colors:[16711680,16776960],fade_colors:[11141120]}]}}}}
