const mineflayer = require('mineflayer');
const { execSync } = require('child_process');
const path = require('path');

const SERVER_DIR = path.resolve(__dirname, '..', '..');

function runRcon(cmd) {
    return execSync(`python run_rcon.py "${cmd.replace(/"/g, '\\"')}"`, {
        cwd: SERVER_DIR,
        encoding: 'utf-8',
        timeout: 10000
    }).trim();
}

console.log("Preparing test place spawner...");
// Set up a platform for bot to place spawner
runRcon('execute in minecraft:overworld run setblock 5 125 5 stone');
runRcon('execute in minecraft:overworld run setblock 5 126 5 air');
runRcon('execute in minecraft:overworld run clear Tester_Bot');
// Give the spawner item
runRcon('minecraft:give Tester_Bot spawner[block_entity_data={id:"minecraft:mob_spawner",SpawnData:{entity:{id:"minecraft:zombie"}}}] 1');
runRcon('tp Tester_Bot 4.5 126 5.5 0 0');

setTimeout(() => {
    // Check what block data is at 5 126 5 or bot placing
    console.log("Setting spawner with setblock or test item components...");
    const inv = runRcon('execute in minecraft:overworld run data get entity @e[type=item,limit=1]');
    console.log("Done preparation.");
    process.exit(0);
}, 2000);
