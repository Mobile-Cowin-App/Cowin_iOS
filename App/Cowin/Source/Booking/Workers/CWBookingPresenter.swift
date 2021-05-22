//
//  CWBookingPresenter.swift
//  Cowin
//


import UIKit

protocol ICWBookingPresenter: AnyObject {
	// do someting...
}

class CWBookingPresenter: ICWBookingPresenter {	
	weak var view: ICWBookingViewController?
	
	init(view: ICWBookingViewController?) {
		self.view = view
	}
}
