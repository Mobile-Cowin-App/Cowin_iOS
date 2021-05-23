//
//  CWProfileInteractor.swift
//  Cowin
//


import UIKit
import CWNetworkSDK

protocol ICWProfileInteractor: AnyObject {
	var parameters: [String: Any]? { get set }
    func triggerMembersList(auth: String)
    func triggerRemoveMember(memberID: String , onCompletion handler: ((Bool) -> ())? )
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
    
    
    func triggerRemoveMember(memberID: String , onCompletion handler: ((Bool) -> ())? ) {
        CWNetworkManager.requester.triggerRemoveFamilyMember(auth: CWUtility.authTocken, memberID: memberID) { isCompleted, errorDesc in
            handler?(isCompleted)
        }
    }
}
