//
//  CWProfileInteractor.swift
//  Cowin
//


import UIKit
import CWNetworkSDK

protocol ICWProfileInteractor: AnyObject {
	var parameters: [String: Any]? { get set }
    func triggerMembersList(auth: String)
}

class CWProfileInteractor: ICWProfileInteractor {
    var presenter: ICWProfilePresenter?
    var manager: ICWProfileManager?
    var parameters: [String: Any]?

    init(presenter: ICWProfilePresenter, manager: ICWProfileManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func triggerMembersList(auth: String) {
        CWNetworkManager.requester.triggerFamilyMembersList(auth: auth) { beneficiaryModel, errorDesc in
            self.presenter?.benificiaryModel(model: beneficiaryModel)
        }
    }
}
