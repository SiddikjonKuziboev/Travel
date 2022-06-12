//
//  AppDelegate.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/20/22.
//

import UIKit
import Firebase

let screenSize = UIScreen.main.bounds.size

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow()
        FirebaseApp.configure()
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
    
//        if let userDefData = Cache.getUserData(), userDefData.password != ""  {
            self.window?.rootViewController = TabBarController()
            
//        }else {
//            let vc = LoginVC(nibName: "LoginVC", bundle: nil)
//            let nav = UINavigationController(rootViewController: vc)
//            self.window?.rootViewController =  nav
//            
//        }
        self.window?.makeKeyAndVisible()

        return true

    }
    
}


