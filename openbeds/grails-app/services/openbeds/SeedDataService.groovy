package openbeds

import grails.transaction.Transactional

@Transactional
class SeedDataService {

    def seed() {

        new Shelter(
                name: "Gateway 180 Homeless Services",
                maxBeds: 50,
                bedCount: 40
        ).save()

        new Shelter(
                name: "Covenant House",
                maxBeds: 25,
                bedCount: 20
        ).save()

        new Shelter(
                name: "Stepping Into The Light Ministry",
                maxBeds: 34,
                bedCount: 33
        ).save()

    }
}
