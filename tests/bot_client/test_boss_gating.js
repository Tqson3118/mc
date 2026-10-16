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

console.log('Testing Boss Gating Mechanism...');
const bot = mineflayer.createBot({
    host: '127.0.0.1',
    port: 25565,
    username: 'Tester_Bot',
    version: '1.21.4'
});

const chatMessages = [];
bot.on('message', (msg) => {
    const text = msg.toString();
    chatMessages.push(text);
    console.log('[CHAT]', text);
});

bot.once('spawn', async () => {
    console.log('[BOT] Spawned at:', bot.entity.position);
    await sleep(1000);
    
    // Teleport bot to Arena 1 in world_boss
    console.log('\n[SETUP] Teleporting Tester_Bot to Arena 1 in world_boss (-180, 101, -180)...');
    runRcon('execute in minecraft:world_boss run teleport Tester_Bot -180.5 101.0 -180.5');
    await sleep(1500);
    console.log('[BOT] Current position:', bot.entity.position);
    
    // Cleanup any existing boss 1
    runRcon('minecraft:kill @e[tag=boss_1]');
    runRcon('minecraft:scoreboard players set #boss_1_alive boss_status 0');
    runRcon('minecraft:clear Tester_Bot');
    await sleep(500);
    
    // ========================================================
    // PHASE A: Insufficient Fighting Level (Lv.0) & No Totem
    // ========================================================
    console.log('\n========================================================');
    console.log('PHASE A: Insufficient Skill Level (Lv.0) & No Totem');
    console.log('========================================================');
    runRcon('skills skill setlevel Tester_Bot fighting 0');
    runRcon('minecraft:scoreboard players set Tester_Bot askill_fighting 0');
    await sleep(500);
    
    const countBeforeA = chatMessages.length;
    console.log('[ACTION] Triggering gate_boss_1 function...');
    runRcon('execute in minecraft:world_boss as Tester_Bot at Tester_Bot run function skyblock:gate_boss_1');
    await sleep(1000);
    
    const newMessagesA = chatMessages.slice(countBeforeA).join('\n');
    const deniedSkill = newMessagesA.includes('Cổng Kỹ Năng') || newMessagesA.includes('Bạn chưa đủ cấp độ');
    console.log('[VERIFY PHASE A] Skill denial received:', deniedSkill);
    if (!deniedSkill) console.error('[FAIL] Expected skill level denial message!');
    
    // Check boss alive
    const bossAliveA = runRcon('minecraft:scoreboard players get #boss_1_alive boss_status');
    console.log('[VERIFY PHASE A] Boss alive status:', bossAliveA);
    
    // ========================================================
    // PHASE B: Sufficient Fighting Level (Lv.5) & Missing Totem
    // ========================================================
    console.log('\n========================================================');
    console.log('PHASE B: Sufficient Skill Level (Lv.5) & Missing Totem');
    console.log('========================================================');
    runRcon('skills skill setlevel Tester_Bot fighting 5');
    runRcon('minecraft:scoreboard players set Tester_Bot askill_fighting 5');
    await sleep(500);
    
    const countBeforeB = chatMessages.length;
    console.log('[ACTION] Triggering gate_boss_1 function...');
    runRcon('execute in minecraft:world_boss as Tester_Bot at Tester_Bot run function skyblock:gate_boss_1');
    await sleep(1000);
    
    const newMessagesB = chatMessages.slice(countBeforeB).join('\n');
    const deniedTotem = newMessagesB.includes('Triệu Hồi Boss') || newMessagesB.includes('Bạn không có');
    console.log('[VERIFY PHASE B] Totem denial received:', deniedTotem);
    if (!deniedTotem) console.error('[FAIL] Expected totem missing denial message!');
    
    // Check boss alive
    const bossAliveB = runRcon('minecraft:scoreboard players get #boss_1_alive boss_status');
    console.log('[VERIFY PHASE B] Boss alive status:', bossAliveB);
    
    // ========================================================
    // PHASE C: Sufficient Fighting Level (Lv.5) & Has Totem
    // ========================================================
    console.log('\n========================================================');
    console.log('PHASE C: Sufficient Skill Level (Lv.5) & Has Totem');
    console.log('========================================================');
    console.log('[ACTION] Giving [🕷 Bùa Nhện Độc 🕷] to Tester_Bot via RCON...');
    runRcon('minecraft:give Tester_Bot totem_of_undying[custom_data={totem:"boss_1"}] 1');
    await sleep(1000);
    
    // Verify bot inventory has the totem
    const items = bot.inventory.items();
    console.log('[INVENTORY] Items in inventory:', items.map(it => it.name));
    const hasTotem = items.some(it => it.name.includes('totem'));
    console.log('[VERIFY] Bot received totem item:', hasTotem);
    
    const countBeforeC = chatMessages.length;
    console.log('[ACTION] Triggering gate_boss_1 function...');
    runRcon('execute in minecraft:world_boss as Tester_Bot at Tester_Bot run function skyblock:gate_boss_1');
    await sleep(1500);
    
    const newMessagesC = chatMessages.slice(countBeforeC).join('\n');
    const sacrificeSuccess = newMessagesC.includes('Hiến Tế') || newMessagesC.includes('Bạn đã hiến tế');
    console.log('[VERIFY PHASE C] Sacrifice success received:', sacrificeSuccess);
    
    // Check totem consumed
    const itemsAfter = bot.inventory.items();
    const totemConsumed = !itemsAfter.some(it => it.name.includes('totem'));
    console.log('[VERIFY PHASE C] Totem consumed from inventory:', totemConsumed);
    
    // Check boss alive
    const bossAliveC = runRcon('minecraft:scoreboard players get #boss_1_alive boss_status');
    console.log('[VERIFY PHASE C] Boss alive status (expected 1):', bossAliveC);
    
    // Check boss entity spawned
    const entityCheck = runRcon('execute in minecraft:world_boss if entity @e[tag=boss_1] run say BOSS_1_EXISTS');
    console.log('[VERIFY PHASE C] Boss entity check:', entityCheck);
    
    // Cleanup
    console.log('\n[CLEANUP] Cleaning up summoned boss 1...');
    runRcon('minecraft:kill @e[tag=boss_1]');
    runRcon('minecraft:scoreboard players set #boss_1_alive boss_status 0');
    runRcon('execute in minecraft:overworld run teleport Tester_Bot 0.5 122.0 0.5');
    await sleep(1000);
    
    console.log('\n[BOSS GATING VERIFICATION COMPLETE]');
    bot.quit();
});
