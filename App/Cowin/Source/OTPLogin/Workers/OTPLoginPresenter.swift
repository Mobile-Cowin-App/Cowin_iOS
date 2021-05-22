//
//  OTPLoginPresenter.swift
//  Cowin
//


import UIKit
import CWNetworkSDK

protocol IOTPLoginPresenter: AnyObject {
    func triggerOTPResult(model: CWOTPRequestModel?)
    func triggerValidateOTPResult(model: CWOTPValidateModel?)
}

class OTPLoginPresenter: IOTPLoginPresenter {	
	weak var view: IOTPLoginViewController?
	
	init(view: IOTPLoginViewController?) {
		self.view = view
	}
    
    func triggerOTPResult(model: CWOTPRequestModel?) {
        self.view?.triggerOTPResult(model: model)
    }
    
    func triggerValidateOTPResult(model: CWOTPValidateModel?) {
        self.view?.triggerValidateOTPResult(model: model)
    }
}
