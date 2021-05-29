//
//  CWSearchSlotPresenter.swift
//  Cowin
//


import UIKit

protocol ICWSearchSlotPresenter: AnyObject {
    // do someting...
    func success()
    func failure(with error: String?)
}

class CWSearchSlotPresenter: ICWSearchSlotPresenter {	
	weak var view: ICWSearchSlotViewController?
	
	init(view: ICWSearchSlotViewController?) {
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
