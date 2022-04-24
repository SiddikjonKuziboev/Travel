//
//  Alert.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/24/22.
//

import Foundation
import UIKit
import AudioToolbox

class Alert {

    static var timer: Timer? = nil
    
    class func showAlert(state: AlertType, duration: TimeInterval = 4 ,  message: String) {
        let alertView = UIView(frame: CGRect(x: 0, y: -90, width: screenSize.width, height: 90))
        alertView.tag = 1998
        
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.textAlignment = .center
        title.text = message
        
        alertView.addSubview(title)
        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: alertView.leftAnchor, constant: 15),
            title.rightAnchor.constraint(equalTo: alertView.rightAnchor, constant: -15),
//            title.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 15),
            title.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -10)
        ])
        
        switch state {
        case .success:
            alertView.backgroundColor = .green
            
        case .warning:
            alertView.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 0.7456356832)
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))

        case .error:
            alertView.backgroundColor = .red
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))

        }
        
        if let keyWindow = UIWindow.keyWindows {
            if let oldAlertView = keyWindow.viewWithTag(1998){
                oldAlertView.removeFromSuperview()
            }
            keyWindow.addSubview(alertView)
        }
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn) {
            if let height = alertView.window?.windowScene?.statusBarManager?.statusBarFrame.height {
                alertView.transform = CGAffineTransform.init(translationX: 0, y: 90)

            }

        }
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swippedGesture))
        swipeGesture.direction = .up
        alertView.addGestureRecognizer(swipeGesture)
        
     
        timer = Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(swippedGesture), userInfo: nil, repeats: false)
        

    }

    @objc class func swippedGesture() {
        if let keyWindow = UIWindow.keyWindows, let alert = keyWindow.viewWithTag(1998) {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.6, options: .curveEaseIn) {
                alert.transform = .identity
            } completion: { _ in
                alert.removeFromSuperview()
            }

        }
    }
    
    enum AlertType {
        case success, warning, error
    }
}
