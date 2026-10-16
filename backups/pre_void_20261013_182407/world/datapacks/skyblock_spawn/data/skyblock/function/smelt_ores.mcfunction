# ==============================================================
# HỆ THỐNG LỆNH NUNG NHANH QUẶNG THÔ (/nung, /smelt)
# ==============================================================

# 1. Reset điểm trigger
scoreboard players set @s nung 0

# 2. Khởi tạo và kiểm tra xem người chơi có quặng thô không
scoreboard players set @s smelted 0

execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 1.. run scoreboard players set @s smelted 1

execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 1.. run scoreboard players set @s smelted 1

execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 1.. run scoreboard players set @s smelted 1

# Thông báo nếu không có bất kỳ quặng thô nào
tellraw @s[scores={smelted=0}] [{"text":"[LÒ LUYỆN KIM] ","color":"gold","bold":true},{"text":"✖ Bạn không có quặng thô nào trong túi (Sắt, Vàng, Đồng) để nung!","color":"red"}]

# ==============================================================
# NUNG RAW IRON -> IRON INGOT
# ==============================================================
# Các mốc lớn (64)
execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_iron 64
execute if score @s temp matches 64.. run give @s minecraft:iron_ingot 64
execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_iron 64
execute if score @s temp matches 64.. run give @s minecraft:iron_ingot 64
execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_iron 64
execute if score @s temp matches 64.. run give @s minecraft:iron_ingot 64
execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_iron 64
execute if score @s temp matches 64.. run give @s minecraft:iron_ingot 64
execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_iron 64
execute if score @s temp matches 64.. run give @s minecraft:iron_ingot 64
execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_iron 64
execute if score @s temp matches 64.. run give @s minecraft:iron_ingot 64
execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_iron 64
execute if score @s temp matches 64.. run give @s minecraft:iron_ingot 64
execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_iron 64
execute if score @s temp matches 64.. run give @s minecraft:iron_ingot 64
execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_iron 64
execute if score @s temp matches 64.. run give @s minecraft:iron_ingot 64
execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_iron 64
execute if score @s temp matches 64.. run give @s minecraft:iron_ingot 64
execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_iron 64
execute if score @s temp matches 64.. run give @s minecraft:iron_ingot 64
execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_iron 64
execute if score @s temp matches 64.. run give @s minecraft:iron_ingot 64

# Các mốc nhị phân nhỏ (32, 16, 8, 4, 2, 1)
execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 32.. run clear @s minecraft:raw_iron 32
execute if score @s temp matches 32.. run give @s minecraft:iron_ingot 32

execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 16.. run clear @s minecraft:raw_iron 16
execute if score @s temp matches 16.. run give @s minecraft:iron_ingot 16

execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 8.. run clear @s minecraft:raw_iron 8
execute if score @s temp matches 8.. run give @s minecraft:iron_ingot 8

execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 4.. run clear @s minecraft:raw_iron 4
execute if score @s temp matches 4.. run give @s minecraft:iron_ingot 4

execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 2.. run clear @s minecraft:raw_iron 2
execute if score @s temp matches 2.. run give @s minecraft:iron_ingot 2

execute store result score @s temp run clear @s minecraft:raw_iron 0
execute if score @s temp matches 1.. run clear @s minecraft:raw_iron 1
execute if score @s temp matches 1.. run give @s minecraft:iron_ingot 1

# ==============================================================
# NUNG RAW GOLD -> GOLD INGOT
# ==============================================================
# Các mốc lớn (64)
execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_gold 64
execute if score @s temp matches 64.. run give @s minecraft:gold_ingot 64
execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_gold 64
execute if score @s temp matches 64.. run give @s minecraft:gold_ingot 64
execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_gold 64
execute if score @s temp matches 64.. run give @s minecraft:gold_ingot 64
execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_gold 64
execute if score @s temp matches 64.. run give @s minecraft:gold_ingot 64
execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_gold 64
execute if score @s temp matches 64.. run give @s minecraft:gold_ingot 64
execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_gold 64
execute if score @s temp matches 64.. run give @s minecraft:gold_ingot 64
execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_gold 64
execute if score @s temp matches 64.. run give @s minecraft:gold_ingot 64
execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_gold 64
execute if score @s temp matches 64.. run give @s minecraft:gold_ingot 64
execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_gold 64
execute if score @s temp matches 64.. run give @s minecraft:gold_ingot 64
execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_gold 64
execute if score @s temp matches 64.. run give @s minecraft:gold_ingot 64
execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_gold 64
execute if score @s temp matches 64.. run give @s minecraft:gold_ingot 64
execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_gold 64
execute if score @s temp matches 64.. run give @s minecraft:gold_ingot 64

