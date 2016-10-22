package openbeds

import grails.transaction.Transactional

@Transactional
class ShelterService {

    def all() {
        return Shelter.findAll()
    }

    def suggest(){
        return Shelter.first()
    }
}
