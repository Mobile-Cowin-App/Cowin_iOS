//
//  CWAddMemberCell.swift
//  Cowin
//

//

import UIKit

class CWAddMemberCell: UITableViewCell {

    
    @IBOutlet var dropDownHolderView: UIView!
    @IBOutlet var dropDowntitle: UIButton!
    @IBOutlet var inputField: UITextField!
    
    
    var isShowDropDown: Bool = false {
        didSet {
            self.dropDownHolderView.isHidden = !isShowDropDown
        }
    }
    
    var dropDowntapped: (() -> ())? = nil
    
    var contentDidChange: ((String) -> ())? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addDoneButtonOnKeyboard()
        
        inputField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)

        
        self.selectionStyle = .none
        self.inputField.font = UIFont.boldSystemFont(ofSize: 13)
        self.inputField.tintColor = .white
        self.inputField.textColor = .white
        self.inputField.placeHolderColor = .white
        self.inputField.layer.borderWidth = 1
        self.inputField.layer.borderColor = UIColor.white.cgColor
    }

    @objc func textFieldDidChange(textField: UITextField) {
        self.contentDidChange?(inputField.text ?? "")
    }

    
    internal func setPlaceHolderText(value: String) {
        self.inputField.text = value
    }
    
    internal func setDropDownTitle(value: String) {
        self.dropDowntitle.setTitle(value, for: .normal)
    }
    
    @IBAction func dropdownselected() {
        self.dropDowntapped?()
    }
    
}

//MARK:- KEYBOARD UIToolbar
extension CWAddMemberCell {
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: CWStringConstant.login.done.rawValue , style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        inputField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        inputField.resignFirstResponder()
    }
}
