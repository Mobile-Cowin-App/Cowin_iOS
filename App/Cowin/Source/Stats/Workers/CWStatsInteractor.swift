//
//  CWStatsInteractor.swift
//  Cowin
//


import UIKit

protocol ICWStatsInteractor: AnyObject {
	var parameters: [String: Any]? { get set }
}

class CWStatsInteractor: ICWStatsInteractor {
    var presenter: ICWStatsPresenter?
    var manager: ICWStatsManager?
    var parameters: [String: Any]?

    init(presenter: ICWStatsPresenter, manager: ICWStatsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
