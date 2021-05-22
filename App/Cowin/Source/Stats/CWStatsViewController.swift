//
//  CWStatsViewController.swift
//  Cowin
//


import UIKit

protocol ICWStatsViewController: AnyObject {
	var router: ICWStatsRouter? { get set }
}

class CWStatsViewController: UIViewController {
	var interactor: ICWStatsInteractor?
	var router: ICWStatsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension CWStatsViewController: ICWStatsViewController {
	// do someting...
}

extension CWStatsViewController {
	// do someting...
}

extension CWStatsViewController {
	// do someting...
}
