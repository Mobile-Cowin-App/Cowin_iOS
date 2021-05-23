//
//  CWOnboardPresenter.swift
//  Cowin
//


import UIKit

protocol ICWOnboardPresenter: AnyObject {
	// do someting...
}

class CWOnboardPresenter: ICWOnboardPresenter {	
	weak var view: ICWOnboardViewController?
	
	init(view: ICWOnboardViewController?) {
		self.view = view
	}
}
