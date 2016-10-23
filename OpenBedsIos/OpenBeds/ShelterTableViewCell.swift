import UIKit

class ShelterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shelterNameLabel: UILabel!
    @IBOutlet weak var shelterAddressLabel: UILabel!
    @IBOutlet weak var shelterPredictionLabel: UILabel!
    @IBOutlet weak var shelterPhoneLabel: UILabel!
    
    @IBOutlet weak var bar1: UIView!
    @IBOutlet weak var bar2: UIView!
    @IBOutlet weak var bar3: UIView!
    
    @IBOutlet weak var capacityLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        
    }

}
