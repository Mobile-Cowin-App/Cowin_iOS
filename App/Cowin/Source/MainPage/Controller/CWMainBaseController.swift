//
//  CWMainBaseController.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit
import HelperKit

class CWMainBaseController: UIViewController {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var tabHolderView: UIView!
    
    lazy var pagecontroller: CWMainBasePageController = {
        return self.children.first as! CWMainBasePageController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.prepareTheme()
        self.prepareViews()
    }
    
    
    func prepareTheme() {
        
        self.view.backgroundColor = CWStyle.Background.primary
        self.view.clipsToBounds = true
        self.view.layer.masksToBounds = true
    }
    
    func prepareViews() {
        let tabview: CWMainBaseTabView = CWMainBaseTabView.loadFromXib()
        
        self.tabHolderView.addSubview(tabview)
        tabview.g_pinEdges()
    }
}
