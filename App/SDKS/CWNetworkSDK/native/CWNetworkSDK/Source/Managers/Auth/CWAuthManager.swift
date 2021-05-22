//
//  CWLoginManager.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation

extension CWNetworkManager {
    
    public func triggerGenerateOTP(mobile number: String , onCompletion result:((CWOTPRequestModel? , String?) -> ())? = nil) {
        authrouter.request(.getOTP(secretID: CWURLConstants.secretID, phonenumber: number)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWOTPRequestModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
    public func triggerValidateOTP(txnID: String , otpValue: String , onCompletion result:((CWOTPValidateModel? , String?) -> ())? = nil) {
        authrouter.request(.validateOTP(otp: otpValue.sha256, txnId: txnID)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWOTPValidateModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
}



