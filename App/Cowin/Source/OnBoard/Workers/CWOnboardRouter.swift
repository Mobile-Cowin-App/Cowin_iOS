//
//  CWOnboardRouter.swift
//  Cowin
//


import UIKit

protocol ICWOnboardRouter: AnyObject {
	// do someting...
}

class CWOnboardRouter: ICWOnboardRouter {	
	weak var view: CWOnboardViewController?
	
	init(view: CWOnboardViewController?) {
		self.view = view
	}
}
