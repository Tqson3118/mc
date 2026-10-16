import run_rcon
import time

# Set Tester_Bot at peak (0, 232, 2)
# Check inventory / tags before
print('Before test:')
# Set a redstone block next to 0 231 3 to activate the command block
run_rcon.rcon_cmd('execute in minecraft:world_parkour run setblock 0 231 4 redstone_block')
time.sleep(1)
run_rcon.rcon_cmd('execute in minecraft:world_parkour run setblock 0 231 4 air')
out = run_rcon.rcon_cmd('execute in minecraft:world_parkour run data get block 0 231 3 LastOutput')
print('Command block LastOutput:', out)
