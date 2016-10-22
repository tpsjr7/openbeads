package openbeds

import grails.transaction.Transactional

@Transactional
class SeedDataService {

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
                phone: "123-232-2132",
                zip: "63017",
                streetAddress: "123 Main",
                demoReqs: "Men"
        ).save()

        new Shelter(
                name: "Covenant House",
                maxBeds: 25,
                bedCount: 20,
                phone: "123-232-2132",
                predictedBedCount: 30,
                zip: "63017",
                streetAddress: "123 Main",
                demoReqs: "Women"
        ).save()

//        new Shelter(
//                name: "Stepping Into The Light Ministry",
//                maxBeds: 34,
//                bedCount: 33
//        ).save()

    }
}
