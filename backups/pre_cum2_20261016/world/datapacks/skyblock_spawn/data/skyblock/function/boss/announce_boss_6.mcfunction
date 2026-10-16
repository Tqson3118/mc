title @a times 10 100 20
title @a title {"text":"🌌 HOÀNG ĐẾ TINH TÚ ĐÃ QUY HÀNG! 🌌","color":"gold","bold":true}
title @a subtitle [{"text":"Chúa Tể Vĩnh Hằng ","color":"light_purple"},{"selector":"@s","color":"aqua","bold":true},{"text":" đã thống trị Thiên Cung!","color":"yellow"}]
tellraw @a [{"text":"\n═══════════════════════════════════════════════\n","color":"gold","bold":true},{"text":"✦ KỶ NGUYÊN SÁNG THẾ - SUPREME BOSS CẤP 6 BỊ HẠ GỤC! ✦\n","color":"light_purple","bold":true},{"selector":"@s","color":"aqua","bold":true},{"text":" đã đả bại HOÀNG ĐẾ TINH TÚ VĨNH HẰNG (5000 HP), nhận 1x Dị Điểm Vĩnh Hằng (Rèn Tier 19-20 MAX), 2 Chìa Khóa Thần Thoại & +$75,000 Số Dư!\n","color":"yellow"},{"text":"═══════════════════════════════════════════════\n","color":"gold","bold":true}]
give @s minecraft:heavy_core[minecraft:custom_name='{"text":"🌌 Dị Điểm Vĩnh Hằng 🌌","color":"light_purple","bold":true,"italic":false}',minecraft:lore=['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Hạt nhân nén chặt của cả một thiên hà đang bùng nổ.","color":"light_purple","italic":true}','{"text":"⚡ Nguyên liệu SÁNG THẾ TỐI CAO cho TIER 19 - 20 [MAX]!","color":"gold","bold":true,"italic":false}','{"text":"✦ Rơi 100% khi hạ Boss 6: Hoàng Đế Tinh Tú (/boss6)","color":"yellow","italic":false}','{"text":"[Loại]: Thánh Vật Sáng Thế","color":"light_purple","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],minecraft:enchantment_glint_override=true,minecraft:custom_data={ancient_mat:"eternity_singularity"}] 1
give @s ominous_trial_key[custom_data={crate_key:"mythic"},item_name='{"text":"Chìa Khóa Thần Thoại","color":"light_purple","bold":true}'] 2
scoreboard players add @s eco_add 75000
scoreboard players add @s gems_add 500
execute as @a[distance=1..60] at @s run function skyblock:boss/party_reward_boss_6
experience add @s 10000 points
tag @s add title_void
tag @s add title_tier15
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2.0 1.0
playsound minecraft:entity.ender_dragon.death master @a ~ ~ ~ 1.2 1.1