# Các mốc nhị phân nhỏ (32, 16, 8, 4, 2, 1)
execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 32.. run clear @s minecraft:raw_gold 32
execute if score @s temp matches 32.. run give @s minecraft:gold_ingot 32

execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 16.. run clear @s minecraft:raw_gold 16
execute if score @s temp matches 16.. run give @s minecraft:gold_ingot 16

execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 8.. run clear @s minecraft:raw_gold 8
execute if score @s temp matches 8.. run give @s minecraft:gold_ingot 8

execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 4.. run clear @s minecraft:raw_gold 4
execute if score @s temp matches 4.. run give @s minecraft:gold_ingot 4

execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 2.. run clear @s minecraft:raw_gold 2
execute if score @s temp matches 2.. run give @s minecraft:gold_ingot 2

execute store result score @s temp run clear @s minecraft:raw_gold 0
execute if score @s temp matches 1.. run clear @s minecraft:raw_gold 1
execute if score @s temp matches 1.. run give @s minecraft:gold_ingot 1

# ==============================================================
# NUNG RAW COPPER -> COPPER INGOT
# ==============================================================
# Các mốc lớn (64)
execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_copper 64
execute if score @s temp matches 64.. run give @s minecraft:copper_ingot 64
execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_copper 64
execute if score @s temp matches 64.. run give @s minecraft:copper_ingot 64
execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_copper 64
execute if score @s temp matches 64.. run give @s minecraft:copper_ingot 64
execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_copper 64
execute if score @s temp matches 64.. run give @s minecraft:copper_ingot 64
execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_copper 64
execute if score @s temp matches 64.. run give @s minecraft:copper_ingot 64
execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_copper 64
execute if score @s temp matches 64.. run give @s minecraft:copper_ingot 64
execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_copper 64
execute if score @s temp matches 64.. run give @s minecraft:copper_ingot 64
execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_copper 64
execute if score @s temp matches 64.. run give @s minecraft:copper_ingot 64
execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_copper 64
execute if score @s temp matches 64.. run give @s minecraft:copper_ingot 64
execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_copper 64
execute if score @s temp matches 64.. run give @s minecraft:copper_ingot 64
execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_copper 64
execute if score @s temp matches 64.. run give @s minecraft:copper_ingot 64
execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 64.. run clear @s minecraft:raw_copper 64
execute if score @s temp matches 64.. run give @s minecraft:copper_ingot 64

# Các mốc nhị phân nhỏ (32, 16, 8, 4, 2, 1)
execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 32.. run clear @s minecraft:raw_copper 32
execute if score @s temp matches 32.. run give @s minecraft:copper_ingot 32

execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 16.. run clear @s minecraft:raw_copper 16
execute if score @s temp matches 16.. run give @s minecraft:copper_ingot 16

execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 8.. run clear @s minecraft:raw_copper 8
execute if score @s temp matches 8.. run give @s minecraft:copper_ingot 8

execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 4.. run clear @s minecraft:raw_copper 4
execute if score @s temp matches 4.. run give @s minecraft:copper_ingot 4

execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 2.. run clear @s minecraft:raw_copper 2
execute if score @s temp matches 2.. run give @s minecraft:copper_ingot 2

execute store result score @s temp run clear @s minecraft:raw_copper 0
execute if score @s temp matches 1.. run clear @s minecraft:raw_copper 1
execute if score @s temp matches 1.. run give @s minecraft:copper_ingot 1

# ==============================================================
# 3. HIỆU ỨNG ÂM THANH & HẠT LỬA
# ==============================================================
execute if score @s smelted matches 1 run playsound minecraft:block.fire.extinguish player @s ~ ~ ~ 1 1
execute if score @s smelted matches 1 run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1.2
execute if score @s smelted matches 1 run particle minecraft:flame ~ ~1 ~ 0.3 0.3 0.3 0.05 25

# ==============================================================
# 4. THÔNG BÁO HOÀN TẤT
# ==============================================================
execute if score @s smelted matches 1 run tellraw @s [{"text":"[LÒ LUYỆN KIM] ","color":"gold","bold":true},{"text":"✔ Đã nung toàn bộ quặng thô trong túi thành thỏi thành công!","color":"green"}]
