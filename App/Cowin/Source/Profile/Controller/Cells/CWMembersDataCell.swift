//
//  CWMembersDataCell.swift
//  Cowin
//

//

import UIKit

class CWMembersDataCell: UITableViewCell {

    @IBOutlet var primaryLabel: UILabel!
    @IBOutlet var secondaryLabel: UILabel!
    @IBOutlet var teritaryLabel: UILabel!
    @IBOutlet var proofType: UILabel!
    @IBOutlet var removeImageview: UIImageView!
    
    var removeTappedCB: (() -> ())? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
        [primaryLabel , secondaryLabel , teritaryLabel , proofType ].forEach({$0?.text = ""})
    }

    func setData(name: String , yob: String , proof: String , prooftype: String) {
        self.primaryLabel.text = name
        self.secondaryLabel.text = yob
        self.teritaryLabel.text = proof
        self.proofType.text = prooftype
    }
    
    @IBAction func removeAction() {
        self.removeTappedCB?()
    }
    
}
