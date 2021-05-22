//
//  CWBookingInteractor.swift
//  Cowin
//


import UIKit

protocol ICWBookingInteractor: AnyObject {
	var parameters: [String: Any]? { get set }
}

class CWBookingInteractor: ICWBookingInteractor {
    var presenter: ICWBookingPresenter?
    var manager: ICWBookingManager?
    var parameters: [String: Any]?

    init(presenter: ICWBookingPresenter, manager: ICWBookingManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
