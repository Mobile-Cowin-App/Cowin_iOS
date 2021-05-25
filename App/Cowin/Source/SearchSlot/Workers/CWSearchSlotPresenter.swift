//
//  CWSearchSlotPresenter.swift
//  Cowin
//


import UIKit

protocol ICWSearchSlotPresenter: class {
	// do someting...
}

class CWSearchSlotPresenter: ICWSearchSlotPresenter {	
	weak var view: ICWSearchSlotViewController?
	
	init(view: ICWSearchSlotViewController?) {
		self.view = view
	}
}
