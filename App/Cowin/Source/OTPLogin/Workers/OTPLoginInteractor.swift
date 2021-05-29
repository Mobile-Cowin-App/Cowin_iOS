//
//  OTPLoginInteractor.swift
//  Cowin
//


import UIKit
import CWNetworkSDK

protocol IOTPLoginInteractor: AnyObject {
	var parameters: [String: Any]? { get set }
    func triggerOTP(mobile number: String)
    func validateOTP(txnID: String , otp value: String)
}

class OTPLoginInteractor: IOTPLoginInteractor {
    var presenter: IOTPLoginPresenter?
    var manager: IOTPLoginManager?
    var parameters: [String: Any]?

    init(presenter: IOTPLoginPresenter, manager: IOTPLoginManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func triggerOTP(mobile number: String) {
        CWNetworkManager.requester.triggerGenerateOTP(mobile: number) { model, errorString in
            self.presenter?.triggerOTPResult(model: model)
        }
    }
    
    func validateOTP(txnID: String , otp value: String) {
        CWNetworkManager.requester.triggerValidateOTP(txnID: txnID, otpValue: value) { validatemodel, errorDesc in
            self.presenter?.triggerValidateOTPResult(model: validatemodel)
        }
    }
}

extension OTPLoginViewController {
    internal func prepareStyle() {
        phonenumberfield.textColor = .white
        contentHolderView.layer.cornerRadius = 100
        contentHolderView.layer.maskedCorners = [.layerMaxXMinYCorner]
        
        self.loginButtonHolderView.layer.cornerRadius = self.loginButtonHolderView.frame.height / 2
        
        self.loginButtonHolderView.backgroundColor = .white
        
        self.phonenumberfield.placeHolderColor = .white
        self.phonenumberfield.textColor = .white
        self.phonenumberfield.keyboardType = .asciiCapableNumberPad

        self.otpfield.placeHolderColor = .white
        self.otpfield.textColor = .white
        self.otpfield.keyboardType = .asciiCapableNumberPad
        
        
        self.loginButtonHolderView.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
        
        self.contentHolderView.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.black, radius: 12.0, opacity: 0.35)
        
        self.dismissButton.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black.withAlphaComponent(0.5), radius: 2.0, opacity: 0.35)

        
        self.addDoneButtonOnKeyboard()
        
        self.otpHolderView.isHidden = true
        self.otpHolderView.backgroundColor = CWStyle.Static.appTheme
        
        self.dismissButton.layer.cornerRadius = self.dismissButton.frame.height / 2
        self.dismissButton.backgroundColor = .white
        self.dismissButton.titleLabel?.font = UIFont.getIconFont(with: 14)
        self.dismissButton.setTitle(CWFonts.close.icon, for: .normal)
        
        self.phonenumberfield.layer.borderColor = UIColor.white.cgColor
        self.phonenumberfield.layer.borderWidth = 2
        
        self.otpfield.layer.borderColor = UIColor.white.cgColor
        self.otpfield.layer.borderWidth = 2
        
    }
}
