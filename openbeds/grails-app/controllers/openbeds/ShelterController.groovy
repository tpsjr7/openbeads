package openbeds

import grails.converters.JSON

class ShelterController {

    static allowedMethods = [resetCount:'POST', increment: 'POST', reset: 'POST' ]
    def shelterService

    private asJSON(Closure c){
        int i
        if(params.id){
            i = params.id as Integer
        }  else {
            response.sendError(404)
            return
        }

        def s = c(i)
        if(s){
            render (s as JSON)
        } else {
            response.sendError(404)
        }
    }

    def index() { }

    def all(){
       render shelterService.all() as JSON
    }

    def suggest(){
        render shelterService.suggest() as JSON
    }

    def increment(){
        asJSON {
            shelterService.incrementBeds(it)
        }
    }

    def reset(){
        asJSON {
            shelterService.reset(it)
        }
    }
    // all shelters
    // suggsted shelter
    // post button press
}
