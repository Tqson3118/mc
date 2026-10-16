# -*- coding: utf-8 -*-
"""
Script to give player 'sondzvc' the ultimate VIP arsenal:
- Full Set Sáng Thế Vũ Trụ Tier 15 (Helmet, Chestplate, Leggings, Boots, Sword, Pickaxe, Axe, Bow)
- Slime Stick Knockback 10
- Fishing Rod Lucky 5
- Totems of Undying
- Stacks of all 5 Ancient Evolution Materials
- 50,000,000 Coins via Vault Economy
- Title: [🔱 TÀI PHIỆT]
"""

import sys
sys.stdout.reconfigure(encoding='utf-8')
from run_rcon import rcon_cmd

PLAYER = "sondzvc"

commands = [
    # 1. Vũ khí & Dụng cụ Tier 15 Sáng Thế
    # Cúp Sáng Thế Tier 15 (Đào Nổ 3x3)
    f'give {PLAYER} minecraft:netherite_pickaxe[minecraft:custom_name=\'{{"text":"🔮 Cúp Cổ Đại Sáng Thế Vũ Trụ [Tier 15] 🔮","color":"gold","bold":true,"italic":false}}\',minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\',\'{{"text":"Bảo vật khai mỏ cổ đại ngưng tụ linh khí ngàn năm.","color":"gray","italic":true}}\',\'["",{{\"text\":\"Độ Bền: \",\"color\":\"gray\",\"italic\":false}},{{\"text\":\"[▰▰▰▰▰▰▰▰▰▰] \",\"color\":\"gold\",\"bold\":true,\"italic\":false}},{{\"text\":\"100% (VĨNH CỬU)\",\"color\":\"yellow\",\"bold\":true,\"italic\":false}}]\',\'{{"text":"✦ Hiệu Suất: Cấp 15 • Gia Tài: Cấp 10","color":"aqua","italic":false}}\',\'{{"text":"⚡ KỸ NĂNG: ĐÀO NỔ 3x3 TỨC THÌ QUANH VỊ TRÍ ĐÀO!","color":"red","bold":true,"italic":false}}\',\'{{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BẢO VẬT TỐI CAO ĐỈNH CAO BẤT HOẠI!","color":"yellow","bold":true,"italic":false}}\',\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\'],minecraft:enchantments={{levels:{{"minecraft:efficiency":15,"minecraft:fortune":10}}}},minecraft:unbreakable={{show_in_tooltip:false}},minecraft:custom_data={{ancient_pickaxe:1b,tier:15,explosive_mining:1b}}] 1',

    # Kiếm Sáng Thế Tier 15 (Hút Máu & Bão Sấm Sét)
    f'give {PLAYER} minecraft:netherite_sword[minecraft:custom_name=\'{{"text":"☠ Kiếm Cổ Đại Sáng Thế Vũ Trụ [Tier 15] ☠","color":"gold","bold":true,"italic":false}}\',minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\',\'{{"text":"Lưỡi kiếm cổ xưa rèn bằng ngọn lửa Hư Không.","color":"gray","italic":true}}\',\'["",{{\"text\":\"Độ Bền: \",\"color\":\"gray\",\"italic\":false}},{{\"text\":\"[▰▰▰▰▰▰▰▰▰▰] \",\"color\":\"gold\",\"bold\":true,\"italic\":false}},{{\"text\":\"100% (VĨNH CỬU)\",\"color\":\"yellow\",\"bold\":true,\"italic\":false}}]\',\'{{"text":"✦ Sắc Bén: Cấp 16 • Quét Kiếm: Cấp 10","color":"red","italic":false}}\',\'{{"text":"✦ Lửa Địa Ngục: Cấp 7 • Nhặt Đồ: Cấp 8","color":"gold","italic":false}}\',\'{{"text":"⚡ KỸ NĂNG: HÚT MÁU (HỒI 2 TIM TỨC THÌ KHI CHÉM TRÚNG)!","color":"green","bold":true,"italic":false}}\',\'{{"text":"⚡ KỸ NĂNG: LÔI PHẠT (TRIỆU HỒI SẤM SÉT VÀO MỤC TIÊU)!","color":"aqua","bold":true,"italic":false}}\',\'{{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BÃO SẤM SÉT & TẬN DIỆT KẺ THÙ!","color":"yellow","bold":true,"italic":false}}\',\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\'],minecraft:enchantments={{levels:{{"minecraft:sharpness":16,"minecraft:fire_aspect":7,"minecraft:sweeping_edge":10,"minecraft:looting":8}}}},minecraft:unbreakable={{show_in_tooltip:false}},minecraft:custom_data={{ancient_sword:1b,tier:15,ancient_lifesteal:1b,ancient_lightning:1b}}] 1',

    # Rìu Sáng Thế Tier 15 (Treecapitator)
    f'give {PLAYER} minecraft:netherite_axe[minecraft:custom_name=\'{{"text":"⚡ Rìu Cổ Đại Sáng Thế Vũ Trụ [Tier 15] ⚡","color":"gold","bold":true,"italic":false}}\',minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\',\'{{"text":"Rìu chiến thần lực chẻ đôi mọi khối gỗ cổ thụ.","color":"gray","italic":true}}\',\'["",{{\"text\":\"Độ Bền: \",\"color\":\"gray\",\"italic\":false}},{{\"text\":\"[▰▰▰▰▰▰▰▰▰▰] \",\"color\":\"gold\",\"bold\":true,\"italic\":false}},{{\"text\":\"100% (VĨNH CỬU)\",\"color\":\"yellow\",\"bold\":true,\"italic\":false}}]\',\'{{"text":"✦ Hiệu Suất: Cấp 15 • Sắc Bén: Cấp 15","color":"aqua","italic":false}}\',\'{{"text":"⚡ KỸ NĂNG: TREECAPITATOR (CHẶT 1 BLOCK ĐỔ CẢ CÂY CỔ THỤ)!","color":"green","bold":true,"italic":false}}\',\'{{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BẠO LỰC CỰC HẠN & TIỄU TRỪ RỪNG RẬM!","color":"yellow","bold":true,"italic":false}}\',\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\'],minecraft:enchantments={{levels:{{"minecraft:efficiency":15,"minecraft:sharpness":15}}}},minecraft:unbreakable={{show_in_tooltip:false}},minecraft:custom_data={{ancient_axe:1b,tier:15}}] 1',

    # Cung Sáng Thế Tier 15 (Tên Nổ Sấm Sét)
    f'give {PLAYER} minecraft:bow[minecraft:custom_name=\'{{"text":"🏹 Cung Cổ Đại Sáng Thế Vũ Trụ [Tier 15] 🏹","color":"gold","bold":true,"italic":false}}\',minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\',\'{{"text":"Thần tiễn cổ xưa bắn ra những mũi tên xuyên không.","color":"gray","italic":true}}\',\'["",{{\"text\":\"Độ Bền: \",\"color\":\"gray\",\"italic\":false}},{{\"text\":\"[▰▰▰▰▰▰▰▰▰▰] \",\"color\":\"gold\",\"bold\":true,\"italic\":false}},{{\"text\":\"100% (VĨNH CỬU)\",\"color\":\"yellow\",\"bold\":true,\"italic\":false}}]\',\'{{"text":"✦ Sức Mạnh: Cấp 15 • Đấm Lùi: Cấp 5 • Hỏa Tiễn: Cấp 4","color":"gold","italic":false}}\',\'{{"text":"✦ Vô Hạn: Cấp I (Chỉ cần 1 mũi tên duy nhất trong túi)","color":"aqua","italic":false}}\',\'{{"text":"⚡ KỸ NĂNG: TÊN NỔ SẤM SÉT XÉ TOẠC KẺ THÙ TỪ XA!","color":"red","bold":true,"italic":false}}\',\'{{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BẮN ĐÂU TRÚNG ĐẤY, SÁT THƯƠNG DIỆT THẾ!","color":"yellow","bold":true,"italic":false}}\',\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\'],minecraft:enchantments={{levels:{{"minecraft:power":15,"minecraft:punch":5,"minecraft:flame":4,"minecraft:infinity":1}}}},minecraft:unbreakable={{show_in_tooltip:false}},minecraft:custom_data={{ancient_bow:1b,tier:15}}] 1',

    # 1 Mũi tên dùng cho Cung vô hạn
    f'give {PLAYER} minecraft:arrow 1',

    # 2. FULL BỘ GIÁP SÁNG THẾ VŨ TRỤ TIER 15 (Mũ, Áo, Quần, Giày)
    # Mũ Sáng Thế Tier 15
    f'give {PLAYER} minecraft:netherite_helmet[minecraft:custom_name=\'{{"text":"❂ Mũ Cổ Đại Sáng Thế Vũ Trụ [Tier 15] ❂","color":"gold","bold":true,"italic":false}}\',minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\',\'{{"text":"Chiến giáp mũ thần thoại tôi luyện từ thời thượng cổ.","color":"gray","italic":true}}\',\'["",{{\"text\":\"Độ Bền: \",\"color\":\"gray\",\"italic\":false}},{{\"text\":\"[▰▰▰▰▰▰▰▰▰▰] \",\"color\":\"gold\",\"bold\":true,\"italic\":false}},{{\"text\":\"100% (VĨNH CỬU)\",\"color\":\"yellow\",\"bold\":true,\"italic\":false}}]\',\'{{"text":"✦ Bảo Vệ: Cấp 14 • Gai Góc: Cấp 7","color":"aqua","italic":false}}\',\'{{"text":"✦ BUFF: GIA TĂNG SINH MỆNH & GIẢM SÁT THƯƠNG MA THUẬT!","color":"yellow","bold":true,"italic":false}}\',\'{{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BẤT TỬ CHI THÂN, TỐC ĐỘ III & PHI HÀNH (FLY)!","color":"gold","bold":true,"italic":false}}\',\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\'],minecraft:enchantments={{levels:{{"minecraft:protection":14,"minecraft:thorns":7}}}},minecraft:unbreakable={{show_in_tooltip:false}},minecraft:custom_data={{ancient_armor:1b,slot:"helmet",tier:15,ancient_armor_t10:1b,ancient_armor_t15:1b}}] 1',

    # Áo Giáp Sáng Thế Tier 15 (Kháng Sát Thương II, Hồi Máu, Fly)
    f'give {PLAYER} minecraft:netherite_chestplate[minecraft:custom_name=\'{{"text":"❂ Áo Giáp Cổ Đại Sáng Thế Vũ Trụ [Tier 15] ❂","color":"gold","bold":true,"italic":false}}\',minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\',\'{{"text":"Chiến giáp áo giáp thần thoại tôi luyện từ thời thượng cổ.","color":"gray","italic":true}}\',\'["",{{\"text\":\"Độ Bền: \",\"color\":\"gray\",\"italic\":false}},{{\"text\":\"[▰▰▰▰▰▰▰▰▰▰] \",\"color\":\"gold\",\"bold\":true,\"italic\":false}},{{\"text\":\"100% (VĨNH CỬU)\",\"color\":\"yellow\",\"bold\":true,\"italic\":false}}]\',\'{{"text":"✦ Bảo Vệ: Cấp 14 • Gai Góc: Cấp 7","color":"aqua","italic":false}}\',\'{{"text":"✦ BUFF: KHÁNG SÁT THƯƠNG II & HỒI SINH KHÍ CỰC ĐẠI!","color":"green","bold":true,"italic":false}}\',\'{{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BẤT TỬ CHI THÂN, TỐC ĐỘ III & PHI HÀNH (FLY)!","color":"gold","bold":true,"italic":false}}\',\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\'],minecraft:enchantments={{levels:{{"minecraft:protection":14,"minecraft:thorns":7}}}},minecraft:unbreakable={{show_in_tooltip:false}},minecraft:custom_data={{ancient_armor:1b,slot:"chestplate",tier:15,ancient_armor_t10:1b,ancient_armor_t15:1b}}] 1',

    # Xà Cạp Sáng Thế Tier 15
    f'give {PLAYER} minecraft:netherite_leggings[minecraft:custom_name=\'{{"text":"❂ Xà Cạp Cổ Đại Sáng Thế Vũ Trụ [Tier 15] ❂","color":"gold","bold":true,"italic":false}}\',minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\',\'{{"text":"Chiến giáp xà cạp thần thoại tôi luyện từ thời thượng cổ.","color":"gray","italic":true}}\',\'["",{{\"text\":\"Độ Bền: \",\"color\":\"gray\",\"italic\":false}},{{\"text\":\"[▰▰▰▰▰▰▰▰▰▰] \",\"color\":\"gold\",\"bold\":true,\"italic\":false}},{{\"text\":\"100% (VĨNH CỬU)\",\"color\":\"yellow\",\"bold\":true,\"italic\":false}}]\',\'{{"text":"✦ Bảo Vệ: Cấp 14 • Gai Góc: Cấp 7","color":"aqua","italic":false}}\',\'{{"text":"✦ BUFF: GIA TĂNG SINH MỆNH & GIẢM SÁT THƯƠNG MA THUẬT!","color":"yellow","bold":true,"italic":false}}\',\'{{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BẤT TỬ CHI THÂN, TỐC ĐỘ III & PHI HÀNH (FLY)!","color":"gold","bold":true,"italic":false}}\',\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\'],minecraft:enchantments={{levels:{{"minecraft:protection":14,"minecraft:thorns":7}}}},minecraft:unbreakable={{show_in_tooltip:false}},minecraft:custom_data={{ancient_armor:1b,slot:"leggings",tier:15,ancient_armor_t10:1b,ancient_armor_t15:1b}}] 1',

    # Ủng Sáng Thế Tier 15 (Speed III, Kháng Rơi 10)
    f'give {PLAYER} minecraft:netherite_boots[minecraft:custom_name=\'{{"text":"❂ Ủng Cổ Đại Sáng Thế Vũ Trụ [Tier 15] ❂","color":"gold","bold":true,"italic":false}}\',minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\',\'{{"text":"Chiến giáp ủng thần thoại tôi luyện từ thời thượng cổ.","color":"gray","italic":true}}\',\'["",{{\"text\":\"Độ Bền: \",\"color\":\"gray\",\"italic\":false}},{{\"text\":\"[▰▰▰▰▰▰▰▰▰▰] \",\"color\":\"gold\",\"bold\":true,\"italic\":false}},{{\"text\":\"100% (VĨNH CỬU)\",\"color\":\"yellow\",\"bold\":true,\"italic\":false}}]\',\'{{"text":"✦ Bảo Vệ: Cấp 14 • Gai Góc: Cấp 7","color":"aqua","italic":false}}\',\'{{"text":"✦ BUFF: TỐC ĐỘ DI CHUYỂN II (SPEED II) XÉ GIÓ!","color":"aqua","bold":true,"italic":false}}\',\'{{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BẤT TỬ CHI THÂN, TỐC ĐỘ III & PHI HÀNH (FLY)!","color":"gold","bold":true,"italic":false}}\',\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\'],minecraft:enchantments={{levels:{{"minecraft:protection":14,"minecraft:thorns":7,"minecraft:feather_falling":10,"minecraft:depth_strider":3}}}},minecraft:unbreakable={{show_in_tooltip:false}},minecraft:custom_data={{ancient_armor:1b,slot:"boots",tier:15,ancient_armor_t10:1b,ancient_armor_t15:1b}}] 1',

    # 3. TRANG BỊ ĐẶC BIỆT THẦN THOẠI
    # Gậy Đẩy Quái Slime 3000 (Knockback 10)
    f'give {PLAYER} minecraft:stick[minecraft:custom_name=\'{{"text":"☄ Gậy Đẩy Quái Slime 3000 ☄","color":"green","bold":true}}\',minecraft:lore=[\'{{"text":"Chế tạo từ tinh chất Slime dẻo dai!","color":"gray","italic":true}}\',\'{{"text":"✦ KNOCKBACK X (Đẩy Lùi Cấp 10)!","color":"red","bold":true}}\',\'{{"text":"✦ Unbreaking X","color":"gold"}}\',\'{{"text":"[Vui nhộn]: Đập một phát mục tiêu bay xa 50 block!","color":"yellow"}}\'],minecraft:enchantments={{levels:{{"minecraft:knockback":10,"minecraft:unbreaking":10}}}}] 1',

    # Cần Câu Thần Kỳ May Mắn
    f'give {PLAYER} minecraft:fishing_rod[minecraft:custom_name=\'{{"text":"★ Cần Câu Thần Kỳ May Mắn ★","color":"gold","bold":true}}\',minecraft:enchantments={{levels:{{"minecraft:luck_of_the_sea":5,"minecraft:lure":5,"minecraft:unbreaking":10}}}}] 1',

    # 16 Bùa Hộ Mệnh Bất Tử Thần Thánh
    f'give {PLAYER} minecraft:totem_of_undying[minecraft:custom_name=\'{{"text":"❂ Bùa Hộ Mệnh Bất Tử Thần Thánh ❂","color":"gold","bold":true}}\',minecraft:lore=[\'{{"text":"Bảo vật cứu mạng trước mọi lưỡi hái tử thần!","color":"yellow","italic":true}}\',\'{{"text":"✦ Hồi sinh tức thì khi nhận sát thương chí mạng","color":"aqua"}}\',\'{{"text":"✦ Ban tặng Hồi Máu & Kháng Sát Thương","color":"green"}}\']] 16',

    # 4. NGUYÊN LIỆU TIẾN HÓA CỰC PHẨM (MỖI LOẠI 1 STACK = 64)
    # Mảnh Quặng Cổ Đại
    f'give {PLAYER} minecraft:prismarine_shard[minecraft:custom_name=\'{{"text":"✦ Mảnh Quặng Cổ Đại ✦","color":"aqua","bold":true,"italic":false}}\',minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\',\'{{"text":"Nguyên liệu ngưng tụ từ kỷ nguyên sơ khai.","color":"gray","italic":true}}\',\'{{"text":"✦ Dùng để luyện kim và rèn trang bị Bậc 1 - 5","color":"dark_aqua","italic":false}}\',\'{{"text":"[Loại]: Nguyên Liệu Cổ Đại","color":"yellow","bold":true,"italic":false}}\',\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\'],minecraft:enchantment_glint_override=true,minecraft:custom_data={{ancient_mat:"shard"}}] 64',
    # Tinh Thể Cổ Đại
    f'give {PLAYER} minecraft:amethyst_shard[minecraft:custom_name=\'{{"text":"❂ Tinh Thể Cổ Đại ❂","color":"light_purple","bold":true,"italic":false}}\',minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\',\'{{"text":"Tinh thể phát sáng với ma năng nguyên thủy.","color":"gray","italic":true}}\',\'{{"text":"✦ Dùng để rèn trang bị Cổ Đại Bậc 6 - 9","color":"light_purple","italic":false}}\',\'{{"text":"[Loại]: Nguyên Liệu Thần Thoại","color":"gold","bold":true,"italic":false}}\',\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\'],minecraft:enchantment_glint_override=true,minecraft:custom_data={{ancient_mat:"crystal"}}] 64',
    # Trái Tim Của Quỷ
    f'give {PLAYER} minecraft:fermented_spider_eye[minecraft:custom_name=\'{{"text":"☠ Trái Tim Của Quỷ ☠","color":"dark_red","bold":true,"italic":false}}\',minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\',\'{{"text":"Trái tim đen tối vẫn còn đập của Chúa Tể Bóng Tối.","color":"dark_purple","italic":true}}\',\'{{"text":"⚡ Nguyên liệu ĐỘT PHÁ bắt buộc cho mốc TIER 10!","color":"red","bold":true,"italic":false}}\',\'{{"text":"✦ Rơi 100% khi hạ gục Chúa Tể Bóng Tối (/warp boss)","color":"gold","italic":false}}\',\'{{"text":"[Loại]: Nguyên Liệu Đột Phá Hắc Ám","color":"dark_red","bold":true,"italic":false}}\',\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\'],minecraft:enchantment_glint_override=true,minecraft:custom_data={{ancient_mat:"demon_heart"}}] 64',
    # Lõi Hư Không
    f'give {PLAYER} minecraft:echo_shard[minecraft:custom_name=\'{{"text":"🌀 Lõi Hư Không 🌀","color":"dark_purple","bold":true,"italic":false}}\',minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\',\'{{"text":"Chứa đựng trọng lực vô tận từ không gian hư vô.","color":"gray","italic":true}}\',\'{{"text":"⚡ Nguyên liệu ĐỘT PHÁ bắt buộc cho mốc TIER 13!","color":"light_purple","bold":true,"italic":false}}\',\'{{"text":"✦ Trao đổi tại Đại Sư Luyện Kim","color":"aqua","italic":false}}\',\'{{"text":"[Loại]: Nguyên Liệu Tối Thượng","color":"dark_purple","bold":true,"italic":false}}\',\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\'],minecraft:enchantment_glint_override=true,minecraft:custom_data={{ancient_mat:"void_core"}}] 64',
    # Tinh Hoa Vũ Trụ
    f'give {PLAYER} minecraft:nether_star[minecraft:custom_name=\'{{"text":"✧ Tinh Hoa Vũ Trụ ✧","color":"yellow","bold":true,"italic":false}}\',minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\',\'{{"text":"Bụi sao tinh tú hội tụ sức mạnh tạo tác cội nguồn.","color":"yellow","italic":true}}\',\'{{"text":"⚡ Nguyên liệu ĐỘT PHÁ TỐI THƯỢNG cho TIER 15 VĨNH CỬU!","color":"gold","bold":true,"italic":false}}\',\'{{"text":"✦ Trao đổi tại Đại Sư Luyện Kim","color":"aqua","italic":false}}\',\'{{"text":"[Loại]: Cực Phẩm Vũ Trụ","color":"yellow","bold":true,"italic":false}}\',\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}}\'],minecraft:enchantment_glint_override=true,minecraft:custom_data={{ancient_mat:"cosmic_essence"}}] 64',

    # 5. KINH TẾ & DANH HIỆU
    # Tiền mặt: 50,000,000 Xu
    f'eco give {PLAYER} 50000000',
    # Cấp danh hiệu cao nhất: [🔱 TÀI PHIỆT]
    f'tag {PLAYER} add title_taiphiet',
    f'team join tag_taiphiet {PLAYER}',

    # 6. Hiệu ứng âm thanh & Thông báo đặc quyền
    f'playsound minecraft:ui.toast.challenge_complete player {PLAYER} ~ ~ ~ 1.0 1.0',
    f'tellraw {PLAYER} [{{"text":"\n👑 [HỆ THỐNG VIP] ","color":"gold","bold":true}},{{"text":"Bạn đã được trao tặng TRỌN BỘ TRANG BỊ SÁNG THẾ VŨ TRỤ TIER 15, VÍ $50,000,000 & DANH HIỆU [🔱 TÀI PHIỆT]!","color":"green","bold":true}}]'
]

if __name__ == '__main__':
    print(f"=== Đang trao tặng đồ VIP cho người chơi: {PLAYER} ===")
    for cmd in commands:
        res = rcon_cmd(cmd)
        if res.strip():
            print(f"-> {res.strip()}")
    print("\n✅ ĐÃ HOÀN TẤT TRAO TẶNG TOÀN BỘ VẬT PHẨM VIP!")
