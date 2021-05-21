//
//  CWAuthRouter.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation

enum CWAuthRouter {
    case getOTP(secretID: String , phonenumber: String)
    case validateOTP(otp: String , txnId: String)
}

extension CWAuthRouter: CWEndPointType {
    
    var baseURL: String {
        return CWURLConstants.baseURL
    }
    
    var path: String {
        switch self {
        case .getOTP:
            return CWURLConstants.Service.getOTP.rawValue
        case .validateOTP:
            return CWURLConstants.Service.validateOTP.rawValue
        }
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var task: HTTPTask {
        switch self {
        case let .validateOTP(otp: otpValue, txnId: txnIDValue):
            let body = ["otp": otpValue , "txnId": txnIDValue]
            return .requestParameters(bodyParameters: body, urlParameters: nil)
        case let .getOTP(secretID: secretValue, phonenumber: number):
            let body = ["secret": secretValue , "mobile": number]
            return .requestParameters(bodyParameters: body, urlParameters: nil)
        }
    }
    
    
}
