//
//  CWProfilePresenter.swift
//  Cowin
//


import UIKit
import CWNetworkSDK

protocol ICWProfilePresenter: AnyObject {
    func benificiaryModel(model: CWBeneficiaryListModel?)
}

class CWProfilePresenter: ICWProfilePresenter {	
	weak var view: ICWProfileViewController?
	
	init(view: ICWProfileViewController?) {
		self.view = view
	}
    
    func benificiaryModel(model: CWBeneficiaryListModel?) {
        DispatchQueue.main.async {
            self.view?.benificiaryModel(model: model)
        }
    }
}
