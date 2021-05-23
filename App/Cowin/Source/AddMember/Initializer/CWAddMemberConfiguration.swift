//
//  CWAddMemberConfiguration.swift
//  Cowin
//


import Foundation
import UIKit

class CWAddMemberConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> CWAddMemberViewController {
        let controller = CWUtility.getController("Profile", "CWAddMemberViewController", type: CWAddMemberViewController.self)
        let router = CWAddMemberRouter(view: controller)
        let presenter = CWAddMemberPresenter(view: controller)
        let manager = CWAddMemberManager()
        let interactor = CWAddMemberInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
