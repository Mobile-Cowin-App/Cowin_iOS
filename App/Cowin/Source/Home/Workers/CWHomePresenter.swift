//
//  CWHomePresenter.swift
//  Cowin
//


import UIKit

protocol ICWHomePresenter: AnyObject {
	// do someting...
    func success()
    func failure()
}

class CWHomePresenter: ICWHomePresenter {	
	weak var view: ICWHomeViewController?
	
	init(view: ICWHomeViewController?) {
		self.view = view
	}
    
    
    func success() {
        DispatchQueue.main.async {
            self.view?.success()
        }
    }
    
    func failure() {
        DispatchQueue.main.async {
        
        }
    }
}
