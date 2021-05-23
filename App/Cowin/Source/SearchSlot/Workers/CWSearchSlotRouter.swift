//
//  CWSearchSlotRouter.swift
//  Cowin
//


import UIKit

protocol ICWSearchSlotRouter: class {
	// do someting...
}

class CWSearchSlotRouter: ICWSearchSlotRouter {	
	weak var view: CWSearchSlotViewController?
	
	init(view: CWSearchSlotViewController?) {
		self.view = view
	}
}
