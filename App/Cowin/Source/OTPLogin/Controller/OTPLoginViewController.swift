//
//  OTPLoginViewController.swift
//  Cowin
//


import UIKit
import Hero

protocol IOTPLoginViewController: AnyObject {
	var router: IOTPLoginRouter? { get set }
}

class OTPLoginViewController: UIViewController {
	var interactor: IOTPLoginInteractor?
	var router: IOTPLoginRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        
        self.view.backgroundColor = .secondarySystemBackground
        
       
    }
    
    @IBAction func backTapped() {
        self.hero.modalAnimationType = .zoomOut
        self.dismiss(animated: true, completion: nil)
    }
}

extension OTPLoginViewController: IOTPLoginViewController {
	// do someting...
}

extension OTPLoginViewController {
	// do someting...
}

extension OTPLoginViewController {
	// do someting...
}
