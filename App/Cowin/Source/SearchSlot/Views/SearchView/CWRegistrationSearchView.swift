//
//  CWRegistrationSearchView.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 29/05/21.
//

import UIKit
import HelperKit

enum CWSearchSlotType: String {
    case Pincode, District, Location
}

class CWRegistrationSearchView: UIView {
    var interactor: ICWSearchSlotInteractor?
    var router: ICWSearchSlotRouter?

    @IBOutlet var title: UILabel!
    @IBOutlet var dropdown: UILabel!
    @IBOutlet var filtervalue: UIButton!
    
    @IBOutlet var searchHolder: UIView!
    @IBOutlet var search: UILabel!
    
    @IBOutlet var textfieldHolder: UIView!
    @IBOutlet var textfield: UITextField!
    
    @IBOutlet var districtHolder: CWDistrictSearchView!
    
    private var searchType: CWSearchSlotType = .Pincode
    lazy var tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gestureAction(_:)))
        gesture.numberOfTapsRequired = 1
        return gesture
    }()
    
    private var currentView: UIView!
    private var previousView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.prepareStyles()
        self.prepareData()
    }
    
    private func prepareStyles() {
        [self.textfieldHolder, self.districtHolder].forEach({
            $0?.alpha = 0.0
        })
        
        self.title.applyTextAttributes(font: .primary(.bold), withColor: .primary)
        self.filtervalue.applyTextAttributes(font: .secondary(.regular), withColor: .teritary)
        self.dropdown.applyIconTextAttributes(fontSize: 20.0, withColor: .teritary)
        self.textfield.applyTextAttributes(font: .secondary(.regular), withColor: .primary)
        self.textfield.placeHolderColor = CWStyle.Text.tertiary
        self.textfield.tintColor = CWStyle.Static.appTheme
        
        self.search.applyTextAttributes(font: .teritary(.bold), withColor: .appTheme)
        
        self.searchHolder.backgroundColor = CWStyle.Background.primary
        self.searchHolder.layer.borderWidth = 0.5
        self.searchHolder.layer.borderColor = CWStyle.Static.appTheme.cgColor
        self.searchHolder.layer.cornerRadius = 6.0
        
        self.textfieldHolder.layer.borderColor = CWStyle.Border.primary.cgColor
        self.textfieldHolder.layer.borderWidth = 0.5
        self.textfield.borderStyle = .none
        self.textfieldHolder.clipsToBounds = true
        self.textfieldHolder.applyHomeCellBorderRadius()
    }
    
    private func prepareData() {
        
        self.title.text = "localize.title.searchslots".localized
        self.search.text = "localize.search".localized
        self.dropdown.text = CWFonts.chevronBottomArrow.icon
        self.textfield.returnKeyType = .search
        self.textfield.delegate = self
        self.previousView = self.textfieldHolder
        self.prepareTextField()
        self.prepareSearchButton()
    }
    
    private func prepareTextField() {
        
        switch self.searchType {
        case .Pincode:
            self.currentView = self.textfieldHolder
            
            self.textfield.placeholder = "localize.placeholder.postcode".localized
            self.textfield.keyboardType = .numberPad
            self.filtervalue.setTitle("\("localize.by".localized), \("localize.pincode".localized)", for: .normal)

        case .District:
            self.currentView = self.districtHolder
            
        case .Location:
            self.currentView = self.textfieldHolder
            
            self.textfield.placeholder = "localize.placeholder.location".localized
            self.textfield.keyboardType = .numberPad
            self.filtervalue.setTitle("\("localize.by".localized), \("localize.location".localized)", for: .normal)
        }
        
        self.currentView.transform = CGAffineTransform(translationX: 0.0, y: -50)
        
        let propertyAnimator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.75) {
            self.previousView.transform = CGAffineTransform(translationX: 0.0, y: 50)
            self.previousView.alpha = 0.0
            
            self.currentView.transform = .identity
            self.currentView.alpha = 1.0
        }
        
        propertyAnimator.addCompletion { position in
            self.previousView = self.currentView
        }
        
        propertyAnimator.startAnimation()
    }
    
    private func prepareSearchButton() {
        
        searchHolder.isUserInteractionEnabled = true
        searchHolder.addGestureRecognizer(tapGesture)
        tapGesture.removeTarget(self, action: #selector(gestureAction(_:)))
        tapGesture.addTarget(self, action: #selector(gestureAction(_:)))
    }
    
    @objc func gestureAction(_ gesture: UITapGestureRecognizer) {

    }
    
    @IBAction func filtertapped() {
        
        UIAlertController.showActionsheet(title: nil, message: nil, actions: [("localize.pincode".localized, .default), ("localize.district".localized, .default), ("localize.location".localized, .default)], selectedTitle: self.searchType.rawValue, cancelText: "localize.cancel".localized, completion: { (index, title) in
            
            if let type = CWSearchSlotType(rawValue: title), type != self.searchType {
                self.searchType = type
                self.prepareTextField()
            }
        })
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13.0, *) {
            if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)) {
                self.textfieldHolder.layer.borderColor = CWStyle.Text.tertiary.cgColor
            }
        }
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


class CWDistrictSearchView: UIView {
    
    @IBOutlet var firstHolderView: UIStackView!
    @IBOutlet var secondHolderView: UIStackView!
    
    @IBOutlet var firstText: UIButton!
    @IBOutlet var secondText: UIButton!
    @IBOutlet var firstBorder: UILabel!
    @IBOutlet var secondBorder: UILabel!
    
    @IBOutlet var firstDropDown: UILabel!
    @IBOutlet var secondDropDown: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.prepareStyles()
        self.prepareData()
    }
    
    private func prepareStyles() {
        
        [self.firstText, self.secondText].forEach({
            $0.applyTextAttributes(font: .teritary(.regular), withColor: .teritary)
        })
        
        [firstDropDown, secondDropDown].forEach({
            $0?.applyIconTextAttributes(fontSize: 20.0, withColor: .teritary)
            $0?.text = CWFonts.chevronBottomArrow.icon
        })
        
        [self.firstBorder, self.secondBorder].forEach({
            $0?.backgroundColor = CWStyle.Text.tertiary
        })
    }
    
    private func prepareData() {
        
        self.firstText.setTitle("localize.placeholder.state".localized, for: .normal)
        self.secondText.setTitle("localize.placeholder.district".localized, for: .normal)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            UIAlertController.showPickerController(title: "States", doneText: "Done", cancelText: "Cancel", options: ["Tamil nadu", "Kerala", "Delhi", "Karnataka"], completion: { (option) in
                
            })
        case 2:
            UIAlertController.showPickerController(title: "States", doneText: "Done", cancelText: "Cancel", options: ["Tirunelveli", "Chennai", "Madurai", "Tenkasi"], completion: { (option) in
                
            })
            
        default: break
        }
    }
}
