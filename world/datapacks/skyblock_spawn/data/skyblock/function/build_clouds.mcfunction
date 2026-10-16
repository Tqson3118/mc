# ==============================================================================
# LỚP THẢM MÂY THẦN TIÊN & THÀNH PHỐ THIÊN KHÔNG (SEA OF CLOUDS & SKY REALM)
# Độ cao: Y=76 -> Y=105 | Phạm vi: X=-80..80, Z=-80..80
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. BIỂN MÂY BỒNG BỀNH (VOLUMETRIC SEA OF CLOUDS - Y=76..79)
# ------------------------------------------------------------------------------
# Thảm mây trung tâm dưới chân Spawn (-50..50, -50..50, Y=76)
fill -45 76 -45 45 76 45 white_stained_glass replace air
fill -40 77 -40 40 77 40 white_stained_glass replace air
fill -35 78 -35 35 78 35 snow_block replace white_stained_glass

# Cụm mây dày khối bồng bềnh phía Bắc (-60..60, -75..-35, Y=77..79)
fill -55 77 -70 -20 77 -40 white_stained_glass replace air
fill -15 78 -65 25 78 -45 snow_block replace air
fill 20 77 -70 55 77 -40 white_wool replace air
fill -45 79 -60 -10 79 -45 white_stained_glass replace air

# Cụm mây dày khối bồng bềnh phía Nam (-60..60, 35..75, Y=77..79)
fill -55 77 40 -20 77 70 white_wool replace air
fill -15 78 45 25 78 65 snow_block replace air
fill 20 77 40 55 77 70 white_stained_glass replace air
fill 10 79 45 45 79 60 white_stained_glass replace air

# Cụm mây phía Đông (35..75, -50..50, Y=77..79)
fill 40 77 -45 70 77 45 white_stained_glass replace air
fill 45 78 -35 65 78 35 snow_block replace air
fill 50 79 -20 60 79 20 white_wool replace air

# Cụm mây phía Tây (-75..-35, -50..50, Y=77..79)
fill -70 77 -45 -40 77 45 white_stained_glass replace air
fill -65 78 -35 -45 78 35 snow_block replace air
fill -60 79 -20 -50 79 20 white_wool replace air

# Lớp mây mỏng lướt qua dưới chân các đảo vệ tinh (Y=80)
fill -25 80 -25 25 80 25 tinted_glass replace air
fill -15 81 -15 15 81 15 white_stained_glass replace air

# ------------------------------------------------------------------------------
# 2. CÁC TẢNG ĐÁ & HÒN ĐẢO THIÊN THẠCH LƠ LỬNG (FLOATING SKY ASTEROIDS)
# ------------------------------------------------------------------------------

# --- ĐẢO THIÊN THẠCH 1: TÂY BẮC (X=-32, Y=92, Z=-28) - Cụm Thạch Anh Tím Thần Bí ---
fill -34 91 -30 -30 93 -26 cobbled_deepslate
fill -33 92 -29 -31 94 -27 amethyst_block
setblock -32 95 -28 amethyst_cluster[facing=up]
setblock -32 90 -28 chain[axis=y]
setblock -32 89 -28 chain[axis=y]
setblock -32 88 -28 soul_lantern[hanging=true]
setblock -34 92 -28 weeping_vines[age=10]
setblock -30 92 -28 weeping_vines[age=8]

# --- ĐẢO THIÊN THẠCH 2: ĐÔNG BẮC (X=36, Y=95, Z=-25) - Tàn Tích Cổ Rêu Phong ---
fill 34 94 -27 38 96 -23 mossy_stone_bricks
fill 35 95 -26 37 97 -24 moss_block
setblock 36 98 -25 flowering_azalea
setblock 36 93 -25 chain[axis=y]
setblock 36 92 -25 lantern[hanging=true]
setblock 34 95 -25 glow_lichen
setblock 38 95 -25 glow_lichen

# --- ĐẢO THIÊN THẠCH 3: TÂY NAM (X=-28, Y=89, Z=32) - Khối Lôi Điện Cổ Đại ---
fill -30 88 30 -26 90 34 deepslate_tiles
fill -29 89 31 -27 91 33 gilded_blackstone
setblock -28 92 32 lightning_rod[facing=up]
setblock -28 87 32 chain[axis=y]
setblock -28 86 32 chain[axis=y]
setblock -28 85 32 shroomlight

# --- ĐẢO THIÊN THẠCH 4: ĐÔNG NAM (X=32, Y=91, Z=28) - Tinh Thể Biển Cả Phát Sáng ---
fill 30 90 26 34 92 30 prismarine_bricks
fill 31 91 27 33 93 29 dark_prismarine
setblock 32 94 28 sea_lantern
setblock 32 89 28 chain[axis=y]
setblock 32 88 28 end_rod

# --- ĐẢO THIÊN THẠCH 5: CHÍNH DƯỚI ĐẢO SPAWN (X=0, Y=86, Z=0) - Tháp Tinh Thể Khởi Nguyên ---
fill -2 84 -2 2 87 2 cobbled_deepslate
fill -1 85 -1 1 88 1 crying_obsidian
setblock 0 89 0 beacon
setblock 0 90 0 cyan_stained_glass
setblock 0 83 0 chain[axis=y]
setblock 0 82 0 chain[axis=y]
setblock 0 81 0 soul_campfire

# --- CÁC TẢNG ĐÁ NHỎ & DÂY XÍCH TREO LƠ LỬNG GIAO NHAU ---
setblock -15 97 -15 stone
setblock -15 96 -15 chain[axis=y]
setblock -15 95 -15 lantern[hanging=true]

setblock 18 96 -18 stone
setblock 18 95 -18 chain[axis=y]
setblock 18 94 -18 lantern[hanging=true]

setblock -18 98 18 stone
setblock -18 97 18 chain[axis=y]
setblock -18 96 18 soul_lantern[hanging=true]

setblock 16 97 16 stone
setblock 16 96 16 chain[axis=y]
setblock 16 95 16 soul_lantern[hanging=true]
