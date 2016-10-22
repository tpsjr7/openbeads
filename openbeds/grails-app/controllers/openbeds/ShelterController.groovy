package openbeds

import grails.converters.JSON

class ShelterController {

    static allowedMethods = [resetCount:'POST', press: 'POST' ]
    def shelterService

    def index() { }

    def all(){

       render (shelterService.all() as JSON)
    }

    def suggest(){
        render (shelterService.suggest() as JSON)
    }

    def press(){
        int buttonId = params.id as Integer
        log.info params.id

        render buttonId
    }

    def resetCount(){
        int i
        if(params.id){
            i = params.id as Integer
        }  else {
            response.sendError(404)
            return
        }

        if(shelterService.reset(i)){
            render "OK"
        } else {
            response.sendError(404)
        }
    }
    // all shelters
    // suggsted shelter
    // post button press
}
