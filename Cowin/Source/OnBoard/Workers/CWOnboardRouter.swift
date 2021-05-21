//
//  CWOnboardRouter.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.


import UIKit

protocol ICWOnboardRouter: class {
	// do someting...
}

class CWOnboardRouter: ICWOnboardRouter {	
	weak var view: CWOnboardViewController?
	
	init(view: CWOnboardViewController?) {
		self.view = view
	}
}
