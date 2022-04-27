//
//  Ext+UIVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/25/22.
//

import UIKit

//MARK: - Alert shows
extension UIViewController {
    public func showSystemAlert(title: String?,
                          message: String?,
                          alertType: UIAlertController.Style,
                          actionTitles: [String?],
                          style: [UIAlertAction.Style],
                          actions: [((UIAlertAction) -> Void)?],
                          preferredActionIndex: Int? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: alertType)
        
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: style[index], handler: actions[index])
            alert.addAction(action)
        }
        
        if let preferredActionIndex = preferredActionIndex { alert.preferredAction = alert.actions[preferredActionIndex] }
        self.present(alert, animated: true, completion: nil)
    }
    
}
