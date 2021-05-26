//
//  CWNewsPresenter.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 26/05/21.
//

import Foundation

protocol ICWNewsPresenter: AnyObject {
    // do someting...
    func success()
    func failure(with error: String?)
}

class CWNewsPresenter: ICWNewsPresenter {
    weak var view: ICWNewsViewController?
    
    init(view: ICWNewsViewController?) {
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
