//
//  Ext+Cell.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/25/22.
//

import UIKit

//MARK: Cell identifier
extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

extension UICollectionReusableView {
    static var identifier: String {
        String(describing: self)
    }
}
