package openbeds

import grails.transaction.Transactional

@Transactional
class ShelterService {

    def eventService

    def all() {
        return Shelter.findAll()
    }

    def suggest(){
//        def s = Shelter.findWhere{
//            bedCount < maxBeds
//        }
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
                eventService.record(EventType.TURNED_AWAY, s)
            } else {
                eventService.record(EventType.CHECK_IN, s)
            }
            log.debug("Increment to ${s.bedCount}")
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
            } else {
                eventService.record(EventType.CHECK_OUT, s)
            }
            log.debug("Decremented to ${s.bedCount}")
            return s
        }
        return null
    }

}
