import UIKit

class CounterViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    var idleTimer = Timer()
    
    let localIdString = "2"
    let localIdNumber: NSNumber = 2
    var prefix = "openbed-gh"
    var restOfDomain = ".herokuapp.com/shelter/"
    var shelterObject = [String : Any]()
    //var thisName = "Gateway 180 Homeless Services"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchThisShelter()
        incrementButton.layer.cornerRadius = 50.0
        decrementButton.layer.cornerRadius = 50.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.idleTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            self.fetchThisShelter()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        idleTimer.invalidate()
    }
    
    @IBAction func decrement(_ sender: AnyObject) {
        bumpCount(up: false)
    }
    
    @IBAction func increment(_ sender: AnyObject) {
        bumpCount(up: true)
    }
    
    func bumpCount(up: Bool) {
        self.idleTimer.invalidate()
        let endpoint = up ? "increment" : "decrement"
        let urlString = "http://" + prefix + restOfDomain + endpoint + "?id=" + localIdString
        let url = URL(string: urlString)
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            print(response)
            if error != nil {
                print(error)
            }else{
                if let data = data {
                    print(data)
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                        print(json)
                        self.shelterObject = json
                        DispatchQueue.main.async {
                            self.configureUI()
                        }
                    }
                    catch{
                        
                    }
                }
            }
        }
        task.resume()
    }
    
    func fetchThisShelter() {
        let urlString = "http://" + prefix + restOfDomain + "all"
        let task = URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            print(response)
            if error != nil {
                print(error)
            }else{
                if let data = data {
                    print(data)
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as! [[String : Any]]
                        
                        
                        print(json)
                        
                        for object in json {
                            if let id = object["id"] as? NSNumber {
                                if id == self.localIdNumber {
                                    self.shelterObject = object
                                }
                            }
                        }
                        
                        DispatchQueue.main.async {
                            self.configureUI()
                            
                        }
                        
                    }
                    catch{
                        
                    }
                    
                }
            }
        }
        task.resume()
    }
    
    func configureUI() {
        if let name = self.shelterObject["name"] as? String{
            if name.characters.count > 0 {
                nameLabel.text = name
            }else{
                nameLabel.text = ""
            }
        }else{
            nameLabel.text = ""
        }
        if let predictedFillTimeFormatted = shelterObject["predictedFillTimeFormated"] as? String{
            if predictedFillTimeFormatted.characters.count > 0{
                predictionLabel.text = "Expected to fill all beds by \(predictedFillTimeFormatted)"
            }else{
                predictionLabel.text = "Not expected to fill all beds today"
            }
        }else{
            predictionLabel.text = "Predictions for filling bed not available"
        }
        
        
        if let bedCount = shelterObject["bedCount"] as? NSNumber, let maxBeds = shelterObject["maxBeds"] as? NSNumber {
            counterLabel.text = "\(bedCount)/\(maxBeds)"
        }else{
            counterLabel.text = "0/0"
        }
    }
    
    //["demoReqs": Men, "class": openbeds.Shelter, "name": Gateway 180 Homeless Services, "id": 1, "zip": 63017, "predictedFillTimeFormated": 2:46 PM, "phone": 123-232-2132, "predictedFillTime": 2016-10-22T19:46:18Z, "predictedBedCount": 30, "streetAddress": 123 Main, "maxBeds": 50, "bedCount": 35]

}
