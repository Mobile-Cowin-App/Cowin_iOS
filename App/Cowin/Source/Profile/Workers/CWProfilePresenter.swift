//
//  CWProfilePresenter.swift
//  Cowin
//


import UIKit

protocol ICWProfilePresenter: AnyObject {
	// do someting...
}

class CWProfilePresenter: ICWProfilePresenter {	
	weak var view: ICWProfileViewController?
	
	init(view: ICWProfileViewController?) {
		self.view = view
	}
}
