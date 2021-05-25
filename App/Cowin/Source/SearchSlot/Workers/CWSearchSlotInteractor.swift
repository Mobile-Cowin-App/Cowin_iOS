//
//  CWSearchSlotInteractor.swift
//  Cowin
//


import UIKit

protocol ICWSearchSlotInteractor: class {
	var parameters: [String: Any]? { get set }
}

class CWSearchSlotInteractor: ICWSearchSlotInteractor {
    var presenter: ICWSearchSlotPresenter?
    var manager: ICWSearchSlotManager?
    var parameters: [String: Any]?

    init(presenter: ICWSearchSlotPresenter, manager: ICWSearchSlotManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
