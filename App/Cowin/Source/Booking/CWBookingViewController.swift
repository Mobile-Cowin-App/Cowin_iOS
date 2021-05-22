//
//  CWBookingViewController.swift
//  Cowin
//


import UIKit

protocol ICWBookingViewController: AnyObject {
	var router: ICWBookingRouter? { get set }
}

class CWBookingViewController: UIViewController {
	var interactor: ICWBookingInteractor?
	var router: ICWBookingRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension CWBookingViewController: ICWBookingViewController {
	// do someting...
}

extension CWBookingViewController {
	// do someting...
}

extension CWBookingViewController {
	// do someting...
}
