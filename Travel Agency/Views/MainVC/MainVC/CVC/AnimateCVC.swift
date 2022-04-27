//
//  AnimateCVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/25/22.
//

import UIKit

class AnimateCVC: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!{
        didSet {
            imgView.layer.cornerRadius = 12
            imgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
