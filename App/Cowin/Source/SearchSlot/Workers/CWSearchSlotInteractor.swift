//
//  CWSearchSlotInteractor.swift
//  Cowin
//


import UIKit
import CWNetworkSDK

protocol ICWSearchSlotInteractor: AnyObject {
	var parameters: [String: Any]? { get set }
    var datasource: [Center] { get set }
    
    func searchByPINCode(_ pincode: String)
}

class CWSearchSlotInteractor: ICWSearchSlotInteractor {
    var presenter: ICWSearchSlotPresenter?
    var manager: ICWSearchSlotManager?
    var parameters: [String: Any]?

    var datasource: [Center] = .defaultValue
    
    init(presenter: ICWSearchSlotPresenter, manager: ICWSearchSlotManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func searchByPINCode(_ pincode: String) {
        
        self.datasource = [
        
        Center(centerID: 645126, name: "Kalakad GH", address: "Kalakad GH", stateName: "Tamil Nadu", districtName: "Tirunelveli", blockName: "", pincode: 627501, lat: 0, long: 0, from: "", to: "", feeType: "", sessions: [Session(sessionID: "", date: "", availableCapacity: 0, minAgeLimit: 18, vaccine: "COVISHIELD", slots: [], availableCapacityDose1: 0, availableCapacityDose2: 0), Session(sessionID: "", date: "", availableCapacity: 50, minAgeLimit: 18, vaccine: "SPUTNIK", slots: [], availableCapacityDose1: 0, availableCapacityDose2: 0), Session(sessionID: "", date: "", availableCapacity: 5, minAgeLimit: 18, vaccine: "COVAXIN", slots: [], availableCapacityDose1: 0, availableCapacityDose2: 0)]),
            
            Center(centerID: 645126, name: "Kalakad GH", address: "Kalakad GH", stateName: "Tamil Nadu", districtName: "Tirunelveli", blockName: "", pincode: 627501, lat: 0, long: 0, from: "", to: "", feeType: "Paid", sessions: [Session(sessionID: "", date: "", availableCapacity: 5, minAgeLimit: 18, vaccine: "COVAXIN", slots: [], availableCapacityDose1: 0, availableCapacityDose2: 0)]),
            
            Center(centerID: 645126, name: "Kalakad GH", address: "Kalakad GH", stateName: "Tamil Nadu", districtName: "Tirunelveli", blockName: "", pincode: 627501, lat: 0, long: 0, from: "", to: "", feeType: "", sessions: [Session(sessionID: "", date: "", availableCapacity: 50, minAgeLimit: 18, vaccine: "SPUTNIK", slots: [], availableCapacityDose1: 0, availableCapacityDose2: 0)])
        ]
        self.presenter?.success()
        
//        CWNetworkManager.requester.searchCenterByPinCode(pincode: pincode, date: CWUtility.today.searchSlotAPI) { (model, error) in
//            guard let slotlist = model, error.isNil else {
//                self.presenter?.failure(with: error)
//                return
//            }
//            self.datasource = slotlist.centers
//            self.presenter?.success()
//        }
    }
}
