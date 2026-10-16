# Lĩnh lương khi đi qua ô Bắt Đầu
scoreboard players remove @s ct_pos 40
execute at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.5
tellraw @s [{"text":"🏁 [BẮT ĐẦU] ","color":"green","bold":true},{"text":"Bạn đã đi qua vạch Bắt Đầu! Nhận lương ","color":"yellow"},{"text":"+$200,000 xu & 1 Vé Vàng Hoàng Gia","color":"gold","bold":true},{"text":"!","color":"green"}]
scoreboard players add @s eco_add 200000
give @s gold_nugget[custom_data={ancient_mat:"royal_ticket"},item_name='{"text":"🎫 Vé Vàng Hoàng Gia 🎫","color":"gold","bold":true}',lore=['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}','{"text":"Tấm vé danh dự nạm vàng trao thưởng cho người chiến thắng Casino.","color":"yellow","italic":true}','{"text":"⚡ Dùng để đổi Danh Hiệu VIP & Phôi Trang Phục Đặc Quyền","color":"gold"}','{"text":"[Nguồn]: Cung Điện Casino world_casino (/xoso, /cf, /cotyphu)","color":"light_purple","bold":true}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}']] 1
