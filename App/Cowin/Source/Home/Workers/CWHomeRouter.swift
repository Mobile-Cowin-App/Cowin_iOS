//
//  CWHomeRouter.swift
//  Cowin
//


import UIKit

protocol ICWHomeRouter: AnyObject {
	// do someting...
    
    func navigateNewsList()
    func navigateNewsDetail(url: String)
}

class CWHomeRouter: ICWHomeRouter {	
	weak var view: CWHomeViewController?
	
	init(view: CWHomeViewController?) {
		self.view = view
	}
    
    func navigateNewsList() {
        let controller = CWNewsConfiguration.setup()
        controller.modalPresentationStyle = .overFullScreen
        controller.hero.isEnabled = true
        controller.hero.modalAnimationType = .selectBy(presenting: .pull(direction: .left), dismissing: .push(direction: .right))
        self.view?.present(controller, animated: true, completion: nil)
    }
    
    func navigateNewsDetail(url: String) {
        let controller = CWWebPreviewerConfiguration.setup(parameters: ["url": url])
        controller.modalPresentationStyle = .overFullScreen
        controller.hero.isEnabled = true
        controller.hero.modalAnimationType = .selectBy(presenting: .pull(direction: .left), dismissing: .push(direction: .right))
        self.view?.present(controller, animated: true, completion: nil)
    }
}
