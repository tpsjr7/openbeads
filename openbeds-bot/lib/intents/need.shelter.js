const request = require('request');

    const host = "https://openbed-gh.herokuapp.com";

// https://openbeds-bot.herokuapp.com/api/messages
exports.waterfall = [
    function(sess, args){
        builder.Prompts.text(sess, "Where are you?");
    },
    function(sess, args, next){
        request(host + '/shelter/suggest', function (error, response, body) {
            if (!error && response.statusCode == 200) {
                const js = JSON.parse(body);
                sess.privateConversationData.shelter = js;
                sess.send(
`Nearest shelter with open beds is "${js.name}".
Phone # is ${js.phone}. Located at
${js.streetAddress}, ${js.zip}
`);
                console.log(body); // Show the HTML for the Google homepage.
                builder.Prompts.confirm(sess, "Do you want to reserve your spot?")
            }
            else {
                console.log("Error "+response.statusCode)
                next();
            }
        });
    },
    function(sess, args, next){

        console.log(JSON.stringify(args));
        if(args.response){
            sess.send("OK your spot is reserved. Here's a map:");
        }
        next()
    },
    function(sess, args){
        if(true || args.response){
            var shelter = sess.privateConversationData.shelter;


            console.log("address is " +shelter.streetAddress);

            var location = shelter.streetAddress;
            var base = "https://maps.googleapis.com/maps/api/staticmap?";
            var part = "center=" + location +
                "&zoom=15" +
                "&size=400x400&maptype=roadmap" +
                "&maptype=roadmap&markers=color:blue|label:S|"
                + location +
                "&key=AIzaSyAseGqfpJMOXU0sNMa5ZUhh0gY73VO-QiA";

            //url = "https://maps.googleapis.com/maps/api/staticmap?center=123%20MainSt.%20Louis,%20MO&zoom=13&size=300x300&maptype=roadmap&maptype=roadmap&markers=color:blue|label:S|123%20MainSt.%20Louis,%20MO&key=AIzaSyAseGqfpJMOXU0sNMa5ZUhh0gY73VO-QiA"

            var url = base  + encodeURI(part);

            //url = "https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn%20Bridge,New%20York,NY&zoom=13&size=600x300&maptype=roadmap%20&markers=color:blue%7Clabel:S%7CBrooklyn%20Bridge,New%20York,NY"

            console.log(url);
            var msg = new builder.Message(sess)
                .attachments([
                    new builder.HeroCard(sess)
                    .images([
                        builder.CardImage.create(sess, url)
                    ])
                ]);

            sess.endDialog(msg);
        }

        // AIzaSyAseGqfpJMOXU0sNMa5ZUhh0gY73VO-QiA

    }

];
