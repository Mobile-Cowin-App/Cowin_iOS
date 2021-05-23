//
//  CWHomeInteractor.swift
//  Cowin
//


import UIKit
import CWNetworkSDK
import HelperKit

protocol ICWHomeInteractor: AnyObject {
	var parameters: [String: Any]? { get set }
    var datasource: [CWHomePageDataSource] { get set }

    func fetchStats()
}

class CWHomeInteractor: ICWHomeInteractor {
    var presenter: ICWHomePresenter?
    var manager: ICWHomeManager?
    var parameters: [String: Any]?
    var datasource: [CWHomePageDataSource]
    
    init(presenter: ICWHomePresenter, manager: ICWHomeManager) {
    	self.presenter = presenter
    	self.manager = manager
        self.datasource = .defaultValue
    }
    
    func fetchStats() {
        
        CWNetworkManager.requester.triggerStatsReport(stateID: .defaultValue, districtID: .defaultValue, date: Date().convert("yyyy-MM-dd")) { (model, error) in
            guard let statsModel = model, let worker = self.manager else { return }
            
            self.datasource = worker.generateDataSource(with: statsModel)
            self.presenter?.success()
        }
    }
}
