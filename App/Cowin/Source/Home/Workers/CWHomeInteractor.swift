//
//  CWHomeInteractor.swift
//  Cowin
//


import UIKit

protocol ICWHomeInteractor: AnyObject {
	var parameters: [String: Any]? { get set }
}

class CWHomeInteractor: ICWHomeInteractor {
    var presenter: ICWHomePresenter?
    var manager: ICWHomeManager?
    var parameters: [String: Any]?

    init(presenter: ICWHomePresenter, manager: ICWHomeManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
