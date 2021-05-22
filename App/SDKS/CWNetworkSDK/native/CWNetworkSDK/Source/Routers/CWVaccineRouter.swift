//
//  CWVaccineRouter.swift
//  CWNetworkSDK
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation
enum CWVaccineRouter {
    case searchByDistrict(params: Parameters)
    case searchByPinCode(params: Parameters)
    case scheduleVaccination(body: Parameters , auth: String)
    case cancelVaccination(body: Parameters , auth: String)
    case getCaptcha(auth: String)
}
 
extension CWVaccineRouter: CWEndPointType {
    var baseURL: String {
        return CWURLConstants.baseURL
    }
    
    var path: String {
        switch self {
        case .searchByDistrict:
            return CWURLConstants.Service.getSlotsByDistrict.rawValue
       
        case .searchByPinCode:
            return CWURLConstants.Service.getSlotsByPinCode.rawValue
            
        case .scheduleVaccination:
            return CWURLConstants.Service.scheduleAppointment.rawValue
            
        case .cancelVaccination:
            return CWURLConstants.Service.cancelAppointment.rawValue
            
        case .getCaptcha:
            return CWURLConstants.Service.getCaptcha.rawValue
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .scheduleVaccination , .cancelVaccination , .getCaptcha:
            return .post
        default:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case let .searchByDistrict(params: urlparams):
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: urlparams, additionalHeaders: nil)
            
        case let .searchByPinCode(params: urlParams):
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: urlParams, additionalHeaders: nil)
            
        case let .scheduleVaccination(body: bodyparams, auth: authtoken):
            let headerparams = ["authorization": authtoken]
            return .requestParametersAndHeaders(bodyParameters: bodyparams, urlParameters: nil, additionalHeaders: headerparams)
            
        case let .cancelVaccination(body: bodyparams, auth: authtoken):
            let headerparams = ["authorization": authtoken]
            return .requestParametersAndHeaders(bodyParameters: bodyparams, urlParameters: nil, additionalHeaders: headerparams)
            
        case let .getCaptcha(auth: authtoken):
            let headerparams = ["authorization": authtoken]
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: nil, additionalHeaders: headerparams)
        }
    }
    
    
}
