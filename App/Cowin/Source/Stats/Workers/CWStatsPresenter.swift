//
//  CWStatsPresenter.swift
//  Cowin
//


import UIKit

protocol ICWStatsPresenter: AnyObject {
	// do someting...
}

class CWStatsPresenter: ICWStatsPresenter {	
	weak var view: ICWStatsViewController?
	
	init(view: ICWStatsViewController?) {
		self.view = view
	}
}
