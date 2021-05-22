//
//  CWProfileInteractor.swift
//  Cowin
//


import UIKit

protocol ICWProfileInteractor: AnyObject {
	var parameters: [String: Any]? { get set }
}

class CWProfileInteractor: ICWProfileInteractor {
    var presenter: ICWProfilePresenter?
    var manager: ICWProfileManager?
    var parameters: [String: Any]?

    init(presenter: ICWProfilePresenter, manager: ICWProfileManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
