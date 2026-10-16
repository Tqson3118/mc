minecraft:scoreboard players set #dungeon_boss_alive sb_boss_alive 0
tellraw @a [{"text":"[Hầm Ngục Rhông] ","color":"gold","bold":true},{"text":"Chiến thắng! Hắc Ám Địa Ngục Vương đã bị tiêu diệt! Người chơi xung quanh nhận Trái Tim Warden, Dị Điểm Vĩnh Hằng & +500 XP!","color":"green"}]
execute at @a[x=0,y=88,z=137,distance=..30] run give @p echo_shard[custom_name='"§3§lTrái Tim Warden"',lore=['"§7Nguyên liệu Đột Phá Vũ Khí Tier 15 Vĩnh Cửu"']] 2
execute at @a[x=0,y=88,z=137,distance=..30] run give @p nether_star[custom_name='"§d§lDị Điểm Vĩnh Hằng"',lore=['"§7Nguyên liệu Đột Phá Vũ Khí Tier 15 [MAX]"']] 1
execute at @a[x=0,y=88,z=137,distance=..30] run xp add @p 500 points
