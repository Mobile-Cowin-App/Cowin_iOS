//
//  CWStatsRouter.swift
//  Cowin
//


import UIKit

protocol ICWStatsRouter: AnyObject {
	// do someting...
}

class CWStatsRouter: ICWStatsRouter {	
	weak var view: CWStatsViewController?
	
	init(view: CWStatsViewController?) {
		self.view = view
	}
}
