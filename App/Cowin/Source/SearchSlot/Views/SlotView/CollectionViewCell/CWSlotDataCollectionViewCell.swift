//
//  CWSlotDataCollectionViewCell.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 29/05/21.
//

import UIKit
import CWNetworkSDK

struct CWSlotData {
    
    var vaccine: String
    var minAgeLimit: Int
    var availableCapacity: Int
}

class CWSlotDataCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageview: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var age: UILabel!
    @IBOutlet var statusHolderView: UIView!
    @IBOutlet var status: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.prepareStyles()
    }
    
    private func prepareStyles() {
        
        self.name.applyTextAttributes(font: .secondary(.semibold), withColor: .primary)
        self.age.applyTextAttributes(font: .teritary(.regular), withColor: .custom)
        self.age.textColor = CWStyle.Static.red
        self.status.applyTextAttributes(font: .teritary(.bold), withColor: .custom)
        self.status.textColor = .white
        
        self.imageview.layer.cornerRadius = 10.0
        self.imageview.layer.borderWidth = 0.5
        self.imageview.layer.borderColor = CWStyle.Border.primary.cgColor
        
        self.statusHolderView.layer.cornerRadius = 4.0
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
       if #available(iOS 13.0, *) {
           if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)) {
               // ColorUtils.loadCGColorFromAsset returns cgcolor for color name
            self.imageview.layer.borderColor = CWStyle.Border.primary.cgColor
           }
       }
    }

    func setData(with model: CWSlotData) {
        
        self.imageview.image = UIImage(named: model.vaccine.lowercased())
        self.name.text = model.vaccine.capitalizeFirstLetter
        self.age.text = "\("localize.age".localized) \(model.minAgeLimit.toString())+"
        
        let statusdata = model.statusData()
        self.status.text = statusdata.0
        self.statusHolderView.backgroundColor = statusdata.1
    }
}

private extension CWSlotData {
    
    func statusData() -> ( String, UIColor) {
            
        switch self.availableCapacity {
        case .zero:
            return ("Booked", CWStyle.Static.red)
            
        default:
            return ("Available", CWStyle.Static.green)
        }
    }
}
