//
//  CWMainBaseTabViewCell.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import UIKit

class CWMainBaseTabViewCell: UICollectionViewCell {

    @IBOutlet var icon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.prepareStyles()
    }
    
    private func prepareStyles() {
        
        self.icon.applyIconTextAttributes(fontSize: 20.0, withColor: .secondary)
    }
    
    func setData(with model: CWHomeBottomTabData) {
        
        self.icon.text = model.icon
    }
}
