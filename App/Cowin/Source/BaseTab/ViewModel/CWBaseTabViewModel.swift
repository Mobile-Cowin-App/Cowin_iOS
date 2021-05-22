//
//  CWBaseTabViewModel.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation
import UIKit

internal protocol CWBaseTabDataSource {
    func prepareTabViewController() -> [UIViewController]
}

internal protocol  CWBaseTabDelegate {
    func didSelectedTabBar(at index: Int)
}

internal class CWBaseTabViewModel: CWBaseTabDataSource {
    
    func prepareTabViewController() -> [UIViewController] {
        
        let controllers: [UIViewController] = [self.preparHomeViewController() ,
                                               self.prepareStatsViewController() ,
                                               self.prepareBookingViewController() ,
                                               self.prepareProfileViewController() ]
        return controllers
    }
    
}


extension CWBaseTabViewModel {
    
    fileprivate func preparHomeViewController() -> UIViewController {
        let controller = CWHomeConfiguration.setup()
        return controller.appendWithNavigation()
    }
    
    fileprivate func prepareStatsViewController() -> UIViewController {
        let controller = CWStatsConfiguration.setup()
        return controller.appendWithNavigation()
    }
    
    fileprivate func prepareBookingViewController() -> UIViewController {
        let controller = CWBookingConfiguration.setup()
        return controller.appendWithNavigation()
    }
    
    fileprivate func prepareProfileViewController() -> UIViewController {
        let controller = CWProfileConfiguration.setup()
        return controller.appendWithNavigation()
    }
    
    
}
 
extension CWBaseTabViewModel: CWBaseTabDelegate {
    
    func didSelectedTabBar(at index: Int) {
        
    }
    
}
