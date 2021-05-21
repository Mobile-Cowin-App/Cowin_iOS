//
//  CWOnboardPresenter.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.


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
