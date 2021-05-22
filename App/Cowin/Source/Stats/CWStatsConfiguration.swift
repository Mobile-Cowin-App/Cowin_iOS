//
//  CWStatsConfiguration.swift
//  Cowin
//


import Foundation
import UIKit

class CWStatsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = CWUtility.getController("Stats", "CWStatsViewController", type: CWStatsViewController.self) 
        let router = CWStatsRouter(view: controller)
        let presenter = CWStatsPresenter(view: controller)
        let manager = CWStatsManager()
        let interactor = CWStatsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
