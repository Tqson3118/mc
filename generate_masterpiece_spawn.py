# -*- coding: utf-8 -*-
"""
Masterpiece Voxel Generator for Skyblock Spawn Satellite Areas:
1. Sakura Imperial Garden & Safe Mob Farm (/warp farm)
2. Celestial Floating Lotus Pond & Moon Bridge (/warp cauca)
3. 4 Elemental Boss Islands with Parabolic Giant Chains (/warp boss)
"""

import os
import math

FUNCTION_DIR = os.path.join(
    os.path.dirname(__file__),
    'world', 'datapacks', 'skyblock_spawn', 'data', 'skyblock', 'function'
)

def build_farm():
    cmds = []
    cmds.append("# ==============================================================================")
    cmds.append("# SIÊU VƯỜN THƯỢNG UYỂN HOA ANH ĐÀO & KHU FARM QUÁI CÔNG CỘNG (/WARP FARM)")
    cmds.append("# Tọa độ: X: -108..-74, Z: -18..18, Y=96..132 (Phía Tây Spawn)")
    cmds.append("# Phong cách: Thần Thoại Á Đông - Cổ Thụ Sakura, Đình Mái Cong 2 Tầng, Cổng Torii")
    cmds.append("# ==============================================================================")
    cmds.append("")
    
    # 1. Clear airspace
    cmds.append("# 1. Dọn dẹp không gian bầu trời")
    cmds.append("fill -108 96 -18 -74 132 18 air")
    cmds.append("")
    
    # 2. Cầu xích nối từ Cánh Tây Hub sang Vườn
    cmds.append("# 2. Cầu xích treo & Lối vào Cánh Tây")
    cmds.append("fill -75 120 -1 -72 120 1 chain[axis=x]")
    cmds.append("fill -77 111 -2 -74 111 2 cherry_planks")
    cmds.append("fill -77 112 -2 -74 112 -2 cherry_fence")
    cmds.append("fill -77 112 2 -74 112 2 cherry_fence")
    cmds.append("")
    
    # 3. Đáy đảo nổi Organic Inverted Stalactites (Y: 96..109)
    cmds.append("# 3. Đáy đảo nổi nhọn rủ xuống Hư Không (Organic Inverted Stalactites)")
    # Răng nhọn đáy sâu nhất
    cmds.append("setblock -92 96 0 crying_obsidian")
    cmds.append("fill -93 97 -1 -91 97 1 gilded_blackstone")
    cmds.append("fill -94 98 -2 -90 98 2 cobbled_deepslate")
    cmds.append("fill -96 99 -3 -88 99 3 cobbled_deepslate")
    cmds.append("fill -98 100 -5 -86 100 5 cobbled_deepslate")
    cmds.append("fill -100 102 -7 -84 102 7 tuff")
    cmds.append("fill -102 104 -9 -82 104 9 tuff")
    cmds.append("fill -104 106 -12 -80 106 12 dirt")
    cmds.append("fill -105 108 -14 -78 108 14 moss_block")
    cmds.append("fill -106 109 -15 -77 109 15 moss_block")
    # Đính tinh thể thạch anh tím dưới đáy vách đá
    cmds.append("setblock -94 97 2 amethyst_cluster[facing=south]")
    cmds.append("setblock -90 97 -2 amethyst_cluster[facing=north]")
    cmds.append("setblock -96 99 4 amethyst_cluster[facing=south]")
    cmds.append("setblock -88 99 -4 amethyst_cluster[facing=north]")
    cmds.append("setblock -92 95 0 amethyst_cluster[facing=down]")
    cmds.append("")
    
    # 4. Mặt sàn tự nhiên & Thảm cỏ hoa (Y=110)
    cmds.append("# 4. Mặt sàn cảnh quan Vườn Thượng Uyển (Y=110)")
    cmds.append("fill -106 110 -15 -76 110 15 grass_block")
    cmds.append("fill -88 110 -12 -77 110 12 cherry_planks")
    cmds.append("fill -86 110 -9 -79 110 9 smooth_quartz")
    # Lối đi sỏi đá và rải cánh hoa Sakura
    cmds.append("fill -84 110 -2 -77 110 2 smooth_stone")
    cmds.append("setblock -81 111 -1 pink_petals[flower_amount=4]")
    cmds.append("setblock -80 111 1 pink_petals[flower_amount=3]")
    cmds.append("setblock -83 111 2 pink_petals[flower_amount=4]")
    cmds.append("setblock -82 111 -3 pink_petals[flower_amount=2]")
    cmds.append("setblock -85 111 -5 pink_petals[flower_amount=4]")
    cmds.append("setblock -85 111 5 pink_petals[flower_amount=4]")
    cmds.append("")
    
    # 5. CỔNG TORII Á ĐÔNG NGHÊNH KHÁCH (Torii Moon Gate at X=-78, Z=0)
    cmds.append("# 5. Cổng Torii Cung Đình Á Đông (X=-78)")
    cmds.append("fill -78 111 -3 -78 116 -3 cherry_wood")
    cmds.append("fill -78 111 3 -78 116 3 cherry_wood")
    cmds.append("setblock -78 111 -3 polished_blackstone")
    cmds.append("setblock -78 111 3 polished_blackstone")
    # Xà ngang Torii
    cmds.append("fill -78 115 -4 -78 115 4 cherry_slab[type=top]")
    cmds.append("fill -78 117 -5 -78 117 5 cherry_wood")
    cmds.append("setblock -78 118 -5 cherry_stairs[facing=south]")
    cmds.append("setblock -78 118 5 cherry_stairs[facing=north]")
    cmds.append("setblock -78 116 -3 lantern[hanging=true]")
    cmds.append("setblock -78 116 3 lantern[hanging=true]")
    cmds.append("")
    
    # 6. ĐÌNH MÁI CONG 2 TẦNG (2-TIERED FLARED ORIENTAL PAVILION: X: -88..-79, Z: -8..8)
    cmds.append("# 6. Đình Mái Cong 2 Tầng Cổ Trang")
    # 4 Cột trụ đình
    cmds.append("fill -87 111 -8 -87 115 -8 cherry_log")
    cmds.append("fill -79 111 -8 -79 115 -8 cherry_log")
    cmds.append("fill -87 111 8 -87 115 8 cherry_log")
    cmds.append("fill -79 111 8 -79 115 8 cherry_log")
    # Lan can bao quanh
    cmds.append("fill -87 111 -8 -79 111 -8 cherry_fence")
    cmds.append("fill -87 111 8 -79 111 8 cherry_fence")
    cmds.append("fill -79 111 -8 -79 111 -4 cherry_fence")
    cmds.append("fill -79 111 4 -79 111 8 cherry_fence")
    # Mái Tầng 1 (Y=115..116) xòe rộng vuốt cong
    cmds.append("fill -88 115 -9 -78 115 9 cherry_slab[type=top]")
    cmds.append("fill -87 116 -8 -79 116 8 cherry_planks")
    cmds.append("setblock -89 116 -10 cherry_stairs[facing=south]")
    cmds.append("setblock -77 116 -10 cherry_stairs[facing=south]")
    cmds.append("setblock -89 116 10 cherry_stairs[facing=north]")
    cmds.append("setblock -77 116 10 cherry_stairs[facing=north]")
    # Gác Lầu Tầng 2 (Y=117..118)
    cmds.append("fill -85 117 -6 -81 117 6 cherry_planks")
    cmds.append("fill -85 117 -6 -85 119 -6 cherry_fence")
    cmds.append("fill -81 117 -6 -81 119 -6 cherry_fence")
    cmds.append("fill -85 117 6 -85 119 6 cherry_fence")
    cmds.append("fill -81 117 6 -81 119 6 cherry_fence")
    # Mái Tầng 2 Vút Nhọn Đỉnh Amethyst (Y=119..121)
    cmds.append("fill -86 119 -7 -80 119 7 cherry_slab[type=bottom]")
    cmds.append("fill -84 120 -5 -82 120 5 cherry_wood")
    cmds.append("setblock -83 121 0 amethyst_cluster[facing=up]")
    # Đèn lồng treo 4 góc mái tầng 1 & 2
    cmds.append("setblock -88 114 -8 lantern[hanging=true]")
    cmds.append("setblock -78 114 -8 lantern[hanging=true]")
    cmds.append("setblock -88 114 8 lantern[hanging=true]")
    cmds.append("setblock -78 114 8 lantern[hanging=true]")
    cmds.append("setblock -85 118 -6 lantern[hanging=true]")
    cmds.append("setblock -81 118 6 lantern[hanging=true]")
    # Tiện ích đình: Rương, Thùng ủ đồ, Bàn chế tạo, Đe
    cmds.append("setblock -81 111 -7 chest")
    cmds.append("setblock -82 111 -7 chest")
    cmds.append("setblock -81 111 7 barrel")
    cmds.append("setblock -82 111 7 barrel")
    cmds.append("setblock -85 111 -7 crafting_table")
    cmds.append("setblock -85 111 7 anvil")
    cmds.append("")
    
    # 7. CÂY SAKURA CỔ THỤ UỐN LƯỢN FRACTAL (2 Giant Organic Cherry Trees)
    # Cây Bắc: Gốc tại X=-80, Z=-12
    cmds.append("# 7. Cây Sakura Cổ Thụ 1 (Bắc)")
    cmds.append("fill -80 111 -12 -80 113 -12 cherry_log")
    cmds.append("setblock -80 114 -13 cherry_log")
    cmds.append("setblock -81 115 -13 cherry_log")
    cmds.append("setblock -79 115 -14 cherry_log")
    cmds.append("setblock -80 116 -12 cherry_log")
    # Tán lá bồng bềnh hình mây (Cloud puff leaves)
    cmds.append("fill -82 115 -15 -78 116 -11 cherry_leaves")
    cmds.append("fill -83 116 -16 -77 117 -10 cherry_leaves")
    cmds.append("fill -82 118 -15 -78 118 -11 cherry_leaves")
    cmds.append("setblock -80 116 -13 shroomlight") # Phát sáng ẩn trong tán lá
    cmds.append("setblock -80 114 -14 lantern[hanging=true]")
    # Cây Nam: Gốc tại X=-80, Z=12
    cmds.append("# Cây Sakura Cổ Thụ 2 (Nam)")
    cmds.append("fill -80 111 12 -80 113 12 cherry_log")
    cmds.append("setblock -80 114 13 cherry_log")
    cmds.append("setblock -81 115 13 cherry_log")
    cmds.append("setblock -79 115 14 cherry_log")
    cmds.append("setblock -80 116 12 cherry_log")
    cmds.append("fill -82 115 11 -78 116 15 cherry_leaves")
    cmds.append("fill -83 116 10 -77 117 16 cherry_leaves")
    cmds.append("fill -82 118 11 -78 118 15 cherry_leaves")
    cmds.append("setblock -80 116 13 shroomlight")
    cmds.append("setblock -80 114 14 lantern[hanging=true]")
    cmds.append("")
    
    # 8. HÀNH LANG CHÉM QUÁI AN TOÀN & THẠCH ĐIỆN SPAWNER (X: -107..-88)
    cmds.append("# 8. Vách Chém Quái An Toàn 0.5 Block & Thạch Điện Spawner")
    # Khe hở 0.5 block ở chân để người chơi chém quái an toàn 100%
    cmds.append("fill -88 111 -11 -88 111 11 cherry_slab[type=bottom]")
    cmds.append("fill -88 112 -11 -88 114 11 iron_bars")
    cmds.append("fill -88 115 -11 -88 115 11 polished_deepslate")
    # Sàn buồng quái thấp hơn 1 block (Y=109) để quái không với tới người chơi
    cmds.append("fill -107 109 -14 -89 109 14 polished_deepslate")
    # Tường thạch điện
    cmds.append("fill -107 110 -15 -89 115 -15 deepslate_bricks")
    cmds.append("fill -107 110 15 -89 115 15 deepslate_bricks")
    cmds.append("fill -107 110 -15 -107 115 15 deepslate_bricks")
    # Trần tối giữ tỷ lệ spawn tối đa
    cmds.append("fill -107 115 -14 -89 115 14 deepslate_tiles")
    cmds.append("")
    
    # 9. 4 LỒNG SPAWNER SIÊU CẤP
    cmds.append("# 9. 4 Lồng Spawner Nâng Cấp")
    # Spawner Zombie
    cmds.append('setblock -100 111 -7 spawner')
    cmds.append('data modify block -100 111 -7 SpawnData set value {entity:{id:"minecraft:zombie"}}')
    cmds.append('data modify block -100 111 -7 MinSpawnDelay set value 70s')
    cmds.append('data modify block -100 111 -7 MaxSpawnDelay set value 140s')
    cmds.append('data modify block -100 111 -7 SpawnCount set value 4s')
    cmds.append('data modify block -100 111 -7 RequiredPlayerRange set value 32s')
    # Spawner Skeleton
    cmds.append('setblock -100 111 7 spawner')
    cmds.append('data modify block -100 111 7 SpawnData set value {entity:{id:"minecraft:skeleton"}}')
    cmds.append('data modify block -100 111 7 MinSpawnDelay set value 70s')
    cmds.append('data modify block -100 111 7 MaxSpawnDelay set value 140s')
    cmds.append('data modify block -100 111 7 SpawnCount set value 4s')
    cmds.append('data modify block -100 111 7 RequiredPlayerRange set value 32s')
    # Spawner Spider
    cmds.append('setblock -93 111 -7 spawner')
    cmds.append('data modify block -93 111 -7 SpawnData set value {entity:{id:"minecraft:spider"}}')
    cmds.append('data modify block -93 111 -7 MinSpawnDelay set value 80s')
    cmds.append('data modify block -93 111 -7 MaxSpawnDelay set value 160s')
    cmds.append('data modify block -93 111 -7 SpawnCount set value 3s')
    cmds.append('data modify block -93 111 -7 RequiredPlayerRange set value 32s')
    # Spawner Blaze
    cmds.append('setblock -93 111 7 spawner')
    cmds.append('data modify block -93 111 7 SpawnData set value {entity:{id:"minecraft:blaze"}}')
    cmds.append('data modify block -93 111 7 MinSpawnDelay set value 80s')
    cmds.append('data modify block -93 111 7 MaxSpawnDelay set value 160s')
    cmds.append('data modify block -93 111 7 SpawnCount set value 3s')
    cmds.append('data modify block -93 111 7 RequiredPlayerRange set value 32s')
    cmds.append("")
    
    # 10. Biển chỉ dẫn chữ phát sáng
    cmds.append("# 10. Biển Chỉ Dẫn Nghệ Thuật")
    cmds.append('setblock -79 112 -2 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:[\'{"text":"🌸 VƯỜN THƯỢNG UYỂN 🌸","color":"light_purple","bold":true}\',\'{"text":"Khu Farm Quái An Toàn","color":"green"}\',\'{"text":"Đứng tại khe chém quái","color":"yellow"}\',\'{"text":"Nhặt EXP & Nguyên Liệu!","color":"gold"}\']}}')
    cmds.append('setblock -79 112 2 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ MẸO KIẾM TIỀN ]","color":"gold","bold":true}\',\'{"text":"Dùng Kiếm Looting cao","color":"aqua"}\',\'{"text":"Đổi xương thịt lấy Xu","color":"yellow"}\',\'{"text":"Tại /warp shop Tây Hub","color":"green"}\']}}')
    cmds.append("")
    
    return "\n".join(cmds)


