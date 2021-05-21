//
//  CWStateDistrictRouter.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation

enum CWStateDistrictRouter {
    case getStateID(auth: String)
    case getDistrictID(stateID: String , auth: String)
}

extension CWStateDistrictRouter: CWEndPointType {
    var baseURL: String {
        return CWURLConstants.baseURL
    }
    
    var path: String {
        switch self {
        case .getStateID:
            return CWURLConstants.Service.getStateID.rawValue
        case let .getDistrictID(stateID: stateid, auth: _):
            return "\(CWURLConstants.Service.getStateID.rawValue)/\(stateid)"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .getStateID(auth: let auth):
            let header = ["authorization": "Bearer \(auth)"]
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: nil, additionalHeaders: header)
        case .getDistrictID(stateID: _, auth: let auth):
            let header = ["authorization": "Bearer \(auth)"]
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: nil, additionalHeaders: header)
        }
    }
    
    
}
