//
//  CWAddMemberInteractor.swift
//  Cowin
//


import UIKit
import CWNetworkSDK

protocol ICWAddMemberInteractor: AnyObject {
	var parameters: [String: Any]? { get set }
    func triggerAddMember(model: CWAddMemberRequester)
}

class CWAddMemberInteractor: ICWAddMemberInteractor {
    var presenter: ICWAddMemberPresenter?
    var manager: ICWAddMemberManager?
    var parameters: [String: Any]?

    init(presenter: ICWAddMemberPresenter, manager: ICWAddMemberManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func triggerAddMember(model: CWAddMemberRequester) {
        CWNetworkManager.requester.triggerAddFamily(request: model) { resultmodel, errorDesc in
            self.presenter?.triggerAddMember(model: resultmodel)
        }
    }
}
