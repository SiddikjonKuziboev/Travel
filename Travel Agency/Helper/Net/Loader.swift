//
//  Loader.swift
//  BookUz
//
//  Created by Kuziboev Siddikjon on 4/11/22.
//

import UIKit

public class Loader {

    class func start() {
        
        let loadView = UIView()
        loadView.tag = 19998
        loadView.frame = UIScreen.main.bounds
        loadView.backgroundColor = .clear
        loadView.isUserInteractionEnabled = false
        
        let animateView = UIView()
        animateView.translatesAutoresizingMaskIntoConstraints = false
        animateView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        
        loadView.addSubview(animateView)
        animateView.centerXAnchor.constraint(equalTo: loadView.centerXAnchor).isActive = true
        animateView.centerYAnchor.constraint(equalTo: loadView.centerYAnchor, constant: 150).isActive = true
        animateView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        animateView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        animateView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.352009249)
        animateView.layer.cornerRadius = 12
//        animateView.addShadow(offset: CGSize(width: 0, height: 1), color:#colorLiteral(red: 0.2392156863, green: 0.4078431373, blue: 1, alpha: 0.09302444963) , radius: 10, opacity: 1)
       
      
        UIWindow.keyWindows?.addSubview(loadView)        
        
        let activityIndacator = UIActivityIndicatorView()
        activityIndacator.translatesAutoresizingMaskIntoConstraints = false
        activityIndacator.color = #colorLiteral(red: 0, green: 0.6980392157, blue: 0.9607843137, alpha: 1)
        activityIndacator.startAnimating()
        activityIndacator.style = .large
        
        animateView.addSubview(activityIndacator)
        activityIndacator.leftAnchor.constraint(equalTo: animateView.leftAnchor, constant: 10).isActive = true
        activityIndacator.rightAnchor.constraint(equalTo: animateView.rightAnchor, constant: -10).isActive = true
        activityIndacator.topAnchor.constraint(equalTo: animateView.topAnchor, constant: 10).isActive = true
        activityIndacator.bottomAnchor.constraint(equalTo: animateView.bottomAnchor, constant: -10).isActive = true

    }
    
    
    
    class func stop() {
        
        if let views = UIWindow.keyWindows?.subviews {
            for v in views where v.tag == 19998 {
                
                v.removeFromSuperview()
            }
        }
        
    }



}
