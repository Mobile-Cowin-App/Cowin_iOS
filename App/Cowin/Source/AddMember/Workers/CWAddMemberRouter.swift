//
//  CWAddMemberRouter.swift
//  Cowin
//


import UIKit

protocol ICWAddMemberRouter: AnyObject {
	// do someting...
}

class CWAddMemberRouter: ICWAddMemberRouter {	
	weak var view: CWAddMemberViewController?
	
	init(view: CWAddMemberViewController?) {
		self.view = view
	}
}
