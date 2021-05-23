//
//  CWSearchSlotConfiguration.swift
//  Cowin
//


import Foundation
import UIKit

class CWSearchSlotConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> CWSearchSlotViewController {
        let controller = CWUtility.getController("Booking", "CWSearchSlotViewController", type: CWSearchSlotViewController.self)
        let router = CWSearchSlotRouter(view: controller)
        let presenter = CWSearchSlotPresenter(view: controller)
        let manager = CWSearchSlotManager()
        let interactor = CWSearchSlotInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
