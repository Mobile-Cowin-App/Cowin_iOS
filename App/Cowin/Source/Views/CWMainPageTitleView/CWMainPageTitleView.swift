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
    @IBOutlet var icon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.prepareStyles()
    }
    
    private func prepareStyles() {
        
        self.iconHolder.backgroundColor = .white
        self.iconHolder.layer.cornerRadius = 15.0
        
        self.title.applyTextAttributes(font: .heading, withColor: .primary)
        self.icon.applyIconTextAttributes(fontSize: 14.0, withColor: .custom)
        self.icon.textColor = CWStyle.Static.appTheme
        self.icon.text = "\u{f0f3}"
        
        self.iconHolder.applyDropShadow()
    }
    
    func setValue(_ title: String) {
        self.title.text = title
    }
}
