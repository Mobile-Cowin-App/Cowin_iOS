//
//  CWHomeViewController.swift
//  Cowin
//


import UIKit

protocol ICWHomeViewController: AnyObject {
	var router: ICWHomeRouter? { get set }
}

class CWHomeViewController: UIViewController {
	var interactor: ICWHomeInteractor?
	var router: ICWHomeRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        
        self.title = "HOME"
    }
}

extension CWHomeViewController: ICWHomeViewController {
	// do someting...
}

extension CWHomeViewController {
	// do someting...
}

extension CWHomeViewController {
	// do someting...
}
