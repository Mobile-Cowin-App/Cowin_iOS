//
//  CWMembersManager.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation

public struct CWAddMemberRequester {
    var name: String
    var idNumber: String
    var idType: Int
    var gender: Int
    var birthYear: String
    var auth: String
}
extension CWNetworkManager {
    
    public func triggerFamilyMembersList(auth: String, onCompletion result:((CWBeneficiaryListModel? , String?) -> ())? = nil) -> Void {
        membersrouter.request(.membersList(auth: auth)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWBeneficiaryListModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
    public func triggerAddFamily(request model: CWAddMemberRequester, onCompletion result:((CWBAddMembertModel? , String?) -> ())? = nil) -> Void {
        
        let body = ["name": model.name , "photo_id_number": model.idNumber , "photo_id_type": model.idType , "gender_id": model.gender , "birth_year": model.birthYear , "consent_version": "V1"] as [String : Any]
        
        membersrouter.request(.addMembers(auth: model.auth, body: body)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWBAddMembertModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
    public func triggerRemoveFamilyMember(auth: String , memberID: String, onCompletion result:((Bool , String?) -> ())? = nil) -> Void {
        
        let body = ["beneficiary_reference_id":  memberID] as [String : Any]
        membersrouter.request(.removeMember(auth: auth, body: body)) { data, response, error in
            result?(error == nil , error.debugDescription)
        }
    }
    
}
