//
//  CWMainBaseControllerConfiguration.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit

class CWMainBaseControllerConfiguration {
    
    static func setup(parameters: [String: Any] = [:]) -> CWMainBaseController {
        let controller = CWUtility.getController("Main", "CWMainBaseController", type: CWMainBaseController.self)
        return controller
    }
}
