package openbeds

import grails.converters.JSON

class ShelterController {

    static allowedMethods = [resetCount:'POST', increment: 'POST', reset: 'POST' ]
    def shelterService
    def predictionService

    private asJSON(Closure c){
        int i
        if(params.id){
            i = params.id as Integer
        }  else {
            response.setStatus(404)
            render ([error: "invalid id"] as JSON)
            return
        }

        def s = c(i)
        if(s){
            predictionService.predictFillTime(s)
            render (s as JSON)
        } else {
            response.setStatus(404)
            render ([error: "invalid id"] as JSON)
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

    def decrement(){
        asJSON {
            shelterService.decrementBeds(it)
        }
    }

    def pressButton(){
        asJSON {
            if(params.type == "CHECK_IN"){
                log.info "Check in id ${it}"
                return shelterService.incrementBeds(it)
            } else if(params.type == "CHECK_OUT"){
                log.info "Check out id${it}"
                return shelterService.decrementBeds(it)
            } else {
                log.info "Unknown button press"
            }
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
