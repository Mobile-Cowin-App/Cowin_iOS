//
//  CWProfileRouter.swift
//  Cowin
//


import UIKit

protocol ICWProfileRouter: AnyObject {
	// do someting...
}

class CWProfileRouter: ICWProfileRouter {	
	weak var view: CWProfileViewController?
	
	init(view: CWProfileViewController?) {
		self.view = view
	}
}
