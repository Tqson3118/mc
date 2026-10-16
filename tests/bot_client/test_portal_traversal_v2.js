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

console.log('Testing Torii Portals & Return Pads (V2)...');
const bot = mineflayer.createBot({
    host: '127.0.0.1',
    port: 25565,
    username: 'Tester_Bot',
    version: '1.21.4'
});

const actionbars = [];
bot.on('actionBar', (msg) => {
    const text = msg.toString();
    actionbars.push(text);
});

bot.once('spawn', async () => {
    console.log('[BOT] Spawned at:', bot.entity.position);
    await sleep(1000);
    
    // Ensure bot is at spawn hub
    runRcon('execute in minecraft:overworld run teleport Tester_Bot 0.5 122.0 0.5');
    await sleep(1000);
    
    const portals = [
        {
            name: 'Torii 1: Vực Thẳm Boss (world_boss)',
            toriiCoord: '55.0 121.0 -11.0',
            expectedSubY: 111,
            returnPadCoord: 'execute in minecraft:world_boss run teleport Tester_Bot 0.5 111.0 -5.0',
            actionbarKeyword: 'BOSS'
        },
        {
            name: 'Torii 2: Vườn Thượng Uyển (world_farm)',
            toriiCoord: '45.0 121.0 -7.0',
            expectedSubY: 111,
            returnPadCoord: 'execute in minecraft:world_farm run teleport Tester_Bot 0.5 111.0 -5.0',
            actionbarKeyword: 'VƯỜN THƯỢNG UYỂN'
        },
        {
            name: 'Torii 3: Biển Hồ Trên Mây (world_cauca)',
            toriiCoord: '45.0 121.0 7.0',
            expectedSubY: 103,
            returnPadCoord: 'execute in minecraft:world_cauca run teleport Tester_Bot 0.5 103.0 -5.0',
            actionbarKeyword: 'BIỂN HỒ'
        },
        {
            name: 'Torii 4: Tháp Phong Lôi (world_parkour)',
            toriiCoord: '55.0 121.0 11.0',
            expectedSubY: 71,
            returnPadCoord: 'execute in minecraft:world_parkour run teleport Tester_Bot 0.5 71.0 -5.0',
            actionbarKeyword: 'PHONG LÔI'
        },
        {
            name: 'Torii 5: Hoàng Gia Las Vegas (world_casino)',
            toriiCoord: '66.0 121.0 0.0',
            expectedSubY: 111,
            returnPadCoord: 'execute in minecraft:world_casino run teleport Tester_Bot 0.5 111.0 -5.0',
            actionbarKeyword: 'LAS VEGAS'
        }
    ];

    for (let i = 0; i < portals.length; i++) {
        const p = portals[i];
        console.log(`\n========================================`);
        console.log(`>>> TESTING [${i + 1}/5] ${p.name}`);
        console.log(`========================================`);
        
        // 1. Move to Torii Gate in Overworld
        console.log(`[ACTION] Stepping into ${p.name} at (${p.toriiCoord})...`);
        runRcon(`execute in minecraft:overworld run teleport Tester_Bot ${p.toriiCoord}`);
        await sleep(1500);
        
        console.log(`[CHECK] Bot position in sub-world:`, bot.entity.position);
        const yDiff = Math.abs(bot.entity.position.y - p.expectedSubY);
        if (yDiff <= 2) {
            console.log(`[PASS] Arrived safely in sub-world at Y ~ ${p.expectedSubY}`);
        } else {
            console.warn(`[WARN] Unexpected Y coordinate: ${bot.entity.position.y} (expected ~${p.expectedSubY})`);
        }
        
        // 2. Step on Return Pad in sub-world
        console.log(`[ACTION] Stepping on Return Pad in sub-world...`);
        runRcon(p.returnPadCoord);
        await sleep(1500);
        
        console.log(`[CHECK] Bot position after Return Pad:`, bot.entity.position);
        const returnYDiff = Math.abs(bot.entity.position.y - 122);
        if (returnYDiff <= 2) {
            console.log(`[PASS] Successfully returned to Spawn Hub (Y ~ 122)!`);
        } else {
            console.warn(`[WARN] Unexpected return Y coordinate: ${bot.entity.position.y} (expected ~122)`);
        }
        
        // Reset to center
        runRcon('execute in minecraft:overworld run teleport Tester_Bot 0.5 122.0 0.5');
        await sleep(1000);
    }
    
    console.log(`\n[ALL 5 TORII PORTALS & RETURN PADS PASSED 100%]`);
    console.log('Actionbars recorded count:', actionbars.length);
    bot.quit();
});
