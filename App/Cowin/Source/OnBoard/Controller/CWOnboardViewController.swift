//
//  CWOnboardViewController.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.


import UIKit
import CWNetworkSDK
import Hero
import CHIPageControl
import HelperKit

protocol ICWOnboardViewController: AnyObject {
	var router: ICWOnboardRouter? { get set }
}

class CWOnboardViewController: UIViewController {
	var interactor: ICWOnboardInteractor?
	var router: ICWOnboardRouter?

    @IBOutlet var containerView: UIView!
    @IBOutlet var topPageControlHolderView: UIView!
    @IBOutlet var skipButton: UIButton!
    @IBOutlet var bottomHolderView: UIView!
    @IBOutlet var nextButton: UIButton!
    
    let pageControl = CHIPageControlJaloro(frame: CGRect(x: 0, y:0, width: 100, height: 20))

    @IBOutlet var nextButtonWidth: NSLayoutConstraint!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.preparePageControl()
        self.prepareBottomHolderView()
        
        self.updateLayerProperties()
    }
    
    func updateLayerProperties() {
        nextButton.layer.shadowColor = CWStyle.Static.appTheme.cgColor
        nextButton.layer.shadowOffset = CGSize(width: 0.2, height: 0.2)
        nextButton.layer.shadowOpacity = 1.0
        nextButton.layer.shadowRadius = 20.0
        nextButton.layer.masksToBounds = false
       }
    
    
    fileprivate func prepareBottomHolderView() {
        self.skipButton.setTitle(CWStringConstant.onBoarding.skip.rawValue, for: .normal)
        self.bottomHolderView.layer.cornerRadius = bottomHolderView.frame.height / 2
        self.bottomHolderView.backgroundColor = .secondarySystemBackground
        self.setIconFont()
    }
    
    fileprivate func setIconFont() {
        self.prepareShrinkAnimation()
        self.nextButton.setTitleColor(CWStyle.Static.appTheme, for: .normal)
        self.nextButton.setTitle("", for: .normal)
        self.nextButton.titleLabel?.font = UIFont.getIconFont(with: 20)
        self.nextButton.setTitle(CWFonts.next, for: .normal)
    }
    
    fileprivate func setTextFont() {
        self.performExpandAnimation()
        self.nextButton.setTitleColor(CWStyle.Static.appTheme, for: .normal)
        self.nextButton.setTitle("", for: .normal)
        self.nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.nextButton.setTitle(CWStringConstant.onBoarding.getStart.rawValue, for: .normal)
    }
    
   
    @IBAction func showLoginScreen() {
        let controller = OTPLoginConfiguration.setup()
        controller.hero.isEnabled = true
        controller.hero.modalAnimationType = .zoom
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func skipActionTapped() {
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

    
}

extension CWOnboardViewController: ICWOnboardViewController {
	// do someting...
}

extension CWOnboardViewController: CWOnboardDelegate {
    
    func didChangeController(at index: Int) {
        pageControl.set(progress: index, animated: true)
        
        self.skipButton.setTitleColor(index % 2 != 0  ? .tertiaryLabel : .white, for: .normal)
        index == 3 ? self.setTextFont() : self.setIconFont()
    }
    
}

extension CWOnboardViewController {
    fileprivate func preparePageControl() {
        self.topPageControlHolderView.backgroundColor = .clear
        pageControl.numberOfPages = 4
        pageControl.radius = 4
        pageControl.tintColor = CWStyle.Static.appTheme
        pageControl.currentPageTintColor = CWStyle.Static.appTheme
        pageControl.padding = 6
        self.topPageControlHolderView.addSubview(pageControl)
        pageControl.g_pinEdges()
    }
    
    fileprivate func performExpandAnimation() {
        nextButtonWidth.constant = 140
 
        self.nextButton.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        UIView.animate(
            withDuration: 1.2,
            delay: 0.0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 0.2,
            options: .allowAnimatedContent,
            animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.nextButton.layoutIfNeeded()
            }, completion: { _ in
                self.nextButton.transform = .identity
            } )
        
         
    }
    
    fileprivate func prepareShrinkAnimation() {
        
        self.nextButtonWidth.constant = 60

        self.nextButton.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        UIView.animate(
            withDuration: 1.2,
            delay: 0.0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 0.2,
            options: .allowAnimatedContent,
            animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.nextButton.layoutIfNeeded()
            },completion: { _ in
                self.nextButton.transform = .identity
            })
        
        

    }
}
