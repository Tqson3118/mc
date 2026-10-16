# Thông báo vinh danh và trao quà hạ gục Boss 1: Nữ Hoàng Nhện Độc
title @a times 10 70 20
title @a title {"text":"☠ BOSS 1 ĐÃ BỊ HẠ GỤC! ☠","color":"green","bold":true}
title @a subtitle [{"text":"Dũng sĩ ","color":"yellow"},{"selector":"@s","color":"aqua","bold":true},{"text":" đã tiêu diệt Nữ Hoàng Nhện!","color":"green"}]

tellraw @a [{"text":"\n═══════════════════════════════════════════════\n","color":"gold","bold":true},{"text":"✦ CHIẾN CÔNG HIỂN HÁCH - TRẢM BOSS THÀNH CÔNG! ✦\n","color":"yellow","bold":true},{"text":"Dũng sĩ ","color":"white"},{"selector":"@s","color":"aqua","bold":true},{"text":" đã xuất sắc tiêu diệt thành công:\n","color":"white"},{"text":"🕷 NỮ HOÀNG NHỆN ĐỘC (BOSS CẤP 1 - 150 HP)! 🕷\n","color":"green","bold":true},{"text":"Phần thưởng: ","color":"yellow"},{"text":"Nhận 100% Mảnh Quặng Cổ Đại & +$500 Số Dư!\n","color":"aqua"},{"text":"═══════════════════════════════════════════════\n","color":"gold","bold":true}]

# Trao quà trực tiếp vào túi đồ & Số Dư người chơi tiêu diệt
give @s minecraft:prismarine_shard[minecraft:custom_name='{"text":"✦ Mảnh Quặng Cổ Đại ✦","color":"aqua","bold":true,"italic":false}',minecraft:lore=['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Nguyên liệu ngưng tụ từ kỷ nguyên sơ khai.","color":"gray","italic":true}','{"text":"✦ Dùng để luyện kim và rèn trang bị Bậc 1 - 5","color":"dark_aqua","italic":false}','{"text":"[Loại]: Nguyên Liệu Cổ Đại","color":"yellow","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],minecraft:enchantment_glint_override=true,minecraft:custom_data={ancient_mat:"shard"}] 2
scoreboard players add @s eco_add 500
scoreboard players add @s gems_add 25
experience add @s 300 points
tellraw @s [{"text":"[Quà Boss] ","color":"gold","bold":true},{"text":"Bạn đã nhận được: ","color":"yellow"},{"text":"2x Mảnh Quặng Cổ Đại, +$500 Số Dư, +25 Linh Thạch & 300 EXP!","color":"green","bold":true}]
execute as @a[distance=1..60] at @s run function skyblock:boss/party_reward_boss_1

playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2.0 1.0
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.5 1.2
summon firework_rocket -29 113 85 {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",colors:[65280,16755200],fade_colors:[16777215]}]}}}}
summon firework_rocket -29 115 85 {LifeTime:25,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[65535,65280],fade_colors:[16755200]}]}}}}
