//
//  CWSearchSlotViewController.swift
//  Cowin
//


import UIKit

protocol ICWSearchSlotViewController: class {
	var router: ICWSearchSlotRouter? { get set }
}

class CWSearchSlotViewController: UIViewController {
	var interactor: ICWSearchSlotInteractor?
	var router: ICWSearchSlotRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension CWSearchSlotViewController: ICWSearchSlotViewController {
	// do someting...
}

extension CWSearchSlotViewController {
	// do someting...
}

extension CWSearchSlotViewController {
	// do someting...
}
