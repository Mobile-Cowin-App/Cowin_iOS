//
//  OTPLoginInteractor.swift
//  Cowin
//


import UIKit

protocol IOTPLoginInteractor: AnyObject {
	var parameters: [String: Any]? { get set }
}

class OTPLoginInteractor: IOTPLoginInteractor {
    var presenter: IOTPLoginPresenter?
    var manager: IOTPLoginManager?
    var parameters: [String: Any]?

    init(presenter: IOTPLoginPresenter, manager: IOTPLoginManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