def build_fishing():
    cmds = []
    cmds.append("# ==============================================================================")
    cmds.append("# THỦY TẠ THẦN TIÊN HỒ SEN & CẦU VÒM CUNG NGHỈ DƯỠNG (/WARP CAUCA)")
    cmds.append("# Tọa độ: X: -22..22, Z: -118..-72, Y=96..132 (Phía Bắc Spawn)")
    cmds.append("# Phong cách: Thủy Mặc Tiên Cảnh - Đầm Sen Pha Lê, Cầu Cong Vút, Đình Lục Giác 2 Tầng")
    cmds.append("# ==============================================================================")
    cmds.append("")
    
    # 1. Clear airspace
    cmds.append("# 1. Dọn dẹp không gian bầu trời")
    cmds.append("fill -22 96 -118 22 132 -72 air")
    cmds.append("")
    
    # 2. Xích sắt nối Cánh Bắc Hub sang Hồ
    cmds.append("# 2. Lối vào từ Cánh Bắc Hub")
    cmds.append("fill -1 120 -73 1 120 -71 chain[axis=z]")
    cmds.append("fill -2 111 -76 2 111 -73 cherry_planks")
    cmds.append("fill -2 112 -76 -2 112 -73 cherry_fence")
    cmds.append("fill 2 112 -76 2 112 -73 cherry_fence")
    cmds.append("")
    
    # 3. Đáy đảo nổi nhọn rủ xuống Hư Không (Y: 96..109)
    cmds.append("# 3. Đáy đảo nổi rủ xuống Hư Không (Inverted Stalactites)")
    cmds.append("setblock 0 96 -95 crying_obsidian")
    cmds.append("fill -1 97 -96 1 97 -94 gilded_blackstone")
    cmds.append("fill -3 98 -98 3 98 -92 cobbled_deepslate")
    cmds.append("fill -5 100 -101 5 100 -89 cobbled_deepslate")
    cmds.append("fill -8 102 -105 8 102 -85 tuff")
    cmds.append("fill -12 104 -109 12 104 -81 tuff")
    cmds.append("fill -16 106 -113 16 106 -77 dirt")
    cmds.append("fill -18 108 -115 18 108 -75 moss_block")
    cmds.append("fill -20 109 -116 20 109 -74 moss_block")
    # Đính tinh thể thạch anh tím lấp lánh dưới vách đá
    cmds.append("setblock 0 95 -95 amethyst_cluster[facing=down]")
    cmds.append("setblock -4 99 -92 amethyst_cluster[facing=north]")
    cmds.append("setblock 4 99 -98 amethyst_cluster[facing=south]")
    cmds.append("setblock -9 103 -86 amethyst_cluster[facing=north]")
    cmds.append("setblock 9 103 -104 amethyst_cluster[facing=south]")
    cmds.append("")
    
    # 4. Mặt sàn viền cỏ xanh & Lòng Hồ Sen Pha Lê (Crystal Lotus Pond)
    cmds.append("# 4. Lòng Hồ Sen Pha Lê Đa Tầng (Y=105..110)")
    cmds.append("fill -19 110 -115 19 110 -75 grass_block")
    # Đáy cát ngầm
    cmds.append("fill -14 105 -111 14 105 -79 sand")
    # Nước trong veo lấp lánh
    cmds.append("fill -14 106 -111 14 109 -79 water")
    # Đèn biển ngầm tạo hoa văn hoa sen phát sáng dưới nước
    cmds.append("setblock 0 105 -95 sea_lantern")
    cmds.append("setblock -4 105 -95 sea_lantern")
    cmds.append("setblock 4 105 -95 sea_lantern")
    cmds.append("setblock 0 105 -99 sea_lantern")
    cmds.append("setblock 0 105 -91 sea_lantern")
    cmds.append("setblock -3 105 -98 sea_lantern")
    cmds.append("setblock 3 105 -98 sea_lantern")
    cmds.append("setblock -3 105 -92 sea_lantern")
    cmds.append("setblock 3 105 -92 sea_lantern")
    cmds.append("setblock -8 105 -105 sea_lantern")
    cmds.append("setblock 8 105 -105 sea_lantern")
    cmds.append("setblock -8 105 -85 sea_lantern")
    cmds.append("setblock 8 105 -85 sea_lantern")
    # Lá sen súng nổi bồng bềnh trên mặt nước (Y=110)
    for (lx, lz) in [(-6, -92), (6, -92), (-8, -98), (8, -98), (-2, -88), (2, -88), (-4, -104), (4, -104), (0, -86), (0, -104)]:
        cmds.append(f"setblock {lx} 110 {lz} lily_pad")
    # Cánh hoa anh đào ven hồ
    cmds.append("setblock -15 111 -82 pink_petals[flower_amount=4]")
    cmds.append("setblock 15 111 -82 pink_petals[flower_amount=3]")
    cmds.append("setblock -15 111 -108 pink_petals[flower_amount=4]")
    cmds.append("setblock 15 111 -108 pink_petals[flower_amount=3]")
    cmds.append("")
    
    # 5. CẦU VÒM CUNG UỐN LƯỢN MỀM MẠI (Smooth Arched Moon Bridge: Z=-86 đến Z=-76)
    cmds.append("# 5. Cầu Vòm Cung Gỗ Anh Đào Uốn Mượt (Arched Moon Bridge)")
    # Nhịp chân phía Nam
    cmds.append("fill -1 110 -76 1 110 -76 cherry_planks")
    cmds.append("fill -1 111 -78 1 111 -77 cherry_stairs[facing=south]")
    cmds.append("fill -1 112 -80 1 112 -79 cherry_stairs[facing=south]")
    # Đỉnh vòm cầu (Y=113)
    cmds.append("fill -1 113 -82 1 113 -81 cherry_planks")
    # Nhịp đổ xuống phía Bắc
    cmds.append("fill -1 112 -84 1 112 -83 cherry_stairs[facing=north]")
    cmds.append("fill -1 111 -86 1 111 -85 cherry_stairs[facing=north]")
    cmds.append("fill -1 110 -87 1 110 -87 cherry_planks")
    # Tay vịn lan can cầu cong uốn lượn
    cmds.append("fill -2 111 -76 -2 111 -76 cherry_fence")
    cmds.append("fill 2 111 -76 2 111 -76 cherry_fence")
    cmds.append("fill -2 112 -78 -2 112 -77 cherry_fence")
    cmds.append("fill 2 112 -78 2 112 -77 cherry_fence")
    cmds.append("fill -2 113 -80 -2 113 -79 cherry_fence")
    cmds.append("fill 2 113 -80 2 113 -79 cherry_fence")
    cmds.append("fill -2 114 -82 -2 114 -81 cherry_fence")
    cmds.append("fill 2 114 -82 2 114 -81 cherry_fence")
    cmds.append("fill -2 113 -84 -2 113 -83 cherry_fence")
    cmds.append("fill 2 113 -84 2 113 -83 cherry_fence")
    cmds.append("fill -2 112 -86 -2 112 -85 cherry_fence")
    cmds.append("fill 2 112 -86 2 112 -85 cherry_fence")
    # Đèn lồng đỉnh cầu
    cmds.append("setblock -2 115 -81 lantern")
    cmds.append("setblock 2 115 -81 lantern")
    cmds.append("")
    
    # 6. ĐÌNH THỦY TẠ LỤC GIÁC 2 TẦNG MÁI CONG (Flared 2-Tier Lotus Pavilion: X: -7..7, Z: -103..-89)
    cmds.append("# 6. Đình Thủy Tạ Lục Giác 2 Tầng Mái Cong (X: -7..7, Z: -103..-89)")
    # Mặt sàn đình nổi trên mặt nước (Y=110)
    cmds.append("fill -6 110 -101 6 110 -91 cherry_planks")
    cmds.append("fill -4 110 -99 4 110 -93 smooth_quartz")
    # 6 Cột trụ lục giác gỗ anh đào vươn cao
    cols = [(-6, -101), (6, -101), (-6, -91), (6, -91), (-7, -96), (7, -96)]
    for (cx, cz) in cols:
        cmds.append(f"fill {cx} 111 {cz} {cx} 115 {cz} cherry_wood")
    # Lan can bao quanh đình (hở lối vào phía Nam Z=-91)
    cmds.append("fill -6 111 -101 6 111 -101 cherry_fence")
    cmds.append("fill -6 111 -101 -6 111 -91 cherry_fence")
    cmds.append("fill 6 111 -101 6 111 -91 cherry_fence")
    cmds.append("fill -6 111 -91 -2 111 -91 cherry_fence")
    cmds.append("fill 2 111 -91 6 111 -91 cherry_fence")
    # Mái Tầng 1 (Y=115..116) xòe rộng vuốt ngược
    cmds.append("fill -7 115 -102 7 115 -90 cherry_slab[type=top]")
    cmds.append("fill -6 116 -101 6 116 -91 cherry_planks")
    cmds.append("setblock -8 116 -103 cherry_stairs[facing=south]")
    cmds.append("setblock 8 116 -103 cherry_stairs[facing=south]")
    cmds.append("setblock -8 116 -89 cherry_stairs[facing=north]")
    cmds.append("setblock 8 116 -89 cherry_stairs[facing=north]")
    # Cổ diềm mái Tầng 2 (Y=117..118)
    cmds.append("fill -4 117 -99 4 117 -93 cherry_planks")
    cmds.append("fill -4 117 -99 -4 118 -93 purple_stained_glass_pane")
    cmds.append("fill 4 117 -99 4 118 -93 purple_stained_glass_pane")
    # Mái Tầng 2 Vút Nhọn & Bảo Tháp Thạch Anh Tím (Y=119..122)
    cmds.append("fill -5 119 -100 5 119 -92 cherry_slab[type=bottom]")
    cmds.append("fill -3 120 -98 3 120 -94 cherry_wood")
    cmds.append("setblock 0 121 -96 amethyst_block")
    cmds.append("setblock 0 122 -96 amethyst_cluster[facing=up]")
    # Đèn lồng treo 4 góc mái đình
    cmds.append("setblock -7 114 -101 lantern[hanging=true]")
    cmds.append("setblock 7 114 -101 lantern[hanging=true]")
    cmds.append("setblock -7 114 -91 lantern[hanging=true]")
    cmds.append("setblock 7 114 -91 lantern[hanging=true]")
    # Bàn trà đạo ngắm cảnh & Ghế tựa bên trong Thủy Tạ
    cmds.append("setblock -3 111 -96 cherry_stairs[facing=east]")
    cmds.append("setblock 3 111 -96 cherry_stairs[facing=west]")
    cmds.append("setblock 0 111 -96 smooth_quartz_slab[type=bottom]")
    cmds.append("setblock 0 112 -96 sea_pickle[pickles=3]")
    # Tiện ích: Thùng cá, Bàn chế tạo
    cmds.append("setblock -4 111 -99 barrel")
    cmds.append("setblock 4 111 -99 barrel")
    cmds.append("setblock -4 111 -98 crafting_table")
    cmds.append("")
    
    # 7. CÂY ANH ĐÀO SOI BÓNG VEN HỒ (Overhanging Sakura Tree at X=-14, Z=-95)
    cmds.append("# 7. Cây Anh Đào Cổ Thụ Soi Bóng Hồ Sen")
    cmds.append("fill -14 111 -95 -14 113 -95 cherry_log")
    cmds.append("setblock -13 114 -95 cherry_log")
    cmds.append("setblock -12 115 -95 cherry_log")
    cmds.append("setblock -11 116 -95 cherry_log")
    cmds.append("fill -13 115 -97 -9 116 -93 cherry_leaves")
    cmds.append("fill -12 117 -96 -10 117 -94 cherry_leaves")
    cmds.append("setblock -11 115 -95 shroomlight")
    cmds.append("setblock -11 114 -95 lantern[hanging=true]")
    cmds.append("")
    
    # 8. NPC Lão Ngư Tri Kỷ
    cmds.append("# 8. NPC Lão Ngư Tri Kỷ")
    cmds.append("kill @e[type=villager,x=-7,y=109,z=-102,dx=14,dy=8,dz=14]")
    cmds.append('summon villager 0.5 111 -98.5 {CustomName:\'{"text":"❂ Lão Ngư Tri Kỷ ❂","color":"aqua","bold":true}\',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{profession:fisherman,type:taiga,level:5},Rotation:[0f,0f],Offers:{Recipes:[{maxUses:999999,buy:{id:"minecraft:cod",count:16},sell:{id:"minecraft:emerald",count:2}},{maxUses:999999,buy:{id:"minecraft:salmon",count:16},sell:{id:"minecraft:emerald",count:2}},{maxUses:999999,buy:{id:"minecraft:tropical_fish",count:8},sell:{id:"minecraft:emerald",count:3}},{maxUses:999999,buy:{id:"minecraft:pufferfish",count:4},sell:{id:"minecraft:emerald",count:3}},{maxUses:999999,buy:{id:"minecraft:emerald",count:3},sell:{id:"minecraft:fishing_rod",count:1}},{maxUses:999999,buy:{id:"minecraft:emerald",count:8},sell:{id:"minecraft:water_bucket",count:1,components:{"minecraft:custom_name":\'{"text":"🌊 Xô Nước Phước Lành Đại Dương 🌊","color":"aqua","bold":true}\',"minecraft:lore":[\'{"text":"Nguồn nước tinh khiết của Thần Biển ban tặng!","color":"blue","italic":true}\',\'{"text":"✦ Dùng để tạo nguồn nước vô hạn & tưới tiêu!","color":"green"}\']}}},{maxUses:999999,buy:{id:"minecraft:emerald",count:15},sell:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:luck_of_the_sea":3,"minecraft:lure":3,"minecraft:unbreaking":3}},"minecraft:custom_name":\'{"text":"★ Cần Câu Thần Kỳ May Mắn ★","color":"gold","bold":true}\'}}},{maxUses:999999,buy:{id:"minecraft:emerald",count:20},sell:{id:"minecraft:nautilus_shell",count:1}},{maxUses:999999,buy:{id:"minecraft:emerald",count:50},sell:{id:"minecraft:heart_of_the_sea",count:1}}]}}')
    cmds.append("")
    
    # 9. Biển báo hướng dẫn
    cmds.append("# 9. Biển Hướng Dẫn Thư Giãn")
    cmds.append('setblock -1 112 -75 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"🎣 THỦY TẠ HỒ SEN 🎣","color":"aqua","bold":true}\',\'{"text":"Hồ Câu Cá Thư Giãn","color":"green"}\',\'{"text":"Đổi cá lấy Ngọc Lục Bảo","color":"yellow"}\',\'{"text":"Gặp Lão Ngư trong đình!","color":"gold"}\']}}')
    cmds.append('setblock 1 112 -75 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ KHO BÁU CHÌM ]","color":"gold","bold":true}\',\'{"text":"Càng câu lâu càng may mắn","color":"yellow"}\',\'{"text":"Sách phép & Vật phẩm quý","color":"aqua"}\',\'{"text":"Tỉ lệ câu quà cực cao!","color":"green"}\']}}')
    cmds.append("")
    
    return "\n".join(cmds)


