//
//  StateDistrictCode.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation

extension CWNetworkManager {
    
    public func triggerStateID(auth: String, onCompletion result:((CWStateModel? , String?) -> ())? = nil) {
        uniqueidrouter.request(.getStateID) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWStateModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
    public func triggerDistrictID(stateID: String , auth: String , onCompletion result:((CWDistrictModel? , String?) -> ())? = nil) {
        uniqueidrouter.request(.getDistrictID(stateID: stateID)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWDistrictModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
    public func triggerBeneficiaryID(onCompletion result:((CWBeneficiaryModel? , String?) -> ())? = nil) {
        uniqueidrouter.request(.getbeneficiary) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWBeneficiaryModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
}
