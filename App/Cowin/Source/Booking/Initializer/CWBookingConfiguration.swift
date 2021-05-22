//
//  CWBookingConfiguration.swift
//  Cowin
//


import Foundation
import UIKit

class CWBookingConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = CWUtility.getController("Booking", "CWBookingViewController", type: CWBookingViewController.self)  
        let router = CWBookingRouter(view: controller)
        let presenter = CWBookingPresenter(view: controller)
        let manager = CWBookingManager()
        let interactor = CWBookingInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
