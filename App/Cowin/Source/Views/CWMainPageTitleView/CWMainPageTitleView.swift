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
        self.iconHolder.clipsToBounds = true
        self.iconHolder.layer.cornerRadius = 15.0
        
        self.icon.textColor = CWStyle.Static.appTheme
        
        self.title.applyTextAttributes(font: .heading, withColor: .primary)
    }
    
    func setValue(_ title: String) {
        self.title.text = title
    }
}
