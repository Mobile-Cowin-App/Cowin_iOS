//
//  CWOnboardInteractor.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.


import UIKit

protocol ICWOnboardInteractor: AnyObject {
	var parameters: [String: Any]? { get set }
}

class CWOnboardInteractor: ICWOnboardInteractor {
    var presenter: ICWOnboardPresenter?
    var manager: ICWOnboardManager?
    var parameters: [String: Any]?

    init(presenter: ICWOnboardPresenter, manager: ICWOnboardManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
