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

console.log('Connecting test bot for window & scoreboard...');
const bot = mineflayer.createBot({
    host: '127.0.0.1',
    port: 25565,
    username: 'Tester_Bot',
    version: '1.21.4'
});

bot.once('spawn', async () => {
    console.log('[BOT] Spawned, waiting 2s for scoreboards...');
    await sleep(2000);
    
    console.log('--- SCOREBOARDS ---');
    console.log('Scoreboards keys:', Object.keys(bot.scoreboards || {}));
    if (bot.scoreboard) {
        for (const [pos, sb] of Object.entries(bot.scoreboard)) {
            console.log(`Scoreboard at [${pos}]:`, sb.title, sb.name);
            if (sb.items) {
                console.log('Items:', sb.items.map(it => ({ name: it.name, value: it.value })));
            }
        }
    }
    
    console.log('\n--- TESTING /menu ---');
    bot.chat('/menu');
    const menuWin = await new Promise((resolve) => {
        const onWin = (win) => {
            bot.removeListener('windowOpen', onWin);
            resolve(win);
        };
        bot.on('windowOpen', onWin);
        setTimeout(() => resolve(null), 5000);
    });
    
    if (menuWin) {
        console.log('[MENU] Window opened:', menuWin.title);
        const slotsWithItems = menuWin.slots
            .map((item, idx) => item ? { slot: idx, name: item.name, displayName: item.displayName } : null)
            .filter(Boolean);
        console.log('[MENU] Items found:', slotsWithItems.length, slotsWithItems);
        bot.closeWindow(menuWin);
    } else {
        console.log('[MENU] Failed to open menu window within 5s');
    }
    
    await sleep(1000);
    
    console.log('\n--- TESTING /warp ---');
    bot.chat('/warp');
    const warpWin = await new Promise((resolve) => {
        const onWin = (win) => {
            bot.removeListener('windowOpen', onWin);
            resolve(win);
        };
        bot.on('windowOpen', onWin);
        setTimeout(() => resolve(null), 5000);
    });
    
    if (warpWin) {
        console.log('[WARP] Window opened:', warpWin.title);
        const slotsWithItems = warpWin.slots
            .map((item, idx) => item ? { slot: idx, name: item.name, displayName: item.displayName } : null)
            .filter(Boolean);
        console.log('[WARP] Items found:', slotsWithItems.length, slotsWithItems);
        bot.closeWindow(warpWin);
    } else {
        console.log('[WARP] Failed to open warp window within 5s');
    }
    
    await sleep(1000);
    console.log('[BOT] Quitting...');
    bot.quit();
    process.exit(0);
});

bot.on('error', (err) => console.error('[BOT ERROR]', err));
bot.on('kicked', (reason) => console.error('[BOT KICKED]', reason));
