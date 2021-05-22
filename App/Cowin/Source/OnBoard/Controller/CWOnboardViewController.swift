//
//  CWOnboardViewController.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.


import UIKit
import CWNetworkSDK
import Hero
import CHIPageControl

protocol ICWOnboardViewController: AnyObject {
	var router: ICWOnboardRouter? { get set }
}

class CWOnboardViewController: UIViewController {
	var interactor: ICWOnboardInteractor?
	var router: ICWOnboardRouter?

    @IBOutlet var containerView: UIView!
    @IBOutlet var topPageControlHolderView: UIView!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .secondarySystemBackground
        self.preparePageControl()
    }
   
    @IBAction func showLoginScreen() {
        let controller = CWMainBaseControllerConfiguration.setup()
        controller.hero.isEnabled = true
        controller.hero.modalAnimationType = .zoom
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let pageController = segue.destination as? CWOnboardPageViewController else {return}
        pageController.onboardDelegate = self
    }
    
    
    fileprivate func preparePageControl() {
        self.topPageControlHolderView.backgroundColor = .clear
        let pageControl = CHIPageControlJalapeno(frame: CGRect(x: 0, y:0, width: 100, height: 20))
        pageControl.numberOfPages = 4
        pageControl.radius = 4
        pageControl.tintColor = .white
        pageControl.currentPageTintColor = .white
        pageControl.padding = 6
        self.topPageControlHolderView.addSubview(pageControl)
        pageControl.g_pinEdges()
    }
}

extension CWOnboardViewController: ICWOnboardViewController {
	// do someting...
}

extension CWOnboardViewController: CWOnboardDelegate {
    
    
}

extension CWOnboardViewController {
	// do someting...
}
