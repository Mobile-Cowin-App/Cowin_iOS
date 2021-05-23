//
//  CWLoginEmptyDataCell.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 23/05/21.
//

import UIKit

class CWLoginEmptyDataCell: UITableViewCell {

    @IBOutlet var loginButton: UIButton!
    
    var loginCB: (() -> ())? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.loginButton.layer.cornerRadius = 20
        self.loginButton.setTitleColor(.white, for: .normal)
        self.loginButton.addShadow(offset: CGSize.init(width: 3, height: 3), color: CWStyle.Static.appTheme, radius: 20.0, opacity: 0.35)
    }
    
    @IBAction func triggerLoginScreen() {
        self.loginCB?()
    }
 
}
