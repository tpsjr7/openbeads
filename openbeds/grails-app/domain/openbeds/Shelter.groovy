package openbeds

class Shelter {

    static constraints = {
        predictedFillTime nullable: true
        predictedFillTimeFormated nullable: true
        demographicRequirements nullable: true
    }
//    static transients = ['predictedFillTime', 'predictedFillTimeFormated']

    String name
    int bedCount
    int maxBeds

    int predictedBedCount

    Date predictedFillTime
    String predictedFillTimeFormated

    String phone
    String zip

    String streetAddress

    String demographicRequirements // mens, womens, age, veterans- ask what kind of contraints

}
