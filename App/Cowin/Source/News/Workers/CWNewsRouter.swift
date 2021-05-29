//
//  CWNewsRouter.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 26/05/21.
//

import Foundation
import UIKit
import WebKit

protocol ICWNewsRouter: AnyObject {
    // do someting...
    
    func navigateNewsDetail(url: String)
}

class CWNewsRouter: ICWNewsRouter {
    weak var view: CWNewsViewController?
    
    init(view: CWNewsViewController?) {
        self.view = view
    }
    
    func navigateNewsDetail(url: String) {
        let controller = CWWebPreviewerConfiguration.setup(parameters: ["url": url])
        controller.modalPresentationStyle = .overFullScreen
        controller.hero.isEnabled = true
        controller.hero.modalAnimationType = .selectBy(presenting: .pull(direction: .left), dismissing: .push(direction: .right))
        self.view?.present(controller, animated: true, completion: nil)
    }
}
