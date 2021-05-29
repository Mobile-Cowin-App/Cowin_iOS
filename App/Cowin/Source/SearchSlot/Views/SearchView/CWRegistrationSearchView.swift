//
//  CWRegistrationSearchView.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 29/05/21.
//

import UIKit

class CWRegistrationSearchView: UIView {
    var interactor: ICWSearchSlotInteractor?
    var router: ICWSearchSlotRouter?

    
    @IBOutlet var title: UILabel!
    @IBOutlet var dropdown: UILabel!
    @IBOutlet var filtervalue: UIButton!
    @IBOutlet var textfield: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.prepareStyles()
        self.prepareData()
    }
    
    private func prepareStyles() {
        
        self.title.applyTextAttributes(font: .primary(.bold), withColor: .primary)
        self.filtervalue.applyTextAttributes(font: .secondary(.regular), withColor: .teritary)
        self.dropdown.applyIconTextAttributes(fontSize: 20.0, withColor: .teritary)
        self.textfield.applyTextAttributes(font: .secondary(.regular), withColor: .primary)
        self.textfield.placeHolderColor = CWStyle.Text.tertiary
        self.textfield.tintColor = CWStyle.Static.appTheme
        
        self.textfield.layer.borderColor = CWStyle.Border.primary.cgColor
        self.textfield.layer.borderWidth = 1.0
        
        self.textfield.clipsToBounds = true
        self.textfield.applyHomeCellBorderRadius()
    }
    
    private func prepareData() {
        
        self.title.text = "localize.title.searchslots".localized
        self.dropdown.text = CWFonts.chevronBottomArrow.icon
        self.textfield.placeholder = "localize.searchslot.placeholder".localized
        self.filtervalue.setTitle("By, Postcode", for: .normal)
        
        self.textfield.delegate = self
    }
    
    
    @IBAction func filtertapped() {
        
    }
}


extension CWRegistrationSearchView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("begin")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textfield.text.safelyUnwrap
        
        if text.isNotEmpty {
            self.interactor?.searchByPINCode(textfield.text.safelyUnwrap)
        }
    }
}
