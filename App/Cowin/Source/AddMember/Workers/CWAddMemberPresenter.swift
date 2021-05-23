//
//  CWAddMemberPresenter.swift
//  Cowin
//


import UIKit
import CWNetworkSDK

protocol ICWAddMemberPresenter: AnyObject {
    func triggerAddMember(model: CWBAddMembertModel?)
}

class CWAddMemberPresenter: ICWAddMemberPresenter {	
	weak var view: ICWAddMemberViewController?
	
	init(view: ICWAddMemberViewController?) {
		self.view = view
	}
    func triggerAddMember(model: CWBAddMembertModel?) {
        DispatchQueue.main.async {
            self.view?.resultOfAddMember(model: model)
        }
    }
}
