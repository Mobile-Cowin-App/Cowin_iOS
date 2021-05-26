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
        
        let newsModel = CWFeedsModel(status: "ok", totalResults: 2, articles: [
            Article(source: Source(id: "", name: "The indian Express"), author: "PTI", title: "No home isolation to be allowed for Covid patients in 18 Maharashtra districts with high positivity rate - The Indian Express", articleDescription: "", url: "", urlToImage: "https://images.indianexpress.com/2021/05/maha-mum22.jpeg", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "Hindustantimes", title: "Sputnik V vaccine supplies in accordance to contract,' says Russia - Hindustan Times", articleDescription: "", url: "", urlToImage: "https://images.hindustantimes.com/img/2021/05/25/1600x900/2021-05-24T165037Z_1706389290_RC2GMN9YNF1S_RTRMADP_3_HEALTH-CORONAVIRUS-ARGENTINA-VACCINE_1621883404271_1621923476246.JPG", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "", title: "Bharat Biotech Confident Of WHO Nod For Covaxin Amid Travel Concerns - NDTV", articleDescription: "", url: "", urlToImage: "https://c.ndtvimg.com/2021-01/l0klql2_covaxin-_650x400_22_January_21.jpg", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "", title: "Bharat Biotech Confident Of WHO Nod For Covaxin Amid Travel Concerns - NDTV", articleDescription: "", url: "", urlToImage: "https://c.ndtvimg.com/2021-01/l0klql2_covaxin-_650x400_22_January_21.jpg", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "", title: "Bharat Biotech Confident Of WHO Nod For Covaxin Amid Travel Concerns - NDTV", articleDescription: "", url: "", urlToImage: "https://c.ndtvimg.com/2021-01/l0klql2_covaxin-_650x400_22_January_21.jpg", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "", title: "Bharat Biotech Confident Of WHO Nod For Covaxin Amid Travel Concerns - NDTV", articleDescription: "", url: "", urlToImage: "https://c.ndtvimg.com/2021-01/l0klql2_covaxin-_650x400_22_January_21.jpg", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "Hindustantimes", title: "Sputnik V vaccine supplies in accordance to contract,' says Russia - Hindustan Times", articleDescription: "", url: "", urlToImage: "https://images.hindustantimes.com/img/2021/05/25/1600x900/2021-05-24T165037Z_1706389290_RC2GMN9YNF1S_RTRMADP_3_HEALTH-CORONAVIRUS-ARGENTINA-VACCINE_1621883404271_1621923476246.JPG", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "Hindustantimes", title: "Sputnik V vaccine supplies in accordance to contract,' says Russia - Hindustan Times", articleDescription: "", url: "", urlToImage: "https://images.hindustantimes.com/img/2021/05/25/1600x900/2021-05-24T165037Z_1706389290_RC2GMN9YNF1S_RTRMADP_3_HEALTH-CORONAVIRUS-ARGENTINA-VACCINE_1621883404271_1621923476246.JPG", publishedAt: Date(), content: "")
        ])
        
        self.datasource = newsModel.articles
        self.presenter?.success()
    }
}
