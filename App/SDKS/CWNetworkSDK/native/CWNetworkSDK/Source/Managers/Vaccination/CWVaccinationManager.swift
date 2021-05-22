//
//  CWVaccinationManager.swift
//  CWNetworkSDK
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation
public struct CWScheduleAppointmentRequester {
    var centerid: String
    var sessionid: String
    var membersids: [String]
    var slot: String
    var captcha: String
    var dose: Int
}

//MARK:- CENTER SEARCH AND FILTERS
extension CWNetworkManager {
    
    public func searchCenterByPinCode(pincode: String, date: String = Date.getCurrentDate(), onCompletion result:((CWVaccineCenterSlotList? , String?) -> ())? = nil) {
        let params = ["pincode": pincode , "date": date]
        vaccinnationrouter.request(.searchByPinCode(params: params)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWVaccineCenterSlotList.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
    public func searchCenterByDistrict(districtCode: String, date: String = Date.getCurrentDate(), onCompletion result:((CWVaccineCenterSlotList? , String?) -> ())? = nil) {
        let params = ["district_id": districtCode , "date": date]
        vaccinnationrouter.request(.searchByDistrict(params: params)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWVaccineCenterSlotList.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
}


//MARK:- APPOINTMENT SCHEDULING
extension CWNetworkManager {
    
    public func scheduleAppointment(request model: CWScheduleAppointmentRequester, auth: String , onCompletion result:((CWAppointmentModel? , String?) -> ())? = nil) {
        let params: Parameters = ["center_id": model.centerid ,
                      "session_id": model.sessionid ,
                      "beneficiaries": model.membersids ,
                      "slot" : model.slot ,
                      "captcha": model.captcha ,
                      "dose": model.dose]
        vaccinnationrouter.request(.scheduleVaccination(body: params, auth: auth)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWAppointmentModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
    
    public func cancelAppointment(appointmentID: String , membersID: [String], auth: String , onCompletion result:((Bool , String?) -> ())? = nil) {
        let params: Parameters = ["appointment_id": appointmentID ,
                      "beneficiariesToCancel": membersID]
        vaccinnationrouter.request(.cancelVaccination(body: params, auth: auth)) { data, response, error in
                result?(error == nil , nil)
        }
    }
    
}


//MARK:- GET CAPTCHA
extension CWNetworkManager {
    public func triggerCaptcha(auth: String , onCompletion result:((CWCAPTCHAModel? , String?) -> ())? = nil) {
        vaccinnationrouter.request(.getCaptcha(auth: auth)) { data, response, error in
            let networkModel = CWNetworkUtilities.getResponseModel(data: data, error: error, response: response, type: CWCAPTCHAModel.self)
            result?(networkModel.model , networkModel.error)
        }
    }
}
