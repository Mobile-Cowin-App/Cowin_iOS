//
//  CWHomePageBannerCell.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 23/05/21.
//

import UIKit

class CWHomePageBannerCell: UITableViewCell {

    @IBOutlet var holderview: UIView!
    @IBOutlet var imageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.prepareStyles()
        self.prepareData()
    }
    
    private func prepareData() {
        
    }
    
    private func prepareStyles() {
        self.backgroundColor = .clear
        
        self.holderview.backgroundColor = .white
        self.holderview.layer.cornerRadius = 15.0
        self.holderview.applyDropShadow()
    }
    
    func setData(with model: [String]) {
        
        self.imageview.image = UIImage(named: "cowin")
    }
    
}
