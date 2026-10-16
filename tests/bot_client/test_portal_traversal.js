const mineflayer = require('mineflayer');
const { execSync } = require('child_process');
const path = require('path');

const SERVER_DIR = path.resolve(__dirname, '..', '..');

function runRcon(command) {
    try {
        const output = execSync(`python run_rcon.py "${command.replace(/"/g, '\\"')}"`, {
            cwd: SERVER_DIR,
            encoding: 'utf-8',
            timeout: 10000
        });
        return output.trim();
    } catch (err) {
        console.error(`[RCON Error] cmd: ${command}`, err.message);
        return null;
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

console.log('Testing Torii Portals & Return Pads...');
const bot = mineflayer.createBot({
    host: '127.0.0.1',
    port: 25565,
    username: 'Tester_Bot',
    version: '1.21.4'
});

let actionbars = [];
bot.on('actionBar', (msg) => {
    const text = msg.toString();
    console.log('[ACTIONBAR]', text);
    actionbars.push(text);
});

bot.once('spawn', async () => {
    console.log('[BOT] Spawned at:', bot.entity.position, 'Dimension:', bot.game.dimension);
    
    // Test Torii 1 -> world_boss
    console.log('\n--- TESTING TORII 1: world_boss ---');
    // Teleport bot to near Torii 1 entrance (X=54, Y=121, Z=-11)
    console.log('[STEP] Moving bot into Torii 1 portal bounding box (X=54.5, Y=121, Z=-11)...');
    runRcon('teleport Tester_Bot 54.5 121.0 -11.0');
    
    await sleep(2000);
    console.log('[BOT] Current Position:', bot.entity.position, 'Dimension:', bot.game.dimension);
    
    // Check if bot arrived in world_boss
    console.log('[STEP] Stepping on Return Pad in world_boss (X=0.5, Y=111, Z=-5)...');
    runRcon('teleport Tester_Bot 0.5 111.0 -5.0');
    
    await sleep(2000);
    console.log('[BOT] After Return Pad Position:', bot.entity.position, 'Dimension:', bot.game.dimension);
    
    // Test Torii 2 -> world_farm
    console.log('\n--- TESTING TORII 2: world_farm ---');
    console.log('[STEP] Moving bot into Torii 2 portal bounding box (X=44.5, Y=121, Z=-7)...');
    runRcon('teleport Tester_Bot 44.5 121.0 -7.0');
    
    await sleep(2000);
    console.log('[BOT] Current Position:', bot.entity.position, 'Dimension:', bot.game.dimension);
    
    console.log('[STEP] Stepping on Return Pad in world_farm (X=0.5, Y=111, Z=-5)...');
    runRcon('teleport Tester_Bot 0.5 111.0 -5.0');
    
    await sleep(2000);
    console.log('[BOT] After Return Pad Position:', bot.entity.position, 'Dimension:', bot.game.dimension);
    
    // Test Torii 3 -> world_cauca
    console.log('\n--- TESTING TORII 3: world_cauca ---');
    console.log('[STEP] Moving bot into Torii 3 portal bounding box (X=44.5, Y=121, Z=7)...');
    runRcon('teleport Tester_Bot 44.5 121.0 7.0');
    
    await sleep(2000);
    console.log('[BOT] Current Position:', bot.entity.position, 'Dimension:', bot.game.dimension);
    
    console.log('[STEP] Stepping on Return Pad in world_cauca (X=0.5, Y=103, Z=-5)...');
    runRcon('teleport Tester_Bot 0.5 103.0 -5.0');
    
    await sleep(2000);
    console.log('[BOT] After Return Pad Position:', bot.entity.position, 'Dimension:', bot.game.dimension);
    
    // Test Torii 4 -> world_parkour
    console.log('\n--- TESTING TORII 4: world_parkour ---');
    console.log('[STEP] Moving bot into Torii 4 portal bounding box (X=54.5, Y=121, Z=11)...');
    runRcon('teleport Tester_Bot 54.5 121.0 11.0');
    
    await sleep(2000);
    console.log('[BOT] Current Position:', bot.entity.position, 'Dimension:', bot.game.dimension);
    
    console.log('[STEP] Stepping on Return Pad in world_parkour (X=0.5, Y=71, Z=-5)...');
    runRcon('teleport Tester_Bot 0.5 71.0 -5.0');
    
    await sleep(2000);
    console.log('[BOT] After Return Pad Position:', bot.entity.position, 'Dimension:', bot.game.dimension);
    
    // Test Torii 5 -> world_casino
    console.log('\n--- TESTING TORII 5: world_casino ---');
    console.log('[STEP] Moving bot into Torii 5 portal bounding box (X=65.5, Y=121, Z=0)...');
    runRcon('teleport Tester_Bot 65.5 121.0 0.0');
    
    await sleep(2000);
    console.log('[BOT] Current Position:', bot.entity.position, 'Dimension:', bot.game.dimension);
    
    console.log('[STEP] Stepping on Return Pad in world_casino (X=0.5, Y=111, Z=-5)...');
    runRcon('teleport Tester_Bot 0.5 111.0 -5.0');
    
    await sleep(2000);
    console.log('[BOT] After Return Pad Position:', bot.entity.position, 'Dimension:', bot.game.dimension);
    
    console.log('\n[ALL PORTALS TEST COMPLETE] Quitting...');
    bot.quit();
});
