//
//  StateDistrictCode.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation

extension CWNetworkManager {
    
    internal func triggerStateID(auth: String, onCompletion result:((CWStateCodeModel? , String?) -> ())? = nil) {
        uniqueidrouter.request(.getStateID(auth: auth)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWStateCodeModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
    internal func triggerDistrictID(stateID: String , auth: String , onCompletion result:((CWDistrictCodeModel? , String?) -> ())? = nil) {
        uniqueidrouter.request(.getDistrictID(stateID: stateID, auth: auth)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWDistrictCodeModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
}
