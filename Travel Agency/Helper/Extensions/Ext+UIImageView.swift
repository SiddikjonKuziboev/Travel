//
//  Ext+UIImageView.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/27/22.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(url: String?) {
        guard let url = url else {return}
        let imgUrl = URL(string: url)
        self.sd_setImage(with: imgUrl, placeholderImage: UIImage(named: "splash"))
    }
}
