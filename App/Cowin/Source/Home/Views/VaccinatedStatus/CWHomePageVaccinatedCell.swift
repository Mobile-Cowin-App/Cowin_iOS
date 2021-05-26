//
//  CWHomePageVaccinatedCell.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 23/05/21.
//

import UIKit

class CWHomePageVaccinatedCell: UITableViewCell {

    @IBOutlet var holderview: UIView!
    @IBOutlet var title: UILabel!
    @IBOutlet var statusicon: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.prepareStyles()
        self.prepareData()
    }
    
    private func prepareData() {
        
        self.title.text = "Covid 19 Vaccine status"
    }
    
    private func prepareStyles() {
        self.backgroundColor = .clear
        
        self.holderview.backgroundColor = CWStyle.Background.primary
        self.holderview.applyHomeCellBorderRadius()
        self.holderview.applyDropShadow()

        self.title.applyTextAttributes(font: .teritary(.semibold), withColor: .secondary)
        
        self.status.applyTextAttributes(font: .primary(.heavy), withColor: .primary)
        self.date.applyTextAttributes(font: .teritary(.regular), withColor: .teritary)
        self.statusicon.applyIconTextAttributes(fontSize: 20.0, withColor: .custom)
    }

    func setData(with model: CWVaccinatedStatus) {
        self.statusicon.text = model.vaccinated ? "\u{f058}": "\u{f057}"
        self.statusicon.textColor = model.vaccinated ? CWStyle.Static.green: CWStyle.Static.red
        
        self.status.text = model.vaccinated ? "Vaccinated": "Not Vaccinated"
        self.date.text = model.vaccinatedTime
    }
}
