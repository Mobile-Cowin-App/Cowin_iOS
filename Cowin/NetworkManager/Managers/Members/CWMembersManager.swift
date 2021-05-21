//
//  CWMembersManager.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation

internal struct CWAddMemberRequester {
    var name: String
    var idNumber: String
    var idType: Int
    var gender: Int
    var birthYear: String
    var auth: String
}
extension CWNetworkManager {
    
    internal func triggerFamilyMembersList(auth: String, onCompletion result:((CWBeneficiaryListModel? , String?) -> ())? = nil) -> Void {
        membersrouter.request(.membersList(auth: auth)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWBeneficiaryListModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
    internal func triggerAddFamily(request model: CWAddMemberRequester, onCompletion result:((CWBAddMembertModel? , String?) -> ())? = nil) -> Void {
        
        let body = ["name": model.name , "photo_id_number": model.idNumber , "photo_id_type": model.idType , "gender_id": model.gender , "birth_year": model.birthYear , "consent_version": "V1"] as [String : Any]
        
        membersrouter.request(.addMembers(auth: model.auth, body: body)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWBAddMembertModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
}
