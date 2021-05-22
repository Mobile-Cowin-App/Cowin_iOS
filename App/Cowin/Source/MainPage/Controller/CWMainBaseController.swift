//
//  CWMainBaseController.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit
import HelperKit

internal protocol CWPagingViewScrollerDelegate {
    func didChange(_ fromIndex: Int, _ toIndex: Int, _ percent: CGFloat) -> Void
    func didFinish(_ index: Int) -> Void
}

class CWMainBaseController: UIViewController {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var bottomHolderView: UIView!
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
        
        self.bottomHolderView.backgroundColor = UIColor.white
        self.bottomHolderView.layer.cornerRadius = 15.0
        self.bottomHolderView.clipsToBounds = true
        self.bottomHolderView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.bottomHolderView.layer.masksToBounds = true
    }
    
    func prepareViews() {
        let tabview: CWMainBaseTabView = CWMainBaseTabView.loadFromXib()
        
        tabview.selectedIndex = { (index) in
            self.pagecontroller.pushtoVC(index: index, animate: true)
        }
        
        self.tabHolderView.addSubview(tabview)
        tabview.g_pinEdges()
        
        self.pagecontroller.pagingScrollDelegate = self
    }
}

extension CWMainBaseController: CWPagingViewScrollerDelegate {
    
    func getTapView() -> CWMainBaseTabView? {
        guard let tabView = self.tabHolderView.subviews.first as? CWMainBaseTabView else { return nil }
        
        return tabView
    }
    
    func didChange(_ fromIndex: Int, _ toIndex: Int, _ percent: CGFloat) {
        self.getTapView()?.moveTab(fromIndex: fromIndex, toIndex: toIndex, percent: percent)
    }
    
    func didFinish(_ index: Int) {
        self.getTapView()?.endedState(index)
    }
}
