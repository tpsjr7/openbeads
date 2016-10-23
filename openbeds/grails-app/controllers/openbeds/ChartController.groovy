package openbeds

import grails.converters.JSON

class ChartController {

    def index() {}

    def list(){
        def data = [['Time', 'Bed Count']]
        def moreData = Event.findAll().collect{ Event e ->
            [e.id, e.bedCount]
        }
        data.addAll(moreData)
        render (data as JSON)
    }

    def occupancy(){}

}
