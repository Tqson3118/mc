# ==============================================================================
# NÂNG CẤP ĐẤU TRƯỜNG BOSS — UPGRADE BOSS ARENA
# Dựa vào tọa độ thực từ build_boss_multi.mcfunction:
#   Arena 1 (Động Nhện): X=-40..-18, Z=75..95, Y=110 — tâm X=-29, Z=85
#   Arena 2 (Vực Lửa):  X=18..40,   Z=75..95, Y=110 — tâm X=29, Z=85
# Chỉ THÊM (replace air) — không phá block cũ
# ==============================================================================

tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"Đang nâng cấp Đấu Trường Boss...","color":"dark_red"}]

# ==============================================================================
# ARENA 1: ĐỘNG NỮ HOÀNG NHỆN (X=-40..-18, Z=75..95, Y=110)
# Tường bao cao 6 block deepslate_bricks xung quanh arena
# ==============================================================================

# Tường Bắc (Z=75), cao 6 block (Y=111..116)
fill -40 111 75 -18 116 75 deepslate_bricks replace air
# Tường Nam (Z=95)
fill -40 111 95 -18 116 95 deepslate_bricks replace air
# Tường Tây (X=-40)
fill -40 111 75 -40 116 95 deepslate_bricks replace air
# Tường Đông (X=-18)
fill -18 111 75 -18 116 95 deepslate_bricks replace air

# Merlons: deepslate_brick_wall trên đỉnh tường (Y=117)
fill -40 117 75 -18 117 75 deepslate_brick_wall replace air
fill -40 117 95 -18 117 95 deepslate_brick_wall replace air
fill -40 117 75 -40 117 95 deepslate_brick_wall replace air
fill -18 117 75 -18 117 95 deepslate_brick_wall replace air

# Merlons xen kẽ trên mặt tường (mỗi 2 block)
fill -38 117 75 -22 117 75 deepslate_brick_wall replace air
fill -38 117 95 -22 117 95 deepslate_brick_wall replace air
fill -40 117 77 -40 117 93 deepslate_brick_wall replace air
fill -18 117 77 -18 117 93 deepslate_brick_wall replace air

# 4 cột polished_blackstone_bricks cao 8 block tại 4 góc
fill -40 111 75 -40 118 75 polished_blackstone_bricks replace air
fill -18 111 75 -18 118 75 polished_blackstone_bricks replace air
fill -40 111 95 -40 118 95 polished_blackstone_bricks replace air
fill -18 111 95 -18 118 95 polished_blackstone_bricks replace air

# Mở cổng vào phía Đông (X=-18, Z=74..76): đảm bảo lối đi còn thông
fill -18 111 74 -18 113 76 air

# Sàn cracked_deepslate_bricks cho Arena 1
fill -40 110 75 -18 110 95 cracked_deepslate_bricks replace air

# Hình chữ thập polished_deepslate tại tâm tâm X=-29, Z=85 (rune)
fill -29 110 80 -29 110 90 polished_deepslate replace air
fill -34 110 85 -24 110 85 polished_deepslate replace air

# Lodestone tại điểm giao chữ thập (tâm X=-29, Z=85)
setblock -29 110 85 lodestone replace

# Soul_torch 2 bên cổng vào (X=-18, Z=77 và Z=73)
setblock -18 111 77 soul_torch replace
setblock -18 111 73 soul_torch replace

# Armor_stand tag=boss_arena_core_1 tại tâm arena 1 (X=-29, Y=111, Z=85)
kill @e[type=armor_stand,tag=boss_arena_core_1,x=-31,y=108,z=82,dx=5,dy=6,dz=6]
summon armor_stand -29.5 111.0 85.5 {Tags:["boss_arena_core_1"],Invisible:1b,NoGravity:1b,Invulnerable:1b,Marker:1b}

# ==============================================================================
# ARENA 2: VỰC LỬA ĐAO PHỦ (X=18..40, Z=75..95, Y=110)
# ==============================================================================

# Tường Bắc (Z=75)
fill 18 111 75 40 116 75 deepslate_bricks replace air
# Tường Nam (Z=95)
fill 18 111 95 40 116 95 deepslate_bricks replace air
# Tường Tây (X=18)
fill 18 111 75 18 116 95 deepslate_bricks replace air
# Tường Đông (X=40)
fill 40 111 75 40 116 95 deepslate_bricks replace air

# Merlons: deepslate_brick_wall trên đỉnh tường (Y=117)
fill 18 117 75 40 117 75 deepslate_brick_wall replace air
fill 18 117 95 40 117 95 deepslate_brick_wall replace air
fill 18 117 75 18 117 95 deepslate_brick_wall replace air
fill 40 117 75 40 117 95 deepslate_brick_wall replace air

# 4 cột polished_blackstone_bricks cao 8 block tại 4 góc
fill 18 111 75 18 118 75 polished_blackstone_bricks replace air
fill 40 111 75 40 118 75 polished_blackstone_bricks replace air
fill 18 111 95 18 118 95 polished_blackstone_bricks replace air
fill 40 111 95 40 118 95 polished_blackstone_bricks replace air

# Mở cổng vào phía Tây (X=18, Z=74..76)
fill 18 111 74 18 113 76 air

# Sàn cracked_deepslate_bricks cho Arena 2
fill 18 110 75 40 110 95 cracked_deepslate_bricks replace air

# Hình chữ thập polished_deepslate tại tâm X=29, Z=85
fill 29 110 80 29 110 90 polished_deepslate replace air
fill 24 110 85 34 110 85 polished_deepslate replace air

# Lodestone tại điểm giao chữ thập (tâm X=29, Z=85)
setblock 29 110 85 lodestone replace

# Soul_torch 2 bên cổng vào Arena 2 (X=18)
setblock 18 111 77 soul_torch replace
setblock 18 111 73 soul_torch replace

# Armor_stand tag=boss_arena_core_2 tại tâm arena 2 (X=29, Y=111, Z=85)
kill @e[type=armor_stand,tag=boss_arena_core_2,x=26,y=108,z=82,dx=6,dy=6,dz=6]
summon armor_stand 29.5 111.0 85.5 {Tags:["boss_arena_core_2"],Invisible:1b,NoGravity:1b,Invulnerable:1b,Marker:1b}

tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"☠ Đấu Trường Boss đã được nâng cấp với tường deepslate, merlons, cột chiến đấu và lodestone rune! ☠","color":"dark_red","bold":true}]
