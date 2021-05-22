//
//  CWBookingRouter.swift
//  Cowin
//


import UIKit

protocol ICWBookingRouter: AnyObject {
	// do someting...
}

class CWBookingRouter: ICWBookingRouter {	
	weak var view: CWBookingViewController?
	
	init(view: CWBookingViewController?) {
		self.view = view
	}
}
