//
//  TCBaseTabViewController.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import UIKit

class CWBaseTabViewController: UITabBarController {
    lazy var basedatasource: CWBaseTabDataSource? = nil
    
    lazy var basedelegate:  CWBaseTabDelegate? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hidesBottomBarWhenPushed = true
    }
    
 

}

extension CWBaseTabViewController {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let items = tabBar.items else {return}
        self.basedelegate?.didSelectedTabBar(at: items.firstIndex(of: item) ?? .zero)
        if items.firstIndex(of: item) == 3 {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
