# ==============================================================================
# THÁP PHÉP THUẬT FANTASY (MAGIC TOWER) — 15 TẦNG
# Vị trí: X=29..41, Z=-41..-29, sàn Y=119 (góc Đông-Bắc Hub, cạnh khu Parkour)
# Tâm: X=35, Z=-35
# Không phá block cũ — dùng replace air hoàn toàn
# ==============================================================================

tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"Đang xây Tháp Phép Thuật Fantasy...","color":"light_purple"}]

# --- 1. NỀN MÓNG 7x7 polished_deepslate (Y=119) ---
fill 29 119 -41 41 119 -29 polished_deepslate replace air

# --- Viền nền: chiseled_deepslate 4 góc và border ---
setblock 29 119 -41 chiseled_deepslate replace
setblock 41 119 -41 chiseled_deepslate replace
setblock 29 119 -29 chiseled_deepslate replace
setblock 41 119 -29 chiseled_deepslate replace
setblock 35 119 -41 chiseled_deepslate replace
setblock 35 119 -29 chiseled_deepslate replace
setblock 29 119 -35 chiseled_deepslate replace
setblock 41 119 -35 chiseled_deepslate replace

# ==============================================================================
# TẦNG 1-2: Thân tháp 7x7 polished_blackstone_bricks (Y=120..121)
# Hollow: chỉ xây tường, không xây bên trong
# ==============================================================================
# Tường Bắc (Z=-41)
fill 29 120 -41 41 121 -41 polished_blackstone_bricks replace air
# Tường Nam (Z=-29)
fill 29 120 -29 41 121 -29 polished_blackstone_bricks replace air
# Tường Tây (X=29)
fill 29 120 -41 29 121 -29 polished_blackstone_bricks replace air
# Tường Đông (X=41)
fill 41 120 -41 41 121 -29 polished_blackstone_bricks replace air

# 4 cột góc chiseled_deepslate (tầng 1-2)
fill 29 120 -41 29 121 -41 chiseled_deepslate replace air
fill 41 120 -41 41 121 -41 chiseled_deepslate replace air
fill 29 120 -29 29 121 -29 chiseled_deepslate replace air
fill 41 120 -29 41 121 -29 chiseled_deepslate replace air

# Cửa vào phía Tây (X=29), Z=-36..-34, cao 2 block
fill 29 120 -36 29 121 -34 air

# Cửa sổ purple_stained_glass_pane tầng 1-2:
# Mặt Bắc (Z=-41): X=33, X=35, X=37
setblock 33 120 -41 purple_stained_glass_pane replace
setblock 35 120 -41 purple_stained_glass_pane replace
setblock 37 120 -41 purple_stained_glass_pane replace
# Mặt Nam (Z=-29)
setblock 33 120 -29 purple_stained_glass_pane replace
setblock 35 120 -29 purple_stained_glass_pane replace
setblock 37 120 -29 purple_stained_glass_pane replace
# Mặt Đông (X=41)
setblock 41 120 -37 purple_stained_glass_pane replace
setblock 41 120 -35 purple_stained_glass_pane replace
setblock 41 120 -33 purple_stained_glass_pane replace

# ==============================================================================
# TẦNG 3-5: Thu nhỏ lần 1 — 5x5, tâm X=35, Z=-35, X=32..38, Z=-38..-32
# polished_blackstone_bricks, Y=122..126
# ==============================================================================
# Sàn chuyển tiếp 7x7 (Y=122)
fill 29 122 -41 41 122 -29 polished_blackstone_bricks replace air

# Tường Bắc
fill 32 123 -38 38 126 -38 polished_blackstone_bricks replace air
# Tường Nam
fill 32 123 -32 38 126 -32 polished_blackstone_bricks replace air
# Tường Tây
fill 32 123 -38 32 126 -32 polished_blackstone_bricks replace air
# Tường Đông
fill 38 123 -38 38 126 -32 polished_blackstone_bricks replace air

# 4 cột góc chiseled_deepslate (tầng 3-5)
fill 32 123 -38 32 126 -38 chiseled_deepslate replace air
fill 38 123 -38 38 126 -38 chiseled_deepslate replace air
fill 32 123 -32 32 126 -32 chiseled_deepslate replace air
fill 38 123 -32 38 126 -32 chiseled_deepslate replace air

# Cửa sổ mỗi mặt (tầng 3-5)
setblock 35 124 -38 purple_stained_glass_pane replace
setblock 35 125 -38 purple_stained_glass_pane replace
setblock 35 124 -32 purple_stained_glass_pane replace
setblock 35 125 -32 purple_stained_glass_pane replace
setblock 32 124 -35 purple_stained_glass_pane replace
setblock 32 125 -35 purple_stained_glass_pane replace
setblock 38 124 -35 purple_stained_glass_pane replace
setblock 38 125 -35 purple_stained_glass_pane replace

