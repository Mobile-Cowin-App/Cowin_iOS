//
//  CWTopNavigationView.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 27/05/21.
//

import UIKit

class CWTopNavigationView: UIView {

    @IBOutlet var title: UILabel!
    @IBOutlet var icon: UIButton!
    @IBOutlet var border: UILabel!
    
    var iconClicked: (() -> ())? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.prepareStyles()
    }
    
    private func prepareStyles() {
                
        self.title.applyTextAttributes(font: .primary(.heavy), withColor: .primary)
        self.icon.applyIconTextAttributes(fontSize: 24.0, withColor: .appTheme)
        
        self.icon.setTitle(CWFonts.chevronLeftArrow.icon, for: .normal)
        self.border.backgroundColor = CWStyle.Border.primary
    }
    
    func setValue(title: String) {
        self.title.text = title
    }
    
    @IBAction private func icontapped() -> Void {
        
        self.iconClicked?()
    }
}
