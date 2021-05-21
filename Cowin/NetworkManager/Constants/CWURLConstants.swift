//
//  CWURLConstants.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation

struct CWURLConstants {
    
    static let baseURL = "https://cdn-api.co-vin.in"
    static let secretID = "U2FsdGVkX19KER6gzXM/3CTLEb7et+r/yL236bYGJQX1J/dsQTXutTz4vFAXvq3pdnOLAN9/gB95x8IqnIaQgw=="
    
    
    enum Service: String {
        case getOTP = "/api/v2/auth/generateMobileOTP"
        case validateOTP = "/api/v2/auth/validateMobileOtp"
        case getReport = "/api/v1/reports/v2/getPublicReports"
        case getStateID = "/api/v2/admin/location/states"
        case getDistrictID = "/api/v2/admin/location/districts/"
    }
    
}
