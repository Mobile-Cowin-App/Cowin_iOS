//
//  CWMembersDataCell.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 23/05/21.
//

import UIKit

class CWMembersDataCell: UITableViewCell {

    @IBOutlet var primaryLabel: UILabel!
    @IBOutlet var secondaryLabel: UILabel!
    @IBOutlet var teritaryLabel: UILabel!
    @IBOutlet var proofType: UILabel!
    @IBOutlet var removeImageview: UIImageView!
    
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
    
}
