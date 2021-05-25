//
//  CWStatsRouter.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation

enum CWStatsRouter {
    case getreport(stateid: String , districtid: String , date: String)//Date Format YYYY-MM-DD
    case getFeeds(params: Parameters)
}

extension CWStatsRouter: CWEndPointType {
    var baseURL: String {
        
        switch self {
        case .getFeeds:
            return CWURLConstants.feedsBaseURL
        default:
            return CWURLConstants.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getreport:
            return CWURLConstants.Service.getReport.rawValue
        default:
            return CWURLConstants.Service.getFeeds.rawValue
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case let .getreport(stateid: stateID, districtid: districtID, date: dateValue):
            let params = ["state_id": stateID , "district_id": districtID , "date": dateValue]
            return .requestParameters(bodyParameters: nil, urlParameters: params)
        case let .getFeeds(params: urlParams):
            return .requestParameters(bodyParameters: nil, urlParameters: urlParams)
        }
    }
    
    
}
