//
//  Extensions.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/21/22.
//

import UIKit


//MARK: - Mask example: +XXX (XX) XXX-XXXX
extension String {
    
    mutating func formatPhoneNumber(with mask: String, phone: String) {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator
        
        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])
                
                // move numbers iterator to the next index
                index = numbers.index(after: index)
                
            } else {
                result.append(ch) // just append a mask character
            }
        }
        self = result
    }
}


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

