//
//  OTPLoginConfiguration.swift
//  Cowin
//


import Foundation
import UIKit

class OTPLoginConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> OTPLoginViewController {
        let controller = CWUtility.getController("Login", "OTPLoginViewController", type: OTPLoginViewController.self)
        let router = OTPLoginRouter(view: controller)
        let presenter = OTPLoginPresenter(view: controller)
        let manager = OTPLoginManager()
        let interactor = OTPLoginInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
