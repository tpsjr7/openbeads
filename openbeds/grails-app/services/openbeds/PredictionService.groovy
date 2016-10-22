package openbeds

import grails.transaction.Transactional
import groovy.time.TimeCategory

import java.text.DateFormat
import java.text.SimpleDateFormat

@Transactional
class PredictionService {

    def df = new SimpleDateFormat("h:mm a")

    def predictFillTime(Shelter s) {
        use(TimeCategory){
            if(s){
                int diff = s.maxBeds - s.bedCount
                int mins = diff * 4
                s.predictedFillTime = mins.minutes.from.now
                s.predictedFillTimeFormated = df.format(s.predictedFillTime)
                s.save()
                return s
            }
        }

    }
}
