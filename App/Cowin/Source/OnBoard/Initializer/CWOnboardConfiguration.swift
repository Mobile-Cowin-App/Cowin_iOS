//
//  CWOnboardConfiguration.swift
//  Cowin
//


import Foundation
import UIKit

class CWOnboardConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> CWOnboardViewController {
        let controller = CWUtility.getController("OnBoard", "CWOnboardViewController", type: CWOnboardViewController.self)
        let router = CWOnboardRouter(view: controller)
        let presenter = CWOnboardPresenter(view: controller)
        let manager = CWOnboardManager()
        let interactor = CWOnboardInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
