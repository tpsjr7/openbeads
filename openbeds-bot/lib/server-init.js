var builder = require('botbuilder');
var restify = require('restify');
var fs = require("fs");

global.builder = builder;
var bot;

function listIntentModules() {
    return fs.readdirSync("./lib/intents").map(val => val.replace(/\.js$/, ''));
}

function init(connector, logIntents, listenStdinLocal) {

    var env = process.env.ENV_NAME || "dev";

    var intents = new builder.IntentDialog({
        recognizers: [new builder.LuisRecognizer("https://api.projectoxford.ai/luis/v1/application?id=8a69d9b8-8b92-4eff-ba44-b0df83835417&subscription-key=160ef2aac65e463fa108416f0cbd5d0b")]
    });

    bot = new builder.UniversalBot(connector);
    bot.use(builder.Middleware.dialogVersion({version: 3.0, resetCommand: /^reset/i}));

    bot.dialog('/', intents);

    intents.matches(/^env$/i, function (sess) {
        sess.send(process.env.ENV_NAME || "not set (develop)");
    });

    var actions = {};
    for (var intent of listIntentModules()) {
        actions[intent] = require(`./intents/${intent}`).waterfall;
    }

    intents.matches("need.shelter", actions["need.shelter"]);

    var loginData = {};

    intents.matches(/^login (.*)/i, function (sess, args) {
        var name = args.matched[1];
        sess.send(`Hello ${name}`);
        loginData[name] = sess.message.address;
    });

    intents.matches(/^img/i, function(sess, args){
        //var url = "https://maps.googleapis.com/maps/api/staticmap?" +
        //    "center=" + "123+Main" +
        //    "St.%20Louis,%20MO" +
        //    "&zoom=13" +
        //    "&size=100x100&maptype=roadmap" +
        //    "&key=AIzaSyAseGqfpJMOXU0sNMa5ZUhh0gY73VO-QiA";
        var url = "https://secure.static.tumblr.com/77bb66d4ce332363485b8ed564d2f4fa/aqcdekz/R0Xntujc7/tumblr_static_tumblr_static_ckfz979bhz40o0s0s8ocwsws0_640.jpg";


        //var location = shelter.streetAddress + "St.%20Louis,%20MO";
        //var url = "https://maps.googleapis.com/maps/api/staticmap?" +
        //    "center=" + location +
        //    "&zoom=13" +
        //    "&size=100x100&maptype=roadmap" +
        //    "&maptype=roadmap&markers=color:blue|label:S|"
        //    + location +
        //
        //    "&key=AIzaSyAseGqfpJMOXU0sNMa5ZUhh0gY73VO-QiA";

        console.log(url);
        //var url = "https://maps.googleapis.com/maps/api/staticmap%3Fcenter%3D123%20MainSt.%20Louis%2C%20MO%26zoom%3D13%26size%3D200x200%26maptype%3Droadmap%26maptype%3Droadmap%26markers%3Dcolor%3Ablue%7Clabel%3AS%7C123%20MainSt.%20Louis%2C%20MO%26key%3DAIzaSyAseGqfpJMOXU0sNMa5ZUhh0gY73VO-QiA"
        url = "https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn%20Bridge,New%20York,NY&zoom=13&size=600x300&maptype=roadmap%20&markers=color:blue%7Clabel:S%7CBrooklyn%20Bridge,New%20York,NY"
        var msg = new builder.Message(sess)
            .attachments([
                new builder.HeroCard(sess)
                .images([
                    builder.CardImage.create(sess, url)
                ])
            ]);

        sess.endDialog(msg);
    });

    bot.dialog("/sendmess", function(sess, args){
        var msg = new builder.Message()
            .address(args.address)
            .text(args.mess);
        bot.send(msg);
    });

    intents.onDefault([
        function (session, results, next) {
            if (logIntents) {
                logging.logTopIntent(results);
            }
            session.send("I'm sorry I didn't understand.");
            next();
        }
    ]);


    if (!listenStdinLocal) {
        // Setup Restify Server
        var server = restify.createServer();
        server.post('/api/messages', connector.listen());
        console.log("server PORT is %s", process.env.PORT);
        server.listen(process.env.PORT || 8080, function () {
            console.log('%s listening to %s', server.name, server.url);
        });
    }

}


module.exports.init = init;
