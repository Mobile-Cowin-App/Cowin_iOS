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
    
    var images = ["splash1" , "splash2" , "splash3"]
    var index: Int = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepareContentView()
    }
    
    fileprivate func prepareContentView() {
        let contentView = CWOnboardContentView.loadFromXib()
        self.view.addSubview(contentView)
        
        let image = UIImage(named: images[index])
        contentView.setData(image: image, primaryString: "Primary", secondaryString: "Secondary")
        contentView.g_pinEdges()
    }
    
    
    
}
