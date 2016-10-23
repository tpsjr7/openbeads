package openbeds

import grails.transaction.Transactional

@Transactional
class SeedDataService {

    def predictionService
    def seed() {

        /*
            Date predictedFillTime

    String phone
    String zip

    String streetAddress

    String zip

    String streetAddress

    String demoReqs // mens, womens, age, veterans- ask what kind of contraints

         */

        new Shelter(
                name: "Gateway 180 Homeless Services",
                maxBeds: 50,
                bedCount: 40,
                predictedBedCount: 30,
                phone: "(314) 231-1515",
                zip: "63106",
                streetAddress: "1000 19th St, St. Louis, MO",
                demoReqs: "Men",
        ).save()

        new Shelter(
                name: "Covenant House",
                maxBeds: 25,
                bedCount: 20,
                phone: "(314) 533-2241",
                predictedBedCount: 30,
                zip: "63113",
                streetAddress: "2727 N Kingshighway Blvd, St. Louis, MO",
                demoReqs: "Women"
        ).save()

        new Shelter(
                name: "Stepping Into The Light Ministry",
                maxBeds: 34,
                bedCount: 33,
                phone: "(314) 231-5175",
                predictedBedCount: 30,
                streetAddress: "1402 Hebert St, St. Louis, MO",
                zip: "63107",
                demoReqs: "Families"
        ).save()

        Shelter.findAll().each {
            predictionService.predictFillTime(it)
        }

    }
}
