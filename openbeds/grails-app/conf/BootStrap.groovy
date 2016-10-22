import grails.util.Environment

class BootStrap {

    def seedDataService

    def init = { servletContext ->

        if(Environment.current == Environment.DEVELOPMENT){
            seedDataService.seed()
        }

    }
    def destroy = {
    }
}
