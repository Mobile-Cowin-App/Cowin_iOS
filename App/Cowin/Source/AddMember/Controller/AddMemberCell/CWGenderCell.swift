//
//  CWGenderCell.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 23/05/21.
//

import UIKit

class CWGenderCell: UITableViewCell {

    
    @IBOutlet var holderStack: UIStackView!
    @IBOutlet var firstHolderView: UIView!
    @IBOutlet var secondHolderView: UIView!
    @IBOutlet var thirdHolderView: UIView!
    
    
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thidLabel: UILabel!
    
    var genderCB: ((Int) -> ())? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        [firstHolderView , secondHolderView , thirdHolderView].forEach({$0?.backgroundColor = .clear})
        
        [firstLabel , secondLabel , thidLabel].forEach({
            $0?.textColor = .white
            $0?.font = UIFont.boldSystemFont(ofSize: 12)
        })
        
    }
 
    
    @IBAction func maleAction() {
        self.genderCB?(1)
        self.firstLabel.font = UIFont.boldSystemFont(ofSize: 16)
        [secondLabel , thidLabel].forEach({
            $0?.font = UIFont.boldSystemFont(ofSize: 12)
        })
    }
    
    @IBAction func femaleAction() {
        self.genderCB?(2)
        self.secondLabel.font = UIFont.boldSystemFont(ofSize: 16)
        [firstLabel , thidLabel].forEach({
            $0?.font = UIFont.boldSystemFont(ofSize: 12)
        })
    }
    
    @IBAction func othersAction() {
        self.genderCB?(3)
        self.thidLabel.font = UIFont.boldSystemFont(ofSize: 16)
        [firstLabel , secondLabel].forEach({
            $0?.font = UIFont.boldSystemFont(ofSize: 12)
        })
    }
    
}
