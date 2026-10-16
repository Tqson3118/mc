# ==============================================================================
# TUONG TAC TRUC TIEP MINION (PHASE 1 V2.0)
# ==============================================================================
playsound minecraft:block.chest.open player @s ~ ~ ~ 1.0 1.2
tellraw @s [{"text":"⟨Skyblock⟩ ","color":"gold","bold":true},{"text":"🤖 ","color":"yellow"},{"text":"[BẢNG ĐIỀU KHIỂN MINION - BẤM ĐỂ MỞ]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/dm open minion_control"},"hoverEvent":{"action":"show_text","contents":"Nhấp chuột để mở giao diện quản lý Minion"}},{"text":" (hoặc gõ ","color":"gray"},{"text":"/is minion","color":"aqua","clickEvent":{"action":"run_command","value":"/is minion"}},{"text":")","color":"gray"}]
