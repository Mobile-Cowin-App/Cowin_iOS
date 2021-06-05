//
//  CWSyncFlow.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 03/06/21.
//

import Foundation
import UIKit
import HelperKit
import CWNetworkSDK

class CWSyncEngine {
    
    static var progressValue: ((CGFloat, Bool, String?) -> ())? = nil
    
    private static var progressCount: CGFloat = 0
    
    static func startInitialSync(progressvalue: ((CGFloat, Bool, String?) -> ())?) {
        
        self.progressValue = progressvalue
        
        syncStates()
//        syncDistricts()
    }
    
    private static func sendProgressValue(_ value: CGFloat, _ error: String?) {
        progressValue?(value / progressCount, progressCount == .zero, error)
    }
    
    private static func syncStates() {
        self.progressCount = self.progressCount.increase()
        
        if CWStateCoreDataHelper.getAllStates().isNotEmpty {
            self.progressCount = self.progressCount.decrease()
            sendProgressValue(1.0, nil)
            return
        }
        
        CWNetworkManager.requester.triggerStateID(auth: .defaultValue) { (states, error) in
            
            guard let model = states, error == nil else {
                sendProgressValue(0.0, nil)
                return
            }
            
            CWStateCoreDataHelper.syncStatesToCoreData(with: model)
            self.progressCount = self.progressCount.decrease()
            sendProgressValue(1.0, nil)
        }
    }
    
    private static func syncDistricts() {
        self.progressCount = self.progressCount.increase()

        let states = CWStateCoreDataHelper.getAllStates()
        
        states.enumerated().forEach({ (index, state) in
            let id = String(state.id)
            
            if CWDistrictCoreDataHelper.getAllDistricts(from: id).isNotEmpty {
                sendProgressValue(CGFloat(index / states.count), nil)
                return
            }
            
            CWNetworkManager.requester.triggerDistrictID(stateID: id, auth: .defaultValue) { (districts, error) in
                
                guard let model = districts, error == nil else {
                    sendProgressValue(0.0, nil)
                    return
                }
                
                CWDistrictCoreDataHelper.syncDistrictsToCoreData(with: model)
                self.progressCount = index == states.count ? self.progressCount.decrease(): self.progressCount
                sendProgressValue(CGFloat(index / states.count), nil)
            }
        })
    }
}
