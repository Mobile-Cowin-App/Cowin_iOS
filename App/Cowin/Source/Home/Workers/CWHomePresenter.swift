//
//  CWHomePresenter.swift
//  Cowin
//


import UIKit

protocol ICWHomePresenter: AnyObject {
	// do someting...
    func success()
    func failure(with error: String?)
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
    
    func failure(with error: String?) {
        DispatchQueue.main.async {
        
        }
    }
}
