import UIKit

class SheltersTableViewController: UITableViewController {

    var prefix = "openbed-gh"
    var restOfDomain = ".herokuapp.com/shelter/"
    var shelterObjects = [[String : Any]]()
    var suggestedShelterObject = [String : Any]()
    var numFormatter = NumberFormatter()
    var idleTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numFormatter.numberStyle = .decimal
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSuggestedShelter()
        self.idleTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { (timer) in
            self.loadSuggestedShelter()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        idleTimer.invalidate()
    }
    
    func loadAllShelters() {
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
                    self.shelterObjects = json
                    print(json)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
                catch{
                    
                }
                
                }
            }
        }
        task.resume()
    }
    
    func loadSuggestedShelter() {
        //http://7849d1f6.ngrok.io/openbeds/shelter/suggest
        let urlString = "http://" + prefix + restOfDomain + "suggest"
        let task = URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            print(response)
            if error != nil {
                print(error)
            }else{
                if let data = data {
                    print(data)
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                        self.suggestedShelterObject = json
                        print(json)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            self.loadAllShelters()
                        }
                        
                    }
                    catch{
                        
                    }
                    
                }
            }
        }
        task.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return shelterObjects.count > 0 ? 1 : 0
        }else{
            return shelterObjects.count
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let cell = cell as? ShelterTableViewCell {
            var shelterObject = indexPath.section == 0 ? suggestedShelterObject : shelterObjects[indexPath.row]
            
            if let name = shelterObject["name"] as? String {
                cell.shelterNameLabel.text = name
            }
            
            if let demoReqs = shelterObject["demoReqs"] as? String {
                
            }
            
            //class, id
            
            if let streetAddress = shelterObject["streetAddress"] as? String, let zip = shelterObject["zip"] as? String {
                cell.shelterAddressLabel.text = "\(streetAddress)" + ", St. Louis, MO, " + "\(zip)"
            }
            
            if let phone = shelterObject["phone"] as? String {
                cell.shelterPhoneLabel.text = phone
            }
            
            //NUMBERS
            
            
            if let bedCount = shelterObject["bedCount"] as? NSNumber, let maxBeds = shelterObject["maxBeds"] as? NSNumber {
                cell.capacityLabel.text = "\(bedCount) / \(maxBeds)"
                
                    let dullColor = UIColor.lightGray
                    let ratio = bedCount.floatValue / maxBeds.floatValue
                    
                    cell.bar1.backgroundColor = ratio > 0.4 ? UIColor.red : dullColor
                    cell.bar2.backgroundColor = ratio > 0.7 ? UIColor.red : dullColor
                    cell.bar3.backgroundColor = ratio > 0.98 ? UIColor.red : dullColor
                
            }
            
            if let prediction = shelterObject["predictedFillTimeFormated"] as? String {
                cell.shelterPredictionLabel.text = "Expected to fill at \(prediction)"
            }else{
                cell.shelterPredictionLabel.text = "Not expected to fill all beds today"
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Nearby Alternative Shelter" : "Other Shelters"
    }

}
