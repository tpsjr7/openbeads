package openbeds

import grails.converters.JSON

class EventController {

    def index() {
        render (Event.findAll() as JSON)
    }
}