# ==============================================================================
# TẦNG 6-10: Thu nhỏ lần 2 — 3x3, tâm X=35, Z=-35, X=34..36, Z=-36..-34
# polished_blackstone_bricks, Y=127..136
# ==============================================================================
# Sàn chuyển tiếp 5x5 (Y=127)
fill 32 127 -38 38 127 -32 polished_blackstone_bricks replace air

# Thân tháp 3x3 hollow (chỉ 4 cột vì tường = cột góc)
fill 34 128 -36 36 136 -36 polished_blackstone_bricks replace air
fill 34 128 -34 36 136 -34 polished_blackstone_bricks replace air
fill 34 128 -36 34 136 -36 polished_blackstone_bricks replace air
fill 36 128 -36 36 136 -36 polished_blackstone_bricks replace air

# 4 cột góc chiseled_deepslate tầng 6-10
fill 34 128 -36 34 136 -36 chiseled_deepslate replace air
fill 36 128 -36 36 136 -36 chiseled_deepslate replace air
fill 34 128 -34 34 136 -34 chiseled_deepslate replace air
fill 36 128 -34 36 136 -34 chiseled_deepslate replace air

# Cửa sổ tầng 6-10 (mỗi 2 block có 1 cửa sổ)
setblock 35 129 -36 purple_stained_glass_pane replace
setblock 35 131 -36 purple_stained_glass_pane replace
setblock 35 133 -36 purple_stained_glass_pane replace
setblock 35 135 -36 purple_stained_glass_pane replace
setblock 35 129 -34 purple_stained_glass_pane replace
setblock 35 131 -34 purple_stained_glass_pane replace
setblock 35 133 -34 purple_stained_glass_pane replace
setblock 35 135 -34 purple_stained_glass_pane replace
setblock 34 130 -35 purple_stained_glass_pane replace
setblock 34 132 -35 purple_stained_glass_pane replace
setblock 34 134 -35 purple_stained_glass_pane replace
setblock 36 130 -35 purple_stained_glass_pane replace
setblock 36 132 -35 purple_stained_glass_pane replace
setblock 36 134 -35 purple_stained_glass_pane replace

# ==============================================================================
# TẦNG 11-15: Chóp tháp thu nhỏ tối đa — 1x1 đỉnh nhọn
# Y=137..141
# ==============================================================================
# Sàn đỉnh tháp 3x3 (Y=137)
fill 34 137 -36 36 137 -34 polished_blackstone_bricks replace air

# Cột trung tâm đỉnh
fill 35 138 -35 35 140 -35 polished_blackstone_bricks replace air

# Trang trí đỉnh: amethyst_cluster + end_rod
setblock 35 141 -35 amethyst_cluster[facing=up] replace
setblock 35 140 -35 end_rod[facing=up] replace

# 4 end_rod xung quanh đỉnh trang trí
setblock 34 138 -36 end_rod[facing=up] replace
setblock 36 138 -36 end_rod[facing=up] replace
setblock 34 138 -34 end_rod[facing=up] replace
setblock 36 138 -34 end_rod[facing=up] replace

# amethyst_cluster 4 góc tầng chuyển tiếp 5x5
setblock 32 128 -38 amethyst_cluster[facing=up] replace
setblock 38 128 -38 amethyst_cluster[facing=up] replace
setblock 32 128 -32 amethyst_cluster[facing=up] replace
setblock 38 128 -32 amethyst_cluster[facing=up] replace

# ==============================================================================
# TRIỆU HỒI ARMOR STAND TAG=magic_tower_beacon TẠI ĐỈNH
# (Để tick.mcfunction tạo hiệu ứng particle)
# ==============================================================================
kill @e[type=armor_stand,tag=magic_tower_beacon,x=33,y=138,z=-37,dx=5,dy=10,dz=5]
summon armor_stand 35.5 142.0 -35.5 {Tags:["magic_tower_beacon"],Invisible:1b,NoGravity:1b,Invulnerable:1b,Marker:1b}

# ==============================================================================
# BIỂN TÊN THÁP
# ==============================================================================
setblock 29 122 -35 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"✦ THÁP PHÉP THUẬT ✦","color":"light_purple","bold":true}','{"text":"Magic Tower","color":"white"}','{"text":"15 Tầng Fantasy","color":"aqua"}','{"text":"Phòng thủ Hub","color":"yellow"}']}} replace

tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"✦ Tháp Phép Thuật Fantasy 15 Tầng đã hoàn thành tại góc Đông-Bắc Hub! ✦","color":"light_purple","bold":true}]
