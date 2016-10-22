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

    Shelter reset(int id){
        def s = Shelter.get(id)
        if(s){
            s.bedCount = 0
            log.debug("Reset id ${id}")
            return s
        }
        return null
    }

    Shelter incrementBeds(int id){
        def s = Shelter.get(id)
        if(s){
            s.bedCount++
            log.debug("Increment to ${s.bedCount}")
            return s
        }
        return null
    }

}
