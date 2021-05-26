//
//  CWNewsRouter.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 26/05/21.
//

import Foundation

protocol ICWNewsRouter: AnyObject {
    // do someting...
}

class CWNewsRouter: ICWNewsRouter {
    weak var view: CWNewsViewController?
    
    init(view: CWNewsViewController?) {
        self.view = view
    }
}
