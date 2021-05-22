//
//  CWProfileViewController.swift
//  Cowin
//


import UIKit

protocol ICWProfileViewController: AnyObject {
	var router: ICWProfileRouter? { get set }
}

class CWProfileViewController: UIViewController {
	var interactor: ICWProfileInteractor?
	var router: ICWProfileRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension CWProfileViewController: ICWProfileViewController {
	// do someting...
}

extension CWProfileViewController {
	// do someting...
}

extension CWProfileViewController {
	// do someting...
}
