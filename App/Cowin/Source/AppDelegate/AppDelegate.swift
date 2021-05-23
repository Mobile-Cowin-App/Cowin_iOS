//
//  AppDelegate.swift
//  Cowin
//
//


import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.initiateRootController()
        return true
    }
 

    
}

//MARK:- Booting RootController
extension AppDelegate {
    
    fileprivate func initiateRootController() {
        if CWUtility.authTocken.isEmpty {
            self.bootOnBoardScreen()
        } else {
            self.bootHomeScreen()
        }
    }
    
    fileprivate func bootOnBoardScreen() {
        let controller = UINavigationController(rootViewController: CWOnboardConfiguration.setup())
        controller.setNavigationBarHidden(true, animated: false)
        self.window?.rootViewController = controller
    }
    
    fileprivate func bootHomeScreen() {
        let controller = CWMainBaseControllerConfiguration.setup()
        self.window?.rootViewController = controller
    }
    
    
}

