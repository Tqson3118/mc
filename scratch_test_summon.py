import sys
sys.path.insert(0, '.')
import skyblock_minions
from skyblock_economy_daemon import rcon

res = rcon.cmd('summon armor_stand 0 125 0 {Small:1b,NoGravity:1b,ShowArms:1b,CustomNameVisible:1b,Tags:["test_stand"]}')
print('Simple summon:', repr(res))

cmd = '''summon armor_stand 0 125 0 {Small:1b,NoGravity:1b,ShowArms:1b,CustomNameVisible:1b,CustomName:'{"text":"MINION ĐÀO [T1]","color":"aqua","bold":true}',HandItems:[{id:"iron_pickaxe",count:1},{}],ArmorItems:[{},{},{},{id:"player_head",count:1,components:{"minecraft:profile":{name:"MHF_Villager"}}}],Tags:["test_minion"]}'''
res2 = rcon.cmd(cmd)
print('Full minion summon:', repr(res2))
rcon.cmd('kill @e[tag=test_stand]')
rcon.cmd('kill @e[tag=test_minion]')
