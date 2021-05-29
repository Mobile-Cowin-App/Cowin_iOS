//
//  CWNewsInteractor.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 26/05/21.
//

import Foundation
import CWNetworkSDK
import HelperKit

protocol ICWNewsInteractor: AnyObject {
    var parameters: [String: Any]? { get set }
    var datasource: [Article] { get set }

    func fetchNews(for date: String)
}

class CWNewsInteractor: ICWNewsInteractor {
    var presenter: ICWNewsPresenter?
    var manager: ICWNewsManager?
    var parameters: [String: Any]?
    var datasource: [Article] = .defaultValue
    
    init(presenter: ICWNewsPresenter, manager: ICWNewsManager) {
        self.presenter = presenter
        self.manager = manager
    }

    func fetchNews(for date: String) {
                
        self.datasource = CWUtility.newsFeedModel.articles
        self.presenter?.success()
    }
}
