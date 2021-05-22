//
//  AppDelegate.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//


import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.bootOnBoardScreen()
        return true
    }
 

    
}

extension AppDelegate {
    
    fileprivate func bootOnBoardScreen() {
        let controller = UINavigationController(rootViewController: CWOnboardConfiguration.setup())
        controller.setNavigationBarHidden(true, animated: false)
        self.window?.rootViewController = controller
    }
    
    fileprivate func bootLoginScreen() {
        let controller = OTPLoginConfiguration.setup()
        self.window?.rootViewController = controller
    }
}

