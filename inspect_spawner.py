import run_rcon

merge_cmd = 'execute in minecraft:overworld run data merge block 0 130 0 {SpawnData:{entity:{id:"minecraft:zombie"}}}'
res = run_rcon.rcon_cmd(merge_cmd)
print("Merge res:", repr(res))

res_data = run_rcon.rcon_cmd('execute in minecraft:overworld run data get block 0 130 0 SpawnData')
print("SpawnData after merge:", repr(res_data))
