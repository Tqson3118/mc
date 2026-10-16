import run_rcon

tests = [
    'minecraft:give @p spawner[block_entity_data={id:"minecraft:mob_spawner",SpawnData:{entity:{id:"minecraft:zombie"}}}] 1',
    'minecraft:give @p spawner[block_entity_data={id:"mob_spawner",SpawnData:{entity:{id:"minecraft:zombie"}}}] 1',
    'minecraft:give @p spawner[block_entity_data={SpawnData:{entity:{id:"minecraft:zombie"}}}] 1',
    'minecraft:give @p spawner[block_entity_data={SpawnData:{entity:{id:"minecraft:zombie"}},SpawnPotentials:[{data:{entity:{id:"minecraft:zombie"}},weight:1}]}] 1'
]

for t in tests:
    res = run_rcon.rcon_cmd(t)
    print(f"TEST: {t}\nRESULT: {repr(res)}\n")
