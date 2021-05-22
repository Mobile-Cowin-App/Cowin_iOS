//
//  OTPLoginRouter.swift
//  Cowin
//


import UIKit

protocol IOTPLoginRouter: AnyObject {
	// do someting...
}

class OTPLoginRouter: IOTPLoginRouter {	
	weak var view: OTPLoginViewController?
	
	init(view: OTPLoginViewController?) {
		self.view = view
	}
}
