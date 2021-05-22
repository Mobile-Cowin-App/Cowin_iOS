//
//  CWMainBaseTabViewCell.swift
//  Cowin
//
//  Created by basheer-zutk107 on 22/05/21.
//

import UIKit

class CWMainBaseTabViewCell: UICollectionViewCell {

    @IBOutlet var icon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.icon.text = "i"
    }
}
