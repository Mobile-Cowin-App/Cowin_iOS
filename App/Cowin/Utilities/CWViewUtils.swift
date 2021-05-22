//
//  CWViewUtils.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation
import UIKit

internal extension UIViewController {
    func appendWithNavigation() -> UINavigationController {
        let controller =  UINavigationController(rootViewController: self)
        return controller
    }
}
