//
//  CWMembersRouter.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation
enum CWMembersRouter {
    case membersList(auth: String)
    case addMembers(auth: String , body: Parameters)
    case removeMember(auth: String , body: Parameters)
}

extension CWMembersRouter: CWEndPointType {
    var baseURL: String {
        return CWURLConstants.baseURL
    }
    
    var path: String {
        switch self {
        case .membersList:
            return CWURLConstants.Service.membersList.rawValue
        case .addMembers:
            return CWURLConstants.Service.addmember.rawValue
        case .removeMember:
            return CWURLConstants.Service.removemember.rawValue
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .membersList:
            return .get
        default:
            return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .membersList(auth: let authtocken):
            let header = ["authorization": authtocken]
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: nil, additionalHeaders: header)
       
        case let .addMembers(auth: authtocken, body: bodyParams):
            let header = ["authorization": authtocken]
            return .requestParametersAndHeaders(bodyParameters: bodyParams, urlParameters: nil, additionalHeaders: header)
            
        case let .removeMember(auth: authtocken, body: bodyParams):
            let header = ["authorization": authtocken]
            return .requestParametersAndHeaders(bodyParameters: bodyParams, urlParameters: nil, additionalHeaders: header)
        }
    }
    
    
}
