//
//  CWStateDistrictRouter.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation

enum CWUniqueIDRouter {
    case getStateID
    case getDistrictID(stateID: String)
    case getbeneficiary
    case getGenderID
}

extension CWUniqueIDRouter: CWEndPointType {
    var baseURL: String {
        return CWURLConstants.baseURL
    }
    
    var path: String {
        switch self {
        case .getStateID:
            return CWURLConstants.Service.getStateID.rawValue
        case let .getDistrictID(stateID: stateid):
            return "\(CWURLConstants.Service.getStateID.rawValue)/\(stateid)"
        case .getbeneficiary:
            return CWURLConstants.Service.getbeneficiaryID.rawValue
        case .getGenderID:
            return CWURLConstants.Service.getGenderID.rawValue
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        .request
    }
    
    
}
