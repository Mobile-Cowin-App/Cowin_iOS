//
//  CWHomeRouter.swift
//  Cowin
//


import UIKit

protocol ICWHomeRouter: AnyObject {
	// do someting...
}

class CWHomeRouter: ICWHomeRouter {	
	weak var view: CWHomeViewController?
	
	init(view: CWHomeViewController?) {
		self.view = view
	}
}
