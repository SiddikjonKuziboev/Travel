//
//  Ext+UNC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/25/22.
//

import UIKit

//MARK: HideNavigationBar
extension UINavigationController {
    func hideBar(){
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
    }
    func backBtn(nav: UINavigationController?, name: String = "backArrow", tinColor: UIColor = UIColor.black) {
        let yourBackImage = UIImage(named: name)
        nav?.navigationBar.backIndicatorImage = yourBackImage
        nav?.navigationBar.topItem?.title = ""
        nav?.navigationBar.tintColor = tinColor
        nav?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
    }
}
