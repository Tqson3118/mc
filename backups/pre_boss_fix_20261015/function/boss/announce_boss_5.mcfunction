title @a times 10 90 20
title @a title {"text":"💠 CỔ THẦN THÂM UYÊN ĐÃ BẠI TRẬN! 💠","color":"dark_aqua","bold":true}
title @a subtitle [{"text":"Chiến thần ","color":"gold"},{"selector":"@s","color":"aqua","bold":true},{"text":" đã chinh phục Thâm Uyên!","color":"yellow"}]

tellraw @a [{"text":"\n═══════════════════════════════════════════════\n","color":"dark_aqua","bold":true},{"text":"✦ CHIẾN TÍCH THẦN THOẠI - BOSS CẤP 5 BỊ TIÊU DIỆT! ✦\n","color":"gold","bold":true},{"selector":"@s","color":"aqua","bold":true},{"text":" đã hạ gục CỔ THẦN THÂM UYÊN (2500 HP), nhận 1x Trái Tim Thâm Uyên, +$35,000 Số Dư & +300 Linh Thạch!\n","color":"yellow"},{"text":"═══════════════════════════════════════════════\n","color":"dark_aqua","bold":true}]

give @s minecraft:recovery_compass[minecraft:custom_name='{"text":"💠 Trái Tim Thâm Uyên 💠","color":"dark_aqua","bold":true,"italic":false}',minecraft:lore=['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Lõi âm thanh cổ đại kết tinh từ Cổ Thần Thâm Uyên Warden.","color":"aqua","italic":true}','{"text":"⚡ Nguyên liệu ĐỘT PHÁ THẦN THOẠI cho TIER 16 - 18!","color":"dark_aqua","bold":true,"italic":false}','{"text":"✦ Rơi 100% khi hạ Boss 5: Cổ Thần Thâm Uyên (/boss5)","color":"yellow","italic":false}','{"text":"[Loại]: Báu Vật Thâm Uyên","color":"aqua","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],minecraft:enchantment_glint_override=true,minecraft:custom_data={ancient_mat:"warden_heart"}] 1
give @s ominous_trial_key[custom_data={crate_key:"mythic"},item_name='{"text":"Chìa Khóa Thần Thoại","color":"light_purple","bold":true}'] 1
scoreboard players add @s eco_add 35000
scoreboard players add @s gems_add 300
experience add @s 5000 points
tellraw @s [{"text":"[Quà Boss] ","color":"gold","bold":true},{"text":"Bạn đã nhận được: ","color":"yellow"},{"text":"1x Trái Tim Thâm Uyên, +$35,000 Số Dư, +300 Linh Thạch, 1x Chìa Khóa Thần Thoại & 5000 EXP!","color":"green","bold":true}]
execute as @a[distance=1..60] at @s run function skyblock:boss/party_reward_boss_5

playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2.0 1.1
