//
//  CWProfileRouter.swift
//  Cowin
//


import UIKit

protocol ICWProfileRouter: AnyObject {
	// do someting...
    
    func navigateToAddMemberScreen()
}

class CWProfileRouter: ICWProfileRouter {	
	weak var view: CWProfileViewController?
	
	init(view: CWProfileViewController?) {
		self.view = view
	}
    
    func navigateToAddMemberScreen() {
        let controller = CWAddMemberConfiguration.setup()
        controller.modalTransitionStyle = .flipHorizontal
        controller.modalPresentationStyle = .overFullScreen
        self.view?.present(controller, animated: true, completion: nil)
    }
    
}
