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

console.log('Testing /warp in DeluxeMenus...');
const bot = mineflayer.createBot({
    host: '127.0.0.1',
    port: 25565,
    username: 'Tester_Bot',
    version: '1.21.4'
});

let chatLog = [];
bot.on('message', (msg) => {
    chatLog.push(msg.toString());
});

bot.once('spawn', async () => {
    console.log('[BOT] Spawned, resetting fighting level to 0...');
    runRcon('skills skill setlevel Tester_Bot fighting 0');
    runRcon('scoreboard players set Tester_Bot askill_fighting 0');
    
    await new Promise(r => setTimeout(r, 1000));
    
    console.log('[BOT] Sending /warp (locked state test)...');
    bot.chat('/warp');
    
    const winLocked = await new Promise((resolve) => {
        const onWin = (w) => {
            bot.removeListener('windowOpen', onWin);
            resolve(w);
        };
        bot.on('windowOpen', onWin);
        setTimeout(() => resolve(null), 5000);
    });
    
    if (winLocked) {
        console.log('[WARP] Window opened in locked state!');
        const item13 = winLocked.slots[13];
        console.log('Slot 13 material:', item13 ? item13.name : 'empty');
        console.log('Slot 4 (spawn_hub):', winLocked.slots[4]?.name);
        console.log('Slot 11 (island):', winLocked.slots[11]?.name);
        console.log('Slot 15 (farm):', winLocked.slots[15]?.name);
        console.log('Slot 22 (portal_sanctuary):', winLocked.slots[22]?.name);
        console.log('Slot 29 (cauca):', winLocked.slots[29]?.name);
        console.log('Slot 31 (parkour):', winLocked.slots[31]?.name);
        console.log('Slot 33 (casino):', winLocked.slots[33]?.name);
        
        // Click slot 13 (should trigger denial)
        console.log('[WARP] Clicking slot 13 (locked boss)...');
        await bot.clickWindow(13, 0, 0);
        await new Promise(r => setTimeout(r, 1000));
        console.log('Recent chat messages:', chatLog.slice(-3));
        bot.closeWindow(winLocked);
    } else {
        console.error('[WARP] Window failed to open');
    }
    
    await new Promise(r => setTimeout(r, 1000));
    
    console.log('\n[BOT] Setting fighting level to 5 via RCON...');
    runRcon('skills skill setlevel Tester_Bot fighting 5');
    runRcon('scoreboard players set Tester_Bot askill_fighting 5');
    
    await new Promise(r => setTimeout(r, 1500));
    
    console.log('[BOT] Sending /warp (unlocked state test)...');
    bot.chat('/warp');
    
    const winUnlocked = await new Promise((resolve) => {
        const onWin = (w) => {
            bot.removeListener('windowOpen', onWin);
            resolve(w);
        };
        bot.on('windowOpen', onWin);
        setTimeout(() => resolve(null), 5000);
    });
    
    if (winUnlocked) {
        console.log('[WARP] Window opened in unlocked state!');
        const item13 = winUnlocked.slots[13];
        console.log('Slot 13 material:', item13 ? item13.name : 'empty');
        bot.closeWindow(winUnlocked);
    } else {
        console.error('[WARP] Window failed to open in unlocked state');
    }
    
    await new Promise(r => setTimeout(r, 1000));
    console.log('[BOT] Quitting...');
    bot.quit();
});
