//
//  CWNewsConfiguration.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 26/05/21.
//

import Foundation
import UIKit

class CWNewsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = CWUtility.getController("Main", "CWNewsViewController", type: CWNewsViewController.self)
        let router = CWNewsRouter(view: controller)
        let presenter = CWNewsPresenter(view: controller)
        let manager = CWNewsManager()
        let interactor = CWNewsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
