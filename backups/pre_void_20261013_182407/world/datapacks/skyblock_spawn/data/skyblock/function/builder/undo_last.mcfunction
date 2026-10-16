# ==============================================================================
# SKYBLOCK BUILDER - ĐIỀU PHỐI HOÀN TÁC TỔNG THỂ (/IS UNDO)
# ==============================================================================

execute if entity @s[tag=built_villa] run function skyblock:builder/undo_villa
execute if entity @s[tag=built_castle] run function skyblock:builder/undo_castle
execute if entity @s[tag=built_modern] run function skyblock:builder/undo_modern
execute if entity @s[tag=built_pagoda] run function skyblock:builder/undo_pagoda
execute if entity @s[tag=built_windmill] run function skyblock:builder/undo_windmill
execute if entity @s[tag=built_warehouse] run function skyblock:builder/undo_warehouse
execute if entity @s[tag=built_greenhouse] run function skyblock:builder/undo_greenhouse
execute if entity @s[tag=built_garden] run function skyblock:builder/undo_garden
execute if entity @s[tag=built_enchant] run function skyblock:builder/undo_enchant
execute if entity @s[tag=built_lighthouse] run function skyblock:builder/undo_lighthouse
execute if entity @s[tag=built_nethergate] run function skyblock:builder/undo_nethergate
execute if entity @s[tag=built_bridge] run function skyblock:builder/undo_bridge

execute unless entity @s[tag=built_villa] unless entity @s[tag=built_castle] unless entity @s[tag=built_modern] unless entity @s[tag=built_pagoda] unless entity @s[tag=built_windmill] unless entity @s[tag=built_warehouse] unless entity @s[tag=built_greenhouse] unless entity @s[tag=built_garden] unless entity @s[tag=built_enchant] unless entity @s[tag=built_lighthouse] unless entity @s[tag=built_nethergate] unless entity @s[tag=built_bridge] run tellraw @s [{"text":"[Kiến Trúc Sư] ","color":"red","bold":true},{"text":"Bạn chưa xây công trình nào gần đây, hoặc công trình đã quá thời gian hoàn tác!","color":"yellow"}]
