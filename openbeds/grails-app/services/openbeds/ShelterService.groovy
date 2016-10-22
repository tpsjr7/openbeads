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

    Boolean reset(int id){
        def s = Shelter.get(id)
        if(s){
            s.bedCount = 0
            log.debug("Reset id ${id}")
            return true
        } else {
            return false
        }
    }
}
