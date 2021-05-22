//
//  CWBaseTabViewConfiguration.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation

import UIKit

internal class CWBaseTabViewConfiguration {
    
    internal static func setup() -> UIViewController {
        let controller = CWUtility.getController("Main", "CWBaseTabViewController", type: CWBaseTabViewController.self)
        let viewmodel = CWBaseTabViewModel()
        controller.basedatasource = viewmodel
        controller.basedelegate = viewmodel
        controller.viewControllers = controller.basedatasource?.prepareTabViewController()
        return controller
    }
    
}
