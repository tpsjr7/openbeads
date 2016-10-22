package openbeds

import grails.transaction.Transactional
import groovy.time.TimeCategory

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
            s.save()
            return s
        }
        return null
    }

    Shelter incrementBeds(int id){
        def s = Shelter.get(id)
        if(s){
            s.bedCount++
            if(s.bedCount > s.maxBeds){
                s.bedCount = s.maxBeds
            }
            log.debug("Increment to ${s.bedCount}")
            s.save()
            return s
        }
        return null
    }

    Shelter decrementBeds(int id){
        def s = Shelter.get(id)
        if(s){
            s.bedCount--
            if(s.bedCount < 0){
                s.bedCount = 0
            }
            log.debug("Decremented to ${s.bedCount}")
            s.save()
            return s
        }
        return null
    }

}
