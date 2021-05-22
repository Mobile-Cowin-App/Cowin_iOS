//
//  CWOnboardChildViewController.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation
import UIKit
import HelperKit

class CWOnboardChildViewController: UIViewController {
    
    var images = ["onboard1" , "onboard2" , "onboard3" , "onboard2"]
    var primaryContents = [CWStringConstant.onBoarding.registerPrimary.rawValue,
                           CWStringConstant.onBoarding.locationPrimary.rawValue,
                           CWStringConstant.onBoarding.confirmSlotPrimary.rawValue,
                           CWStringConstant.onBoarding.faqPrimary.rawValue]
    
    var secondaryContents = [CWStringConstant.onBoarding.registerSecondary.rawValue,
                           CWStringConstant.onBoarding.locationSecondary.rawValue,
                           CWStringConstant.onBoarding.confirmSlotSecondary.rawValue,
                           CWStringConstant.onBoarding.faqSecondary.rawValue]
    
    var index: Int = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepareContentView()
    }
    
    fileprivate func prepareContentView() {
        let contentView: CWOnboardContentView = CWOnboardContentView.loadFromXib()
        self.view.addSubview(contentView)
        
        let image = UIImage(named: images[index])
        contentView.setData(image: image, primaryString: primaryContents[index], secondaryString: secondaryContents[index])
        contentView.g_pinEdges()
    }
    
    
    
}
