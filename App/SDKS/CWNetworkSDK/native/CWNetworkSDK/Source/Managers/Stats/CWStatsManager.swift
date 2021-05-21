//
//  CWStatsManager.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation

extension CWNetworkManager {
    
    public func triggerStatsReport(stateID: String , districtID: String , date: String, onCompletion result:((CWStatsModel? , String?) -> ())? = nil) {
        statsrouter.request(.getreport(stateid: stateID, districtid: districtID, date: date)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWStatsModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
}
