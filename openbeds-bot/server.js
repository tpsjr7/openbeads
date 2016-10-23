
var init = require("./lib/server-init").init;

var runLocal = false;

if (process.argv.length == 3 && process.argv[2] == "local") {
    console.log("running locally");
    runLocal = true;
}

if (runLocal) {
    var connector = new builder.ConsoleConnector().listen();
} else {
    var connector = new builder.ChatConnector({
        appId: process.env.APP_ID || 'e392f646-8c11-4b56-950e-62236ad5e382',
        appPassword: process.env.APP_PW || "BA9QcyswN8VxcWqqoQMoifH"
    });
}

var logIntents = !!process.env.LOG_INTENTS;

init(connector, logIntents, runLocal);
