//
//  CWOnboardViewController.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.


import UIKit
import CWNetworkSDK
import Hero

protocol ICWOnboardViewController: AnyObject {
	var router: ICWOnboardRouter? { get set }
}

class CWOnboardViewController: UIViewController {
	var interactor: ICWOnboardInteractor?
	var router: ICWOnboardRouter?

    @IBOutlet var containerView: UIView!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .secondarySystemBackground
    }
   
    @IBAction func showLoginScreen() {
        let controller = CWBaseTabViewConfiguration.setup()
        controller.hero.isEnabled = true
        controller.hero.modalAnimationType = .zoom
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
}

extension CWOnboardViewController: ICWOnboardViewController {
	// do someting...
}

extension CWOnboardViewController {
    
    
}

extension CWOnboardViewController {
	// do someting...
}
