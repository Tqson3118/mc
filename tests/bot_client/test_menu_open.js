const mineflayer = require('mineflayer');

console.log('Testing DeluxeMenus opening...');
const bot = mineflayer.createBot({
    host: '127.0.0.1',
    port: 25565,
    username: 'Tester_Bot',
    version: '1.21.4'
});

bot.once('spawn', async () => {
    console.log('[BOT] Spawned, sending /menu');
    await new Promise(r => setTimeout(r, 1000));
    
    bot.chat('/menu');
    
    const win = await new Promise((resolve) => {
        const onWin = (w) => {
            bot.removeListener('windowOpen', onWin);
            resolve(w);
        };
        bot.on('windowOpen', onWin);
        setTimeout(() => resolve(null), 5000);
    });
    
    if (win) {
        console.log('[SUCCESS] Window opened:', win.title, 'Slots count:', win.slots.length);
        for (let i = 0; i < win.slots.length; i++) {
            const item = win.slots[i];
            if (item) {
                console.log(`Slot ${i}: ${item.name} (${item.displayName})`);
            }
        }
        bot.closeWindow(win);
    } else {
        console.log('[FAILURE] Window did not open');
    }
    
    await new Promise(r => setTimeout(r, 1000));
    console.log('[BOT] Quitting...');
    bot.quit();
});
