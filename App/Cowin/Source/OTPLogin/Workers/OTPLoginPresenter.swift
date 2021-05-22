//
//  OTPLoginPresenter.swift
//  Cowin
//


import UIKit

protocol IOTPLoginPresenter: AnyObject {
	// do someting...
}

class OTPLoginPresenter: IOTPLoginPresenter {	
	weak var view: IOTPLoginViewController?
	
	init(view: IOTPLoginViewController?) {
		self.view = view
	}
}
