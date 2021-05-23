//
//  CWUserDefaultManager.swift
//  Cowin
//

//

import Foundation
import UIKit

internal struct CWUserDefaultManager {
    
    internal static func saveAuthTocken(value: String) {
        if value.isEmpty {return}
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: CWStringConstant.UserDefault.authkey.rawValue)
    }
    
    internal static func getAuthToken() -> String? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: CWStringConstant.UserDefault.authkey.rawValue) as? String
    }
    
}
