package openbeds

import grails.converters.JSON

class ShelterController {

    def shelterService

    def index() { }

    def all(){

       render (shelterService.all() as JSON)
    }

    def suggest(){
        render (shelterService.suggest() as JSON)
    }
    // all shelters
    // suggsted shelter
    // post button press
}
