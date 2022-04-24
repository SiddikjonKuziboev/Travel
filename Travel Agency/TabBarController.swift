//
//  TabBarController.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/21/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpVC()
    }
    

    func setUpVC() {
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.6980392157, blue: 0.9607843137, alpha: 1)], for:.selected)
        tabBar.backgroundColor = .white
        self.tabBar.layer.borderColor = #colorLiteral(red: 0, green: 0.6980392157, blue: 0.9607843137, alpha: 0.5466381351)
        self.tabBar.layer.borderWidth = 1
        self.tabBar.clipsToBounds = false
        
        //Home
        let homeNav = UINavigationController(rootViewController: MainVC(nibName: "MainVC", bundle: nil))
        homeNav.backBtn(nav: homeNav)
        homeNav.tabBarItem.image = UIImage(systemName: "house")
        
        //Home
        let hotels = UINavigationController(rootViewController: HotelsVC(nibName: "HotelsVC", bundle: nil))
        hotels.backBtn(nav: hotels)
        hotels.tabBarItem.image = UIImage(systemName: "building")
        
        //Home
        let rentCar = UINavigationController(rootViewController: RentCarVC(nibName: "RentCarVC", bundle: nil))
        rentCar.backBtn(nav: rentCar)
        rentCar.tabBarItem.image = UIImage(systemName: "car.2")
      
        viewControllers = [homeNav, hotels, rentCar]
    }
}
