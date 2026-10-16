# Skyblock Setup Function - Forceload spawn and satellite arenas (-100 to +100)
execute in minecraft:overworld run forceload add -100 -100 100 100
execute in minecraft:world_boss run forceload add -120 -120 120 120
execute in minecraft:world_boss run forceload add -200 -200 -160 -160
execute in minecraft:world_boss run forceload add 160 -200 200 -160
execute in minecraft:world_boss run forceload add -200 160 -160 200
execute in minecraft:world_boss run forceload add 160 160 200 200
execute in minecraft:world_boss run forceload add -20 -320 20 -280
execute in minecraft:world_farm run forceload add -120 -120 120 120
execute in minecraft:world_cauca run forceload add -120 -120 120 120
execute in minecraft:world_parkour run forceload add -120 -120 120 120
execute in minecraft:world_casino run forceload add -120 -120 120 120
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
execute in minecraft:overworld run function skyblock:build_spawn
execute in minecraft:overworld run function skyblock:build_trade
execute in minecraft:overworld run function skyblock:build_evolution_npc
execute in minecraft:overworld run function skyblock:build_pvp
execute in minecraft:overworld run function skyblock:build_farm
execute in minecraft:overworld run function skyblock:build_fishing
execute in minecraft:overworld run function skyblock:build_boss
execute in minecraft:overworld run function skyblock:build_chestshop_guide
execute in minecraft:overworld run function skyblock:build_casino
execute in minecraft:overworld run function skyblock:build_crates
execute in minecraft:overworld run function skyblock:build_parkour
execute in minecraft:overworld run function skyblock:title/setup_teams
execute in minecraft:overworld run function skyblock:cotyphu/setup_scores
execute in minecraft:overworld run function skyblock:build_totem_npc

# Scoreboards cho các hệ thống
scoreboard objectives add nung trigger {"text":"Lệnh Nung Nhanh","color":"gold"}
scoreboard objectives add evolution trigger {"text":"Nhận Đồ Test Tiến Hóa","color":"gold"}
scoreboard objectives add setup trigger {"text":"Cài Đặt Lại Hệ Thống","color":"green"}
scoreboard objectives add huongdan trigger {"text":"Hướng Dẫn Tân Thủ","color":"gold"}
scoreboard objectives add warp_menu trigger {"text":"Menu Dịch Chuyển","color":"gold"}
scoreboard objectives add trade_guide trigger {"text":"Hướng Dẫn Khu Fantasy Forge","color":"gold"}
scoreboard objectives add banexp trigger {"text":"Bán EXP Lấy Tiền","color":"gold"}
scoreboard objectives add bottle trigger {"text":"Đóng Chai Bình EXP","color":"gold"}
scoreboard objectives add fish_caught minecraft.custom:minecraft.fish_caught
scoreboard objectives add boss_status dummy
scoreboard objectives add eco_add dummy
scoreboard objectives add sb_money dummy
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

# Scoreboard cho Hệ Thống Kỹ Năng Boss (Phase 1)
scoreboard objectives add boss_1_timer dummy
scoreboard objectives add boss_2_timer dummy
scoreboard objectives add boss_3_timer dummy
scoreboard objectives add boss_4_timer dummy
scoreboard objectives add boss_5_timer dummy
scoreboard objectives add boss_6_timer dummy
scoreboard objectives add boss_skill_rng dummy
scoreboard objectives add gems_add dummy
scoreboard objectives add sb_gems dummy

# Scoreboard Kỹ Năng AuraSkills Gating
scoreboard objectives add askill_fighting dummy {"text":"Cấp Chiến Đấu","color":"red"}
scoreboard objectives add askill_farming dummy {"text":"Cấp Nông Dân","color":"green"}
scoreboard objectives add askill_fishing dummy {"text":"Cấp Câu Cá","color":"blue"}
scoreboard objectives add askill_agility dummy {"text":"Cấp Nhào Lộn","color":"yellow"}
scoreboard objectives add askill_power dummy {"text":"Tổng Cấp Kỹ Năng","color":"gold"}
scoreboard objectives add totems trigger {"text":"Nhận Bùa Triệu Hồi","color":"light_purple"}

# Scoreboard Hệ Thống Danh Hiệu (Title System)
scoreboard objectives add danhhieu trigger {"text":"Menu Danh Hiệu","color":"gold"}
scoreboard objectives add buy_title trigger {"text":"Mua Danh Hiệu","color":"gold"}
scoreboard objectives add equip_title trigger {"text":"Đeo Danh Hiệu","color":"gold"}
scoreboard objectives add remove_title trigger {"text":"Gỡ Danh Hiệu","color":"gold"}

scoreboard objectives add use_bow minecraft.used:minecraft.bow
