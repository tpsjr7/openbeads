package openbeds

import grails.transaction.Transactional

@Transactional
class EventService {

    def record(EventType eventType, Shelter shelter) {
        new Event(
                eventType: eventType,
                shelter: shelter
        ).save()
    }
}
