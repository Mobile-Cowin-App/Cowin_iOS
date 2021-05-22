//
//  CWProfileConfiguration.swift
//  Cowin
//


import Foundation
import UIKit

class CWProfileConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = CWUtility.getController("Profile", "CWProfileViewController", type: CWProfileViewController.self) 
        let router = CWProfileRouter(view: controller)
        let presenter = CWProfilePresenter(view: controller)
        let manager = CWProfileManager()
        let interactor = CWProfileInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
