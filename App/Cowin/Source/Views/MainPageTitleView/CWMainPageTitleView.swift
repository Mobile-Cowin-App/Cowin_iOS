//
//  CWMainPageTitleView.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 23/05/21.
//

import UIKit

class CWMainPageTitleView: UIView {

    @IBOutlet var title: UILabel!
    @IBOutlet var iconHolder: UIView!
    @IBOutlet var icon: UIButton!
    
    var iconClicked: (() -> ())? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.prepareStyles()
    }
    
    private func prepareStyles() {
        
        self.iconHolder.backgroundColor = CWStyle.Background.primary
        self.iconHolder.layer.cornerRadius = 20.0
        
        self.title.applyTextAttributes(font: .heading, withColor: .primary)
        self.icon.applyIconTextAttributes(fontSize: 14.0, withColor: .appTheme)
        
        self.iconHolder.applyDropShadow()
    }
    
    func setValue(title: String, icon: String) {
        self.title.text = title
        self.icon.setTitle(icon, for: .normal)
    }
    
    @IBAction private func icontapped() -> Void {
        
        self.iconClicked?()
    }
}
