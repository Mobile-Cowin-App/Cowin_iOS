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
            
            let newsModel = CWFeedsModel(status: "ok", totalResults: 2, articles: [
                Article(source: Source(id: "", name: "The indian Express"), author: "PTI", title: "No home isolation to be allowed for Covid patients in 18 Maharashtra districts with high positivity rate - The Indian Express", articleDescription: "", url: "", urlToImage: "https://images.indianexpress.com/2021/05/maha-mum22.jpeg", publishedAt: Date(), content: ""),
                Article(source: Source(id: "", name: ""), author: "Hindustantimes", title: "Sputnik V vaccine supplies in accordance to contract,' says Russia - Hindustan Times", articleDescription: "", url: "", urlToImage: "https://images.hindustantimes.com/img/2021/05/25/1600x900/2021-05-24T165037Z_1706389290_RC2GMN9YNF1S_RTRMADP_3_HEALTH-CORONAVIRUS-ARGENTINA-VACCINE_1621883404271_1621923476246.JPG", publishedAt: Date(), content: ""),
                Article(source: Source(id: "", name: ""), author: "", title: "Bharat Biotech Confident Of WHO Nod For Covaxin Amid Travel Concerns - NDTV", articleDescription: "", url: "", urlToImage: "https://c.ndtvimg.com/2021-01/l0klql2_covaxin-_650x400_22_January_21.jpg", publishedAt: Date(), content: ""),
                Article(source: Source(id: "", name: ""), author: "", title: "Bharat Biotech Confident Of WHO Nod For Covaxin Amid Travel Concerns - NDTV", articleDescription: "", url: "", urlToImage: "https://c.ndtvimg.com/2021-01/l0klql2_covaxin-_650x400_22_January_21.jpg", publishedAt: Date(), content: ""),
                Article(source: Source(id: "", name: ""), author: "", title: "Bharat Biotech Confident Of WHO Nod For Covaxin Amid Travel Concerns - NDTV", articleDescription: "", url: "", urlToImage: "https://c.ndtvimg.com/2021-01/l0klql2_covaxin-_650x400_22_January_21.jpg", publishedAt: Date(), content: ""),
                Article(source: Source(id: "", name: ""), author: "", title: "Bharat Biotech Confident Of WHO Nod For Covaxin Amid Travel Concerns - NDTV", articleDescription: "", url: "", urlToImage: "https://c.ndtvimg.com/2021-01/l0klql2_covaxin-_650x400_22_January_21.jpg", publishedAt: Date(), content: "")
            ])
            
            self.datasource = worker.generateDataSource(with: statsModel, newsModel: newsModel)
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
