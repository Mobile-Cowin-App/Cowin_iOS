//
//  CWWebPreviewerConfiguration.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 29/05/21.
//

import Foundation
import UIKit
import HelperKit

class CWWebPreviewerConfiguration {
    
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = CWUtility.getController("Main", "CWWebPreviewController", type: CWWebPreviewController.self)
        
        controller.url = (parameters["url"]).toString()
        
        return controller
    }
}

