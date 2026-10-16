# Thông báo vinh danh và trao quà hạ gục Boss 4: Chúa Tể Hư Không (World Boss)
title @a times 10 90 20
title @a title {"text":"🌌 CHÚA TỂ HƯ KHÔNG ĐÃ BỊ TIÊU DIỆT! 🌌","color":"dark_purple","bold":true}
title @a subtitle [{"text":"Thần thoại sống ","color":"gold"},{"selector":"@s","color":"aqua","bold":true},{"text":" đã chinh phục Vực Thẳm Hư Không!","color":"light_purple"}]

tellraw @a [{"text":"\n═══════════════════════════════════════════════\n","color":"dark_purple","bold":true},{"text":"✦ ĐỊA CHẤN MÁY CHỦ - WORLD BOSS ĐÃ BỊ HẠ GỤC! ✦\n","color":"gold","bold":true},{"text":"Đấng Cứu Thế Vũ Trụ ","color":"white"},{"selector":"@s","color":"aqua","bold":true},{"text":" đã đả bại thành công:\n","color":"white"},{"text":"🌀 CHÚA TỂ HƯ KHÔNG (WORLD BOSS - 1200 HP)! 🌀\n","color":"dark_purple","bold":true},{"text":"Phần thưởng: ","color":"gold"},{"text":"100% Lõi Hư Không, 2 Sao Nether & +$15,000 Số Dư!\n","color":"light_purple"},{"text":"═══════════════════════════════════════════════\n","color":"dark_purple","bold":true}]

# Trao quà trực tiếp vào túi đồ & Số Dư người chơi tiêu diệt
give @s minecraft:echo_shard[minecraft:custom_name='{"text":"🌀 Lõi Hư Không 🌀","color":"dark_purple","bold":true,"italic":false}',minecraft:lore=['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Chứa đựng trọng lực vô tận từ không gian hư vô.","color":"gray","italic":true}','{"text":"⚡ Nguyên liệu ĐỘT PHÁ bắt buộc cho mốc TIER 13!","color":"light_purple","bold":true,"italic":false}','{"text":"✦ Trao đổi tại Đại Sư Luyện Kim","color":"aqua","italic":false}','{"text":"[Loại]: Nguyên Liệu Tối Thượng","color":"dark_purple","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],minecraft:enchantment_glint_override=true,minecraft:custom_data={ancient_mat:"void_core"}] 1
give @s nether_star 2
give @s dragon_head 1
scoreboard players add @s eco_add 15000
scoreboard players add @s gems_add 150
experience add @s 3000 points
tellraw @s [{"text":"[Quà Boss] ","color":"gold","bold":true},{"text":"Bạn đã nhận được: ","color":"yellow"},{"text":"1x Lõi Hư Không, +$15,000 Số Dư, +150 Linh Thạch, 2x Sao Nether, 1x Đầu Rồng & 3000 EXP!","color":"green","bold":true}]
execute as @a[distance=1..60] at @s run function skyblock:boss/party_reward_boss_4

# Mở khóa danh hiệu [🌌 Chúa Tể Hư Không]
tag @s add title_void
tag @s add title_tier15
tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Chiến tích bất hủ! Bạn đã mở khóa danh hiệu thần thoại: ","color":"yellow"},{"text":"[🌌 Chúa Tể Hư Không]","color":"dark_purple","bold":true},{"text":"! (Gõ /danhhieu để đeo)","color":"green"}]

playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2.0 1.0
playsound minecraft:entity.ender_dragon.death master @a ~ ~ ~ 1.0 1.0
summon firework_rocket -35 115 115 {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[11141290,16755200],fade_colors:[16711935]}]}}}}
summon firework_rocket -35 117 115 {LifeTime:25,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",colors:[16711935,16776960],fade_colors:[11141290]}]}}}}
