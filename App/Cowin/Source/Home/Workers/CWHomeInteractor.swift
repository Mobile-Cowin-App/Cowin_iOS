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

    func fetchStats(for date: String)
}

class CWHomeInteractor: ICWHomeInteractor {
    var presenter: ICWHomePresenter?
    var manager: ICWHomeManager?
    var parameters: [String: Any]?
    var datasource: [CWHomePageDataSource] = .defaultValue
    
    init(presenter: ICWHomePresenter, manager: ICWHomeManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func fetchStats(for date: String) {
        
        CWNetworkManager.requester.triggerStatsReport(stateID: .defaultValue, districtID: .defaultValue, date: date) { (model, error) in
            guard let worker = self.manager, let statsModel = model, error.isNil else {
                self.presenter?.failure(with: error)
                return
            }
            
            self.datasource = worker.generateDataSource(with: statsModel, newsModel: CWUtility.newsFeedModel)
            self.presenter?.success()
            
//            CWNetworkManager.requester.triggerFeedsList { (newsModel, error) in
//                guard let worker = self.manager, error.isNil else {
//                    self.presenter?.failure(with: error)
//                    return
//                }
//
//                self.datasource = worker.generateDataSource(with: statsModel, newsModel: newsModel)
//                self.presenter?.success()
//            }
        }
    }
}
