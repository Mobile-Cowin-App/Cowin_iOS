//
//  CWUtility.swift
//  Cowin
//
//

import Foundation
import UIKit
import CommonCrypto
import CWNetworkSDK

internal struct CWUtility {
    
    static var authTocken: String{
        set {
            CWUserDefaultManager.saveAuthTocken(value: newValue)
        }
        get  {
            return CWUserDefaultManager.getAuthToken() ?? ""
        }
    }
    
    static func getController<T>(_ storyBoardName: String, _ identifier: String , type: T.Type) -> T {
            return UIStoryboard(name: storyBoardName, bundle: nil).instantiateViewController(withIdentifier: identifier) as! T
    }
        
    static var today: String {
        return Date().convert(CWApiCallParams.dateFormat)
    }
    
    static var newsFeedModel: CWFeedsModel {
        let newsModel = CWFeedsModel(status: "ok", totalResults: 2, articles: [
            Article(source: Source(id: "", name: "The indian Express"), author: "PTI", title: "No home isolation to be allowed for Covid patients in 18 Maharashtra districts with high positivity rate - The Indian Express", articleDescription: "", url: "https://www.moneycontrol.com/news/india/coronavirus-india-news-live-updates-symptoms-covid-19-cases-vaccine-cowin-6958241.html", urlToImage: "https://images.indianexpress.com/2021/05/maha-mum22.jpeg", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "Hindustantimes", title: "Sputnik V vaccine supplies in accordance to contract,' says Russia - Hindustan Times", articleDescription: "", url: "https://news.google.com/__i/rss/rd/articles/CBMiK2h0dHBzOi8vd3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9LWZDOFRkaVBnNVHSAQA?oc=5", urlToImage: "https://images.hindustantimes.com/img/2021/05/25/1600x900/2021-05-24T165037Z_1706389290_RC2GMN9YNF1S_RTRMADP_3_HEALTH-CORONAVIRUS-ARGENTINA-VACCINE_1621883404271_1621923476246.JPG", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "", title: "Bharat Biotech Confident Of WHO Nod For Covaxin Amid Travel Concerns - NDTV", articleDescription: "", url: "https://www.hindustantimes.com/india-news/nothing-against-ramdev-but-ima-chief-on-withdrawing-complaint-against-yoga-guru-101622259282537.html", urlToImage: "https://c.ndtvimg.com/2021-01/l0klql2_covaxin-_650x400_22_January_21.jpg", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "", title: "Bharat Biotech Confident Of WHO Nod For Covaxin Amid Travel Concerns - NDTV", articleDescription: "", url: "https://www.livemint.com/news/india/domestic-air-travel-will-now-cost-you-more-as-govt-raises-lower-limit-on-fare-11622246232021.html", urlToImage: "https://c.ndtvimg.com/2021-01/l0klql2_covaxin-_650x400_22_January_21.jpg", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "", title: "Bharat Biotech Confident Of WHO Nod For Covaxin Amid Travel Concerns - NDTV", articleDescription: "", url: "https://www.thehindu.com/business/Economy/us-president-joe-bidens-6-trillion-budget-social-spending-taxes-on-business/article34672319.ece", urlToImage: "https://c.ndtvimg.com/2021-01/l0klql2_covaxin-_650x400_22_January_21.jpg", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "", title: "Bharat Biotech Confident Of WHO Nod For Covaxin Amid Travel Concerns - NDTV", articleDescription: "", url: "https://timesofindia.indiatimes.com/india/india-for-more-studies-to-trace-covid-origin/articleshow/83052865.cms", urlToImage: "https://c.ndtvimg.com/2021-01/l0klql2_covaxin-_650x400_22_January_21.jpg", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "Hindustantimes", title: "Sputnik V vaccine supplies in accordance to contract,' says Russia - Hindustan Times", articleDescription: "", url: "https://news.google.com/__i/rss/rd/articles/CBMiK2h0dHBzOi8vd3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9Vzc2RFlDUzJ2Q0HSAQA?oc=5", urlToImage: "https://images.hindustantimes.com/img/2021/05/25/1600x900/2021-05-24T165037Z_1706389290_RC2GMN9YNF1S_RTRMADP_3_HEALTH-CORONAVIRUS-ARGENTINA-VACCINE_1621883404271_1621923476246.JPG", publishedAt: Date(), content: ""),
            Article(source: Source(id: "", name: ""), author: "Hindustantimes", title: "Sputnik V vaccine supplies in accordance to contract,' says Russia - Hindustan Times", articleDescription: "", url: "https://www.aninews.in/news/national/general-news/india-needs-to-prepare-to-give-one-crore-covid-19-doses-in-a-day-possible-in-few-weeks-vk-paul20210527174353", urlToImage: "https://images.hindustantimes.com/img/2021/05/25/1600x900/2021-05-24T165037Z_1706389290_RC2GMN9YNF1S_RTRMADP_3_HEALTH-CORONAVIRUS-ARGENTINA-VACCINE_1621883404271_1621923476246.JPG", publishedAt: Date(), content: "")
        ])
        return newsModel
    }
}

struct CWApiCallParams {
    
    static var dateFormat: String {
        return "yyyy-MM-dd"
    }
}

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var sha256: String {
        let data = Data(utf8)
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        
        data.withUnsafeBytes { buffer in
            _ = CC_SHA256(buffer.baseAddress, CC_LONG(buffer.count), &hash)
        }
        
        return hash.map { String(format: "%02hhx", $0) }.joined()
    }
    
    static var makeEmpty: String {
        return ""
    }
}

extension UIView {
    
    func applyDropShadow() {
        self.applyShadow(shadowColor: UIColor.black.withAlphaComponent(0.075), shadowRadius: 6.0, shadowOpacity: 1.0)//, shadowOffset : CGSize(width: 0, height: 5))
    }
    
    func applyHomeBottomViewBorderRadius() {
        self.layer.cornerRadius = 15.0
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func applyHomeTopViewBorderRadius() {
        self.layer.cornerRadius = 15.0
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func applyHomeCellBorderRadius() {
        self.layer.cornerRadius = 10.0
    }
}

extension CALayer {

    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {

        let border = CALayer()

        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)

        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)

        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)

        case UIRectEdge.right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)

        default: break
        }

        border.backgroundColor = color.cgColor
        addSublayer(border)
    }
}

