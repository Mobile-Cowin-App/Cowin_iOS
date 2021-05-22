//
//  CWHomePresenter.swift
//  Cowin
//


import UIKit

protocol ICWHomePresenter: AnyObject {
	// do someting...
}

class CWHomePresenter: ICWHomePresenter {	
	weak var view: ICWHomeViewController?
	
	init(view: ICWHomeViewController?) {
		self.view = view
	}
}
