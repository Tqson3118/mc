const mineflayer = require('mineflayer');
const { pathfinder, Movements, goals } = require('mineflayer-pathfinder');
const { execSync } = require('child_process');
const fs = require('fs');
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

console.log('Connecting test bot...');
const bot = mineflayer.createBot({
    host: '127.0.0.1',
    port: 25565,
    username: 'Tester_Bot',
    version: '1.21.4'
});

bot.loadPlugin(pathfinder);

bot.once('spawn', async () => {
    console.log('[BOT] Spawned successfully!');
    console.log('[BOT] Position:', bot.entity.position);
    console.log('[BOT] Dimension:', bot.game.dimension);
    console.log('[BOT] GameMode:', bot.game.gameMode);
    
    // Check RCON player list
    const rconList = runRcon('list');
    console.log('[RCON] list response:', rconList);
    
    await sleep(2000);
    console.log('[BOT] Disconnecting test bot...');
    bot.quit();
    process.exit(0);
});

bot.on('error', (err) => {
    console.error('[BOT ERROR]', err);
});

bot.on('kicked', (reason) => {
    console.error('[BOT KICKED]', reason);
});
