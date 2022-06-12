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
        
        tabBar.backgroundColor = .white
        self.tabBar.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        self.tabBar.layer.borderWidth = 0.2
        self.tabBar.clipsToBounds = false
        tabBar.tintColor = #colorLiteral(red: 0, green: 0.6980392157, blue: 0.9607843137, alpha: 1)
        
        //Home
        let homeNav = UINavigationController(rootViewController: MainVC(nibName: "MainVC", bundle: nil))
        homeNav.backBtn(nav: homeNav)
        homeNav.hideBar()
        homeNav.tabBarItem.image = UIImage(systemName: "house")
        
        //Home
        let hotels = UINavigationController(rootViewController: HotelsVC(nibName: "HotelsVC", bundle: nil))
        hotels.backBtn(nav: hotels)
        hotels.tabBarItem.image = UIImage(systemName: "building")
        
        //Home
        let rentCar = UINavigationController(rootViewController: RentCarVC(nibName: "RentCarVC", bundle: nil))
        rentCar.backBtn(nav: rentCar)
        rentCar.hideBar()
        rentCar.tabBarItem.image = UIImage(systemName: "car.2")
        
        //Profile
        let profile = UINavigationController(rootViewController: ProfileVC(nibName: "ProfileVC", bundle: nil))
        profile.backBtn(nav: profile)
        profile.hideBar()
        profile.tabBarItem.image = UIImage(systemName: "person.fill.viewfinder")
        viewControllers = [homeNav, hotels, rentCar, profile]
    }
}
