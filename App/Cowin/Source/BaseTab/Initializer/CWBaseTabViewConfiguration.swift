//
//  CWBaseTabViewConfiguration.swift
//  Cowin
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
