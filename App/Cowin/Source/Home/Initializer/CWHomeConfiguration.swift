//
//  CWHomeConfiguration.swift
//  Cowin
//


import Foundation
import UIKit

class CWHomeConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = CWUtility.getController("Home", "CWHomeViewController", type: CWHomeViewController.self)
        let router = CWHomeRouter(view: controller)
        let presenter = CWHomePresenter(view: controller)
        let manager = CWHomeManager()
        let interactor = CWHomeInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
