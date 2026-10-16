# Skyblock Setup Function - Forceload spawn and satellite arenas (-100 to +100)
execute in minecraft:overworld run forceload add -100 -100 100 100
gamerule keepInventory true
execute in minecraft:iridiumskyblock run gamerule keepInventory true
execute in minecraft:iridiumskyblock_nether run gamerule keepInventory true
execute in minecraft:iridiumskyblock_the_end run gamerule keepInventory true
gamerule doFireTick false
gamerule mobGriefing false
gamerule fallDamage false
gamerule doDaylightCycle true
gamerule randomTickSpeed 3
execute in minecraft:overworld run gamerule doMobSpawning false
execute in minecraft:iridiumskyblock run gamerule doMobSpawning true
setworldspawn 0 122 0
execute in minecraft:overworld run function skyblock:build_pvp
execute in minecraft:overworld run function skyblock:build_farm
execute in minecraft:overworld run function skyblock:build_fishing
execute in minecraft:overworld run function skyblock:build_boss
execute in minecraft:overworld run function skyblock:build_parkour
execute in minecraft:overworld run function skyblock:build_spawn
execute in minecraft:overworld run function skyblock:build_chestshop_guide
execute in minecraft:overworld run function skyblock:title/setup_teams

# Scoreboards cho các hệ thống
scoreboard objectives add nung trigger {"text":"Lệnh Nung Nhanh","color":"gold"}
scoreboard objectives add evolution trigger {"text":"Nhận Đồ Test Tiến Hóa","color":"gold"}
scoreboard objectives add setup trigger {"text":"Cài Đặt Lại Hệ Thống","color":"green"}
scoreboard objectives add huongdan trigger {"text":"Hướng Dẫn Tân Thủ","color":"gold"}
scoreboard objectives add warp_menu trigger {"text":"Menu Dịch Chuyển","color":"gold"}
scoreboard objectives add banexp trigger {"text":"Bán EXP Lấy Tiền","color":"gold"}
scoreboard objectives add bottle trigger {"text":"Đóng Chai Bình EXP","color":"gold"}
scoreboard objectives add fish_caught minecraft.custom:minecraft.fish_caught
scoreboard objectives add boss_status dummy
scoreboard objectives add eco_add dummy
scoreboard objectives add jackpot dummy
scoreboard objectives add temp dummy
scoreboard objectives add smelted dummy

# Scoreboard cho Hệ Thống Tiến Hóa Trang Bị Cổ Đại
scoreboard objectives add use_n_pick minecraft.used:minecraft.netherite_pickaxe
scoreboard objectives add use_d_pick minecraft.used:minecraft.diamond_pickaxe
scoreboard objectives add use_n_axe minecraft.used:minecraft.netherite_axe
scoreboard objectives add use_d_axe minecraft.used:minecraft.diamond_axe
scoreboard objectives add dealt_dmg minecraft.custom:minecraft.damage_dealt

tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"Spawn, Trade, Thần Rèn Cổ Đại, PvP, Farm, Câu Cá, Boss, Casino, Crates & Parkour đã sẵn sàng!","color":"green"}]
