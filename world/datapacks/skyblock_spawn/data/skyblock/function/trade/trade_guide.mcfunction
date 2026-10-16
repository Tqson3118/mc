# ==============================================================================
# HƯỚNG DẪN TRADE FANTASY — Hiển thị danh sách công thức đổi đồ
# Sử dụng: /function skyblock:trade/trade_guide
# ==============================================================================

tellraw @s {"text":""}
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}
tellraw @s [{"text":"  ","extra":[{"text":"🏰 KHU FANTASY — HƯỚNG DẪN ĐỔI ĐỒ ","color":"gold","bold":true},{"text":"🏰","color":"gold","bold":true}]}]
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}
tellraw @s [{"text":"  ","extra":[{"text":"📍 Vị trí: ","color":"yellow"},{"text":"Cánh Tây-Bắc (X=-45, /warp trade)","color":"white"}]}]
tellraw @s [{"text":"  ","extra":[{"text":"💡 Nhấp chuột phải vào NPC để mở menu đổi đồ.","color":"gray","italic":true}]}]

tellraw @s {"text":""}
tellraw @s [{"text":"  ","extra":[{"text":"🔨 LÒ RÈN HUYỀN BÍ ","color":"gold","bold":true},{"text":"(Armorer, Z=-10)","color":"gray"}]}]
tellraw @s [{"text":"  ","extra":[{"text":"  ✦ ","color":"dark_gray"},{"text":"5 Mảnh Quặng Cổ Đại ","color":"aqua"},{"text":"→ ","color":"dark_gray"},{"text":"📖 Sách Mending I","color":"yellow"}]}]
tellraw @s [{"text":"  ","extra":[{"text":"  ✦ ","color":"dark_gray"},{"text":"10 Tinh Thể Cổ Đại ","color":"light_purple"},{"text":"→ ","color":"dark_gray"},{"text":"🛡 Gương Rồng (Shield Huyền Thoại)","color":"red"}]}]
tellraw @s [{"text":"  ","extra":[{"text":"  ✦ ","color":"dark_gray"},{"text":"3 Shard + 2 Nether Star ","color":"aqua"},{"text":"→ ","color":"dark_gray"},{"text":"💧 Nước Mắc Lực (Strength II Splash)","color":"dark_purple"}]}]

tellraw @s {"text":""}
tellraw @s [{"text":"  ","extra":[{"text":"✨ PHÁP SƯ LIỆU THƯƠNG ","color":"light_purple","bold":true},{"text":"(Cleric, Z=-4)","color":"gray"}]}]
tellraw @s [{"text":"  ","extra":[{"text":"  ✦ ","color":"dark_gray"},{"text":"8 Mảnh Quặng Cổ Đại ","color":"aqua"},{"text":"→ ","color":"dark_gray"},{"text":"🩸 Linh Dược Tái Sinh (Regen II, 90s)","color":"green"}]}]
tellraw @s [{"text":"  ","extra":[{"text":"  ✦ ","color":"dark_gray"},{"text":"5 Tinh Thể Cổ Đại ","color":"light_purple"},{"text":"→ ","color":"dark_gray"},{"text":"⚡ Linh Dược Dũng Mãnh (Strength II, 3min)","color":"red"}]}]
tellraw @s [{"text":"  ","extra":[{"text":"  ✦ ","color":"dark_gray"},{"text":"2 Crystal + 1 Trái Tim Của Quỷ ","color":"dark_red"},{"text":"→ ","color":"dark_gray"},{"text":"🌟 Huyền Thoại Potion (Speed II + Regen I)","color":"yellow"}]}]

tellraw @s {"text":""}
tellraw @s [{"text":"  ","extra":[{"text":"📚 THĂNG ĐỘC PHẨM ","color":"aqua","bold":true},{"text":"(Librarian, Z=-16)","color":"gray"}]}]
tellraw @s [{"text":"  ","extra":[{"text":"  ✦ ","color":"dark_gray"},{"text":"20 Mảnh Quặng Cổ Đại ","color":"aqua"},{"text":"→ ","color":"dark_gray"},{"text":"📖 Sách Looting III","color":"gold"}]}]
tellraw @s [{"text":"  ","extra":[{"text":"  ✦ ","color":"dark_gray"},{"text":"15 Tinh Thể Cổ Đại ","color":"light_purple"},{"text":"→ ","color":"dark_gray"},{"text":"📖 Sách Sharpness V","color":"red"}]}]
tellraw @s [{"text":"  ","extra":[{"text":"  ✦ ","color":"dark_gray"},{"text":"10 Crystal + 5 Shard ","color":"gold"},{"text":"→ ","color":"dark_gray"},{"text":"📖 Sách Fortune III","color":"yellow"}]}]

tellraw @s {"text":""}
tellraw @s [{"text":"  ","extra":[{"text":"⚔ CƯỜNG HÓA VŨ KHÍ ","color":"yellow","bold":true},{"text":"(Toolsmith, Z=-22)","color":"gray"}]}]
tellraw @s [{"text":"  ","extra":[{"text":"  ✦ ","color":"dark_gray"},{"text":"Kiếm Netherite + 3 Crystal ","color":"light_purple"},{"text":"→ ","color":"dark_gray"},{"text":"🔥 Thêm Fire Aspect I","color":"red"}]}]
tellraw @s [{"text":"  ","extra":[{"text":"  ✦ ","color":"dark_gray"},{"text":"5 Crystal + Netherite Ingot ","color":"gold"},{"text":"→ ","color":"dark_gray"},{"text":"⚡ Huyền Thoại Kiếm Fantasy (Sharp VII + Looting II)","color":"dark_purple"}]}]

tellraw @s {"text":""}
tellraw @s [{"text":"  ","extra":[{"text":"📌 GHI CHÚ: ","color":"yellow","bold":true},{"text":"Mảnh Quặng Cổ Đại = prismarine_shard từ Boss/Đại Sư Luyện Kim","color":"white"}]}]
tellraw @s [{"text":"  ","extra":[{"text":"          ","extra":[{"text":"Tinh Thể Cổ Đại = amethyst_shard từ Boss Cấp 2/Đại Sư Luyện Kim","color":"white"}]}]}]
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}

playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.5 1.2
