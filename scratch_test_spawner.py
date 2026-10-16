import run_rcon

cmds = [
    'minecraft:give @a spawner[block_entity_data={SpawnData:{entity:{id:"minecraft:zombie"}}}] 1',
    'minecraft:give @a spawner[block_entity_data={SpawnData:{entity:{id:"minecraft:skeleton"}}}] 1',
    'minecraft:give @a spawner[block_entity_data={SpawnData:{entity:{id:"minecraft:cow"}}}] 1',
]

for cmd in cmds:
    res = run_rcon.rcon_cmd(cmd)
    print(f"CMD: {cmd}\nRESP: {repr(res)}\n")
