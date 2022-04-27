//
//  Ext+UIWindow.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/24/22.
//


import UIKit
//MARK: UiWindow
extension UIWindow {
    
    class func goToMainTabbar() {
        if let keyWindow = keyWindows {
            keyWindow.rootViewController = TabBarController()
            keyWindow.makeKeyAndVisible()
        }
    }
    
    static func goToLogin() {
        if let keyWindow = keyWindows {
            let vc = LoginVC(nibName: "LoginVC", bundle: nil)
//            Cache.saveToken(nil)
            keyWindow.rootViewController = UINavigationController.init(rootViewController: vc)
        }
    }
    
    static let keyWindows = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .compactMap({$0 as? UIWindowScene})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    
}
