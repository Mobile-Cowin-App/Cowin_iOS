//
//  CWSubmitCell.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 23/05/21.
//

import UIKit

class CWSubmitCell: UITableViewCell {

    @IBOutlet var addbutton: UIButton!
    
    var addTapped: (() -> ())? = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.addbutton.backgroundColor = .white
        self.addbutton.setTitleColor(.systemBlue, for: .normal)
        self.addbutton.layer.cornerRadius = 20
        self.addbutton.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black.withAlphaComponent(0.5), radius: 2.0, opacity: 0.35)
    }

    @IBAction func addAction(){
        self.addTapped?()
    }
    
}