def build_boss_multi():
    cmds = []
    cmds.append("# ==============================================================================")
    cmds.append("# HỆ THỐNG ĐẠI ĐIỆN 4 PHÂN KHU BOSS NỐI CẦU XÍCH PARABOL KHỔNG LỒ (/WARP BOSS)")
    cmds.append("# Tọa độ: Z: 50..134, X: -48..48, Y=96..132 (Phía Nam Spawn)")
    cmds.append("# Phong cách: Dark Fantasy Void Realm - Cầu Xích Võng Tự Nhiên, Đền Gothic Đá Đen")
    cmds.append("# ==============================================================================")
    cmds.append("")
    
    # 1. Clear airspace
    cmds.append("# 1. Dọn dẹp không gian bầu trời")
    cmds.append("fill -16 96 73 16 132 89 air")
    cmds.append("fill -46 96 73 -17 132 97 air")
    cmds.append("fill 17 96 73 46 132 97 air")
    cmds.append("fill -20 96 98 20 132 134 air")
    cmds.append("fill -48 96 98 -21 132 134 air")
    cmds.append("")
    
    # 2. Xích sắt nối Cánh Nam Hub sang Sảnh Boss
    cmds.append("# 2. Lối vào từ Cánh Nam Hub")
    cmds.append("fill -1 120 71 1 120 73 chain[axis=z]")
    cmds.append("")
    
    # 3. SẢNH ĐỀN BOSS TRUNG TÂM (GOTHIC BOSS NEXUS: Z: 74..88, X: -15..15, Y=110)
    cmds.append("# 3. Sảnh Đền Boss Trung Tâm (Gothic Nexus)")
    # Đáy nhọn rủ xuống Hư Không
    cmds.append("setblock 0 96 81 crying_obsidian")
    cmds.append("fill -1 97 80 1 97 82 gilded_blackstone")
    cmds.append("fill -3 98 78 3 98 84 cobbled_deepslate")
    cmds.append("fill -6 100 76 6 100 86 cobbled_deepslate")
    cmds.append("fill -10 103 74 10 103 88 polished_blackstone")
    cmds.append("fill -14 106 74 14 107 88 polished_blackstone")
    cmds.append("fill -14 108 74 14 109 88 polished_blackstone_bricks")
    # Mặt sàn chính Y=110
    cmds.append("fill -14 110 74 14 110 88 polished_blackstone_bricks")
    cmds.append("fill -12 110 76 12 110 86 chiseled_polished_blackstone")
    cmds.append("fill -8 110 78 8 110 84 gilded_blackstone")
    cmds.append("fill -4 110 80 4 110 82 crying_obsidian")
    cmds.append("setblock 0 110 81 lodestone")
    # 4 Trụ Tháp Xích Vươn Cao (Y=111..122) để néo các sợi xích khổng lồ
    cmds.append("fill -14 111 74 -14 120 74 gilded_blackstone")
    cmds.append("fill 14 111 74 14 120 74 gilded_blackstone")
    cmds.append("fill -14 111 88 -14 120 88 gilded_blackstone")
    cmds.append("fill 14 111 88 14 120 88 gilded_blackstone")
    cmds.append("setblock -14 121 74 gold_block")
    cmds.append("setblock 14 121 74 gold_block")
    cmds.append("setblock -14 121 88 gold_block")
    cmds.append("setblock 14 121 88 gold_block")
    cmds.append("setblock -14 122 74 soul_lantern")
    cmds.append("setblock 14 122 74 soul_lantern")
    cmds.append("setblock -14 122 88 soul_lantern")
    cmds.append("setblock 14 122 88 soul_lantern")
    # Tường lan can đá đen
    cmds.append("fill -14 111 74 14 112 74 polished_blackstone_brick_wall")
    cmds.append("fill -14 111 88 14 112 88 polished_blackstone_brick_wall")
    cmds.append("fill -14 111 74 -14 112 88 polished_blackstone_brick_wall")
    cmds.append("fill 14 111 74 14 112 88 polished_blackstone_brick_wall")
    # Cổng mở ra 4 hướng
    cmds.append("fill -2 111 74 2 113 74 air") # Cổng Bắc
    cmds.append("fill -14 111 79 -14 113 83 air") # Cổng Tây
    cmds.append("fill 14 111 79 14 113 83 air") # Cổng Đông
    cmds.append("fill -2 111 88 2 113 88 air") # Cổng Nam
    # Tiện ích
    cmds.append("setblock -3 111 76 ender_chest")
    cmds.append("setblock 3 111 76 ender_chest")
    cmds.append("setblock -3 111 77 crafting_table")
    cmds.append("setblock 3 111 77 anvil")
    # NPC Thợ Săn Boss
    cmds.append("kill @e[type=villager,tag=boss_hunter_npc]")
    cmds.append("kill @e[type=interaction,tag=boss_hunter_interact]")
    cmds.append("kill @e[type=armor_stand,tag=boss_hunter_hologram]")
    cmds.append('summon villager 0.5 111 79.5 {Tags:["boss_hunter_npc"],CustomName:\'{"text":"⚔ THỢ SĂN BOSS ⚔","color":"red","bold":true}\',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{profession:weaponsmith,type:taiga,level:5},Rotation:[180f,0f]}')
    cmds.append('summon interaction 0.5 111 79.5 {Tags:["boss_hunter_interact"],width:1.2f,height:1.9f,response:1b}')
    cmds.append('summon armor_stand 0.5 113.2 79.5 {Tags:["boss_hunter_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:\'{"text":"[ CLICK ĐỂ CHỌN BOSS ]","color":"yellow","bold":true}\'}')
    # Biển chỉ dẫn
    cmds.append('setblock -1 112 75 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"🏛 ĐẠI ĐIỆN BOSS 🏛","color":"gold","bold":true}\',\'{"text":"Sảnh Trung Tâm","color":"yellow"}\',\'{"text":"Gõ /warp boss","color":"green"}\',\'{"text":"Chọn phân khu dưới!","color":"aqua"}\']}}')
    cmds.append('setblock 1 112 75 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ HƯỚNG DẪN ]","color":"dark_red","bold":true}\',\'{"text":"⬅ Tây: Boss 1 & Boss 4","color":"green"}\',\'{"text":"➡ Đông: Boss 2","color":"red"}\',\'{"text":"⬇ Nam: Boss 3 Tuần","color":"gold"}\']}}')
    cmds.append("")
    
    # 4. HỆ THỐNG 4 CẦU XÍCH PARABOL KHỔNG LỒ (Suspended Giant Catenary Chains)
    cmds.append("# 4. Hệ Thống 4 Cầu Xích Parabol Khổng Lồ Võng Giữa Hư Không")
    # Cầu Tây (Boss 1): X từ -14 sang -22
    # Mặt cầu: Sàn đá mạ vàng treo lơ lửng
    cmds.append("fill -22 110 80 -14 110 82 polished_blackstone_brick_slab[type=top]")
    # Cáp xích võng chính ở hai bên cầu (parabolic curve)
    for (cx, cy) in [(-14, 114), (-15, 113), (-16, 112), (-17, 112), (-18, 112), (-19, 112), (-20, 113), (-21, 114), (-22, 115)]:
        cmds.append(f"setblock {cx} {cy} 79 chain[axis=x]")
        cmds.append(f"setblock {cx} {cy} 83 chain[axis=x]")
    # Xích giằng dọc từ dây cáp xuống mặt cầu
    cmds.append("setblock -14 112 79 chain[axis=y]")
    cmds.append("setblock -14 113 79 chain[axis=y]")
    cmds.append("setblock -14 112 83 chain[axis=y]")
    cmds.append("setblock -14 113 83 chain[axis=y]")
    cmds.append("setblock -22 112 79 chain[axis=y]")
    cmds.append("setblock -22 113 79 chain[axis=y]")
    cmds.append("setblock -22 114 79 chain[axis=y]")
    cmds.append("setblock -22 112 83 chain[axis=y]")
    cmds.append("setblock -22 113 83 chain[axis=y]")
    cmds.append("setblock -22 114 83 chain[axis=y]")
    cmds.append("setblock -18 111 81 soul_lantern")
    
    # Cầu Đông (Boss 2): X từ 14 sang 22
    cmds.append("fill 14 110 80 22 110 82 nether_brick_slab[type=top]")
    for (cx, cy) in [(14, 114), (15, 113), (16, 112), (17, 112), (18, 112), (19, 112), (20, 113), (21, 114), (22, 115)]:
        cmds.append(f"setblock {cx} {cy} 79 chain[axis=x]")
        cmds.append(f"setblock {cx} {cy} 83 chain[axis=x]")
    cmds.append("setblock 14 112 79 chain[axis=y]")
    cmds.append("setblock 14 113 79 chain[axis=y]")
    cmds.append("setblock 14 112 83 chain[axis=y]")
    cmds.append("setblock 14 113 83 chain[axis=y]")
    cmds.append("setblock 22 112 79 chain[axis=y]")
    cmds.append("setblock 22 113 79 chain[axis=y]")
    cmds.append("setblock 22 114 79 chain[axis=y]")
    cmds.append("setblock 22 112 83 chain[axis=y]")
    cmds.append("setblock 22 113 83 chain[axis=y]")
    cmds.append("setblock 22 114 83 chain[axis=y]")
    cmds.append("setblock 18 111 81 soul_lantern")
    
    # Cầu Nam (Boss 3): Z từ 88 sang 100
    cmds.append("fill -2 110 89 2 110 99 polished_blackstone_brick_slab[type=top]")
    cmds.append("fill 0 110 89 0 110 99 gilded_blackstone")
    for (cz, cy) in [(89, 115), (90, 114), (91, 113), (92, 113), (93, 112), (94, 112), (95, 112), (96, 113), (97, 113), (98, 114), (99, 115)]:
        cmds.append(f"setblock -3 {cy} {cz} chain[axis=z]")
        cmds.append(f"setblock 3 {cy} {cz} chain[axis=z]")
    cmds.append("setblock -3 113 94 chain[axis=y]")
    cmds.append("setblock 3 113 94 chain[axis=y]")
    cmds.append("setblock -2 111 94 soul_lantern")
    cmds.append("setblock 2 111 94 soul_lantern")
    
    # Cầu Tây Nam (Boss 4): Nhánh tím sang World Boss
    cmds.append("fill -28 110 84 -22 110 86 purpur_slab[type=top]")
    cmds.append("fill -28 110 86 -24 110 100 purpur_slab[type=top]")
    for (cz, cy) in [(86, 115), (88, 114), (90, 113), (92, 112), (94, 112), (96, 113), (98, 114), (100, 115)]:
        cmds.append(f"setblock -29 {cy} {cz} chain[axis=z]")
        cmds.append(f"setblock -23 {cy} {cz} chain[axis=z]")
    cmds.append("setblock -26 112 93 end_rod")
    cmds.append("")
    
    # 5. ĐẠI ĐIỆN 1: ĐỘNG NỮ HOÀNG NHỆN (SPIDER QUEEN'S LAIR - BOSS 1)
    cmds.append("# 5. Đại Điện 1: Động Nữ Hoàng Nhện (Tier 1)")
    # Đáy nhọn
    cmds.append("setblock -29 98 85 crying_obsidian")
    cmds.append("fill -32 100 82 -26 100 88 cobbled_deepslate")
    cmds.append("fill -36 104 78 -22 104 92 deepslate")
    cmds.append("fill -39 108 76 -19 108 94 mossy_cobblestone")
    # Mặt sàn
    cmds.append("fill -40 110 75 -18 110 95 mossy_stone_bricks")
    cmds.append("fill -38 110 77 -20 110 93 mossy_cobblestone")
    cmds.append("fill -34 110 81 -24 110 89 dripstone_block")
    # Tơ nhện chằng chịt
    cmds.append("fill -39 111 76 -37 113 78 cobweb")
    cmds.append("fill -21 111 76 -19 113 78 cobweb")
    cmds.append("fill -39 111 92 -37 113 94 cobweb")
    cmds.append("fill -21 111 92 -19 113 94 cobweb")
    cmds.append("fill -33 111 83 -33 112 87 cobweb")
    cmds.append("fill -25 111 83 -25 112 87 cobweb")
    # Tường rào & cổng (Mở cổng tại Z=79..83 thông với cầu xích)
    cmds.append("fill -40 111 75 -18 114 75 mossy_stone_brick_wall")
    cmds.append("fill -40 111 95 -18 114 95 mossy_stone_brick_wall")
    cmds.append("fill -40 111 75 -40 114 95 mossy_stone_brick_wall")
    cmds.append("fill -18 111 75 -18 114 95 mossy_stone_brick_wall")
    cmds.append("fill -18 111 79 -18 113 83 air")
    # Bệ triệu hồi
    cmds.append("setblock -29 110 85 sculk_catalyst")
    cmds.append("setblock -29 111 85 cobweb")
    # Trụ nút triệu hồi
    cmds.append('setblock -20 111 77 command_block{Command:"function skyblock:summon_boss_1"}')
    cmds.append("setblock -20 112 77 mossy_stone_bricks")
    cmds.append("setblock -20 113 77 stone_button[face=floor,facing=north]")
    cmds.append('setblock -21 112 76 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"🕷 ĐỘNG NỮ HOÀNG 🕷","color":"green","bold":true}\',\'{"text":"Boss Cấp 1 (150 HP)","color":"gold"}\',\'{"text":"Bấm nút trên trụ đá","color":"yellow"}\',\'{"text":"để TRIỆU HỒI BOSS!","color":"red"}\']}}')
    cmds.append('setblock -19 112 76 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ PHẦN THƯỞNG ]","color":"gold","bold":true}\',\'{"text":"Mảnh Quặng Cổ Đại","color":"aqua","bold":true}\',\'{"text":"16 Ngọc Lục Bảo","color":"green"}\',\'{"text":"Tơ Nhện & 500 Exp","color":"yellow"}\']}}')
    # Bệ rút lui về Sảnh Boss
    cmds.append('setblock -19 109 74 command_block{Command:"teleport @p 0.5 111.0 79.0 0.0 0.0"}')
    cmds.append("setblock -19 110 74 polished_blackstone_pressure_plate")
    cmds.append("setblock -19 111 73 mossy_stone_brick_wall")
    cmds.append('setblock -19 112 73 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}\',\'{"text":"Cổng Rút Lui","color":"yellow"}\',\'{"text":"Bước lên đĩa để","color":"aqua"}\',\'{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}\']}}')
    cmds.append("")
    
    # 6. ĐẠI ĐIỆN 2: VỰC LỬA ĐAO PHỦ ĐỊA NGỤC (EXECUTIONER'S PIT - BOSS 2)
    cmds.append("# 6. Đại Điện 2: Vực Lửa Đao Phủ Địa Ngục (Tier 2)")
    # Đáy nhọn
    cmds.append("setblock 29 98 85 crying_obsidian")
    cmds.append("fill 26 100 82 32 100 88 blackstone")
    cmds.append("fill 22 104 78 36 104 92 blackstone")
    cmds.append("fill 19 108 76 39 108 94 nether_bricks")
    # Mặt sàn dung nham rực lửa
    cmds.append("fill 18 110 75 40 110 95 nether_bricks")
    cmds.append("fill 20 110 77 38 110 93 red_nether_bricks")
    cmds.append("fill 24 110 81 34 110 89 magma_block")
    cmds.append("fill 27 110 84 31 110 86 crying_obsidian")
    # 4 Trụ lửa bốc khói
    cmds.append("fill 20 111 77 20 114 77 gilded_blackstone")
    cmds.append("setblock 20 115 77 campfire")
    cmds.append("fill 38 111 77 38 114 77 gilded_blackstone")
    cmds.append("setblock 38 115 77 campfire")
    cmds.append("fill 20 111 93 20 114 93 gilded_blackstone")
    cmds.append("setblock 20 115 93 campfire")
    cmds.append("fill 38 111 93 38 114 93 gilded_blackstone")
    cmds.append("setblock 38 115 93 campfire")
    # Tường rào & cổng (Mở cổng tại Z=79..83 thông với cầu xích)
    cmds.append("fill 18 111 75 40 114 75 nether_brick_wall")
    cmds.append("fill 18 111 95 40 114 95 nether_brick_wall")
    cmds.append("fill 18 111 75 18 114 95 nether_brick_wall")
    cmds.append("fill 40 111 75 40 114 95 nether_brick_wall")
    cmds.append("fill 18 111 79 18 113 83 air")
    # Bệ triệu hồi lửa vĩnh cửu
    cmds.append("setblock 29 110 85 soul_sand")
    cmds.append("setblock 29 111 85 soul_fire")
    # Trụ nút triệu hồi
    cmds.append('setblock 20 111 77 command_block{Command:"function skyblock:summon_boss_2"}')
    cmds.append("setblock 20 112 77 nether_bricks")
    cmds.append("setblock 20 113 77 stone_button[face=floor,facing=north]")
    cmds.append('setblock 19 112 76 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"🔥 VỰC ĐAO PHỦ 🔥","color":"red","bold":true}\',\'{"text":"Boss Cấp 2 (300 HP)","color":"gold"}\',\'{"text":"Bấm nút trên trụ đá","color":"yellow"}\',\'{"text":"để TRIỆU HỒI BOSS!","color":"red"}\']}}')
    cmds.append('setblock 21 112 76 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ PHẦN THƯỞNG ]","color":"gold","bold":true}\',\'{"text":"Tinh Thể Cổ Đại","color":"light_purple","bold":true}\',\'{"text":"Rìu Netherite Lửa","color":"red"}\',\'{"text":"8 Khối Vàng & Exp","color":"yellow"}\']}}')
    # Bệ rút lui về Sảnh Boss
    cmds.append('setblock 18 109 74 command_block{Command:"teleport @p 0.5 111.0 79.0 0.0 0.0"}')
    cmds.append("setblock 18 110 74 polished_blackstone_pressure_plate")
    cmds.append("setblock 18 111 73 nether_brick_wall")
    cmds.append('setblock 18 112 73 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}\',\'{"text":"Cổng Rút Lui","color":"yellow"}\',\'{"text":"Bước lên đĩa để","color":"aqua"}\',\'{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}\']}}')
    cmds.append("")
    
    # 7. ĐẠI ĐIỆN 3: THÀNH TRÌ CHÚA TỂ BÓNG TỐI (DARKNESS CITADEL - BOSS 3)
    cmds.append("# 7. Đại Điện 3: Thành Trì Chúa Tể Bóng Tối (Boss Tuần Tier 3)")
    # Đáy nhọn
    cmds.append("setblock 0 96 115 crying_obsidian")
    cmds.append("fill -3 98 112 3 98 118 gilded_blackstone")
    cmds.append("fill -7 101 108 7 101 122 polished_blackstone")
    cmds.append("fill -12 105 104 12 105 126 polished_blackstone")
    cmds.append("fill -17 108 101 17 108 129 polished_blackstone_bricks")
    # Mặt sân thành trì
    cmds.append("fill -18 110 100 18 110 130 polished_blackstone_bricks")
    cmds.append("fill -15 110 103 15 110 127 red_nether_bricks")
    cmds.append("fill -10 110 108 10 110 122 magma_block")
    cmds.append("fill -5 110 111 5 110 119 crying_obsidian")
    # 4 Trụ lửa thần thoại
    for (tx, tz) in [(-16, 102), (16, 102), (-16, 128), (16, 128)]:
        cmds.append(f"fill {tx} 111 {tz} {tx} 116 {tz} gilded_blackstone")
        cmds.append(f"setblock {tx} 117 {tz} soul_campfire")
    # Tường thành & Cổng vòm
    cmds.append("fill -18 111 100 18 114 100 deepslate_tile_wall")
    cmds.append("fill -18 111 130 18 114 130 deepslate_tile_wall")
    cmds.append("fill -18 111 100 -18 114 130 deepslate_tile_wall")
    cmds.append("fill 18 111 100 18 114 130 deepslate_tile_wall")
    cmds.append("fill -2 111 100 2 114 100 air")
    cmds.append("fill -3 111 100 -3 115 100 gilded_blackstone")
    cmds.append("fill 3 111 100 3 115 100 gilded_blackstone")
    # Bệ tế lễ triệu hồi Trái Tim Quỷ
    cmds.append("fill -2 110 113 2 110 117 crying_obsidian")
    cmds.append("setblock 0 110 115 soul_sand")
    cmds.append("setblock 0 111 115 soul_fire")
    # Trụ nút triệu hồi
    cmds.append('setblock 0 111 103 command_block{Command:"function skyblock:summon_boss_3"}')
    cmds.append("setblock 0 112 103 gilded_blackstone")
    cmds.append("setblock 0 113 103 stone_button[face=floor,facing=north]")
    cmds.append('setblock -1 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"🏰 CHÚA TỂ BÓNG TỐI 🏰","color":"dark_red","bold":true}\',\'{"text":"Boss Tuần (600 HP)","color":"gold"}\',\'{"text":"Bấm nút trên trụ đá","color":"yellow"}\',\'{"text":"để TRIỆU HỒI BOSS!","color":"red"}\']}}')
    cmds.append('setblock 1 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ RƠI 100% CỰC HIẾM ]","color":"gold","bold":true}\',\'{"text":"☠ Trái Tim Của Quỷ ☠","color":"dark_red","bold":true}\',\'{"text":"Đột phá bắt buộc Tier 10!","color":"red"}\',\'{"text":"Kiếm Netherite + Totem","color":"green"}\']}}')
    # Bệ rút lui về Sảnh Boss
    cmds.append('setblock 2 109 101 command_block{Command:"teleport @p 0.5 111.0 79.0 0.0 0.0"}')
    cmds.append("setblock 2 110 101 polished_blackstone_pressure_plate")
    cmds.append("setblock 2 111 100 deepslate_tile_wall")
    cmds.append('setblock 2 112 100 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}\',\'{"text":"Cổng Rút Lui","color":"yellow"}\',\'{"text":"Bước lên đĩa để","color":"aqua"}\',\'{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}\']}}')
    cmds.append("")
    
    # 8. ĐẠI ĐIỆN 4: THÁNH ĐỊA HƯ KHÔNG (VOID SANCTUARY - WORLD BOSS 4)
    cmds.append("# 8. Đại Điện 4: Thánh Địa Hư Không (World Boss Tier 4)")
    # Đáy nhọn
    cmds.append("setblock -35 98 115 crying_obsidian")
    cmds.append("fill -38 100 112 -32 100 118 end_stone_bricks")
    cmds.append("fill -41 104 107 -29 104 123 end_stone_bricks")
    cmds.append("fill -44 108 101 -26 108 129 purpur_block")
    # Mặt sàn
    cmds.append("fill -45 110 100 -25 110 130 purpur_block")
    cmds.append("fill -43 110 102 -27 110 128 end_stone_bricks")
    cmds.append("fill -40 110 106 -30 110 124 crying_obsidian")
    cmds.append("fill -38 110 109 -32 110 121 amethyst_block")
    # 4 Trụ Năng Lượng Hư Không
    for (vx, vz) in [(-43, 102), (-27, 102), (-43, 128), (-27, 128)]:
        cmds.append(f"fill {vx} 111 {vz} {vx} 117 {vz} purpur_pillar")
        cmds.append(f"setblock {vx} 118 {vz} end_rod")
    # Tường bao kính tím & cổng
    cmds.append("fill -45 111 100 -25 114 100 tinted_glass")
    cmds.append("fill -45 111 130 -25 114 130 tinted_glass")
    cmds.append("fill -45 111 100 -45 114 130 tinted_glass")
    cmds.append("fill -25 111 100 -25 114 130 tinted_glass")
    cmds.append("fill -25 111 101 -25 113 104 air")
    # Bệ triệu hồi
    cmds.append("fill -37 110 113 -33 110 117 crying_obsidian")
    cmds.append("setblock -35 110 115 amethyst_block")
    cmds.append("setblock -35 111 115 end_rod")
    # Trụ nút triệu hồi
    cmds.append('setblock -27 111 103 command_block{Command:"function skyblock:summon_boss_4"}')
    cmds.append("setblock -27 112 103 purpur_pillar")
    cmds.append("setblock -27 113 103 stone_button[face=floor,facing=north]")
    cmds.append('setblock -28 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"🌀 THÁNH ĐỊA HƯ KHÔNG 🌀","color":"dark_purple","bold":true}\',\'{"text":"World Boss (1200 HP)","color":"light_purple"}\',\'{"text":"Bấm nút trên trụ đá","color":"yellow"}\',\'{"text":"để TRIỆU HỒI BOSS!","color":"red"}\']}}')
    cmds.append('setblock -26 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ RƠI 100% TỐI THƯỢNG ]","color":"gold","bold":true}\',\'{"text":"🌀 Lõi Hư Không 🌀","color":"dark_purple","bold":true}\',\'{"text":"Đột phá bắt buộc Tier 13!","color":"light_purple"}\',\'{"text":"Sao Nether & 64 Ngọc","color":"aqua"}\']}}')
    # Bệ rút lui về Sảnh Boss
    cmds.append('setblock -26 109 101 command_block{Command:"teleport @p 0.5 111.0 79.0 0.0 0.0"}')
    cmds.append("setblock -26 110 101 polished_blackstone_pressure_plate")
    cmds.append("setblock -26 111 100 purpur_pillar")
    cmds.append('setblock -26 112 100 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}\',\'{"text":"Cổng Rút Lui","color":"yellow"}\',\'{"text":"Bước lên đĩa để","color":"aqua"}\',\'{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}\']}}')
    cmds.append("")
    
    # 9. Thông báo hoàn tất
    cmds.append("# 9. Thông báo hoàn tất")
    cmds.append('tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"Đã khởi tạo thành công ĐẠI ĐIỆN 4 PHÂN KHU BOSS BIỆT LẬP NỐI CẦU XÍCH PARABOL!","color":"green"}]')
    cmds.append("")
    
    return "\n".join(cmds)


if __name__ == '__main__':
    farm_code = build_farm()
    fishing_code = build_fishing()
    boss_code = build_boss_multi()

    farm_path = os.path.join(FUNCTION_DIR, 'build_farm.mcfunction')
    fishing_path = os.path.join(FUNCTION_DIR, 'build_fishing.mcfunction')
    boss_path = os.path.join(FUNCTION_DIR, 'build_boss_multi.mcfunction')

    with open(farm_path, 'w', encoding='utf-8') as f:
        f.write(farm_code)
    print(f"Generated {farm_path} ({len(farm_code.splitlines())} lines)")

    with open(fishing_path, 'w', encoding='utf-8') as f:
        f.write(fishing_code)
    print(f"Generated {fishing_path} ({len(fishing_code.splitlines())} lines)")

    with open(boss_path, 'w', encoding='utf-8') as f:
        f.write(boss_code)
    print(f"Generated {boss_path} ({len(boss_code.splitlines())} lines)")
