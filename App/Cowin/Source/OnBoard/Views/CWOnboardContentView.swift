//
//  CWOnboardContentView.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation
import UIKit

class CWOnboardContentView: UIView {

    @IBOutlet var contentImage: UIImageView!
    @IBOutlet var primaryLabel: UILabel!
    @IBOutlet var secondaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.contentImage.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.systemBlue, radius: 12.0, opacity: 0.35)
        
        
        self.contentImage.layer.masksToBounds = false
    }
    
    
    
    internal func setData(image: UIImage? , primaryString: String? , secondaryString: String?) {
        self.contentImage.image = image
        self.primaryLabel.text = primaryString
        self.secondaryLabel.text = secondaryString
    }
}
