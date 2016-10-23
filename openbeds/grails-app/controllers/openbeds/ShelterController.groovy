package openbeds

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ShelterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Shelter.list(params), model:[shelterInstanceCount: Shelter.count()]
    }

    def show(Shelter shelterInstance) {
        respond shelterInstance
    }

    def create() {
        respond new Shelter(params)
    }

    @Transactional
    def save(Shelter shelterInstance) {
        if (shelterInstance == null) {
            notFound()
            return
        }

        if (shelterInstance.hasErrors()) {
            respond shelterInstance.errors, view:'create'
            return
        }

        shelterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'shelter.label', default: 'Shelter'), shelterInstance.id])
                redirect shelterInstance
            }
            '*' { respond shelterInstance, [status: CREATED] }
        }
    }

    def edit(Shelter shelterInstance) {
        respond shelterInstance
    }

    @Transactional
    def update(Shelter shelterInstance) {
        if (shelterInstance == null) {
            notFound()
            return
        }

        if (shelterInstance.hasErrors()) {
            respond shelterInstance.errors, view:'edit'
            return
        }

        shelterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Shelter.label', default: 'Shelter'), shelterInstance.id])
                redirect shelterInstance
            }
            '*'{ respond shelterInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Shelter shelterInstance) {

        if (shelterInstance == null) {
            notFound()
            return
        }

        shelterInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Shelter.label', default: 'Shelter'), shelterInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'shelter.label', default: 'Shelter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }


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

    def all(){
        render shelterService.all() as JSON
    }

    def suggest(){
        render shelterService.suggest() as JSON
    }

    @Transactional
    def increment(){
        asJSON {
            shelterService.incrementBeds(it)
        }
    }
    @Transactional
    def decrement(){
        asJSON {
            shelterService.decrementBeds(it)
        }
    }

    @Transactional
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

}
