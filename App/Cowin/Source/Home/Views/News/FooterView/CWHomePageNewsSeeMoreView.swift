//
//  CWHomePageNewsSeeMoreView.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 26/05/21.
//

import UIKit

class CWHomePageNewsSeeMoreView: UICollectionReusableView {

    @IBOutlet var holderview: UIView!
    @IBOutlet var icon: UILabel!
    @IBOutlet var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.prepareStyles()
        self.prepareData()
    }
    
    private func prepareStyles() {
        self.holderview.applyHomeCellBorderRadius()
        self.holderview.applyDropShadow()
        self.holderview.backgroundColor = CWStyle.Background.primary
        
        self.icon.applyIconTextAttributes(fontSize: 40.0, withColor: .teritary)
        self.title.applyTextAttributes(font: .primary(.bold), withColor: .secondary)
    }
    
    private func prepareData() {
        
        self.icon.text = CWFonts.rightArrow.withFilled
        self.title.text = "localize.seemore".localized
    }
}
