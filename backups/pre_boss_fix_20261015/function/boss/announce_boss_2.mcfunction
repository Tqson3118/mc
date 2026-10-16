# Thông báo vinh danh và trao quà hạ gục Boss 2: Đao Phủ Địa Ngục
title @a times 10 70 20
title @a title {"text":"☠ BOSS 2 ĐÃ BỊ HẠ GỤC! ☠","color":"red","bold":true}
title @a subtitle [{"text":"Dũng sĩ ","color":"yellow"},{"selector":"@s","color":"aqua","bold":true},{"text":" đã trảm sát Đao Phủ Địa Ngục!","color":"red"}]

tellraw @a [{"text":"\n═══════════════════════════════════════════════\n","color":"gold","bold":true},{"text":"✦ CHIẾN CÔNG HIỂN HÁCH - TRẢM BOSS THÀNH CÔNG! ✦\n","color":"yellow","bold":true},{"text":"Dũng sĩ ","color":"white"},{"selector":"@s","color":"aqua","bold":true},{"text":" đã xuất sắc tiêu diệt thành công:\n","color":"white"},{"text":"🔥 ĐAO PHỦ ĐỊA NGỤC (BOSS CẤP 2 - 300 HP)! 🔥\n","color":"red","bold":true},{"text":"Phần thưởng: ","color":"yellow"},{"text":"Nhận Tinh Thể Cổ Đại, Rìu Lửa Thần Thoại & +$1,000 Số Dư!\n","color":"gold"},{"text":"═══════════════════════════════════════════════\n","color":"gold","bold":true}]

# Trao quà trực tiếp vào túi đồ & Số Dư người chơi tiêu diệt
give @s minecraft:amethyst_shard[minecraft:custom_name='{"text":"❂ Tinh Thể Cổ Đại ❂","color":"light_purple","bold":true,"italic":false}',minecraft:lore=['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Tinh thể phát sáng với ma năng nguyên thủy.","color":"gray","italic":true}','{"text":"✦ Dùng để rèn trang bị Cổ Đại Bậc 6 - 9","color":"light_purple","italic":false}','{"text":"[Loại]: Nguyên Liệu Thần Thoại","color":"gold","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],minecraft:enchantment_glint_override=true,minecraft:custom_data={ancient_mat:"crystal"}] 2
give @s netherite_axe[custom_data={ancient_axe:1b},enchantments={levels:{"minecraft:sharpness":4,"minecraft:fire_aspect":2,"minecraft:unbreaking":3}},item_name='{"text":"🔥 Rìu Lửa Đao Phủ Địa Ngục 🔥","color":"red","bold":true}',lore=['{"text":"Chiến lợi phẩm từ Đao Phủ Địa Ngục.","color":"gray"}']] 1
scoreboard players add @s eco_add 1000
scoreboard players add @s gems_add 35
experience add @s 600 points
tellraw @s [{"text":"[Quà Boss] ","color":"gold","bold":true},{"text":"Bạn đã nhận được: ","color":"yellow"},{"text":"2x Tinh Thể Cổ Đại, +$1,000 Số Dư, +35 Linh Thạch, 1x Rìu Netherite Lửa & 600 EXP!","color":"green","bold":true}]
execute as @a[distance=1..60] at @s run function skyblock:boss/party_reward_boss_2

playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2.0 1.0
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.5 1.2
summon firework_rocket 29 113 85 {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",colors:[16711680,16755200],fade_colors:[16777215]}]}}}}
summon firework_rocket 29 115 85 {LifeTime:25,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[16776960,16711680],fade_colors:[16755200]}]}}}}
