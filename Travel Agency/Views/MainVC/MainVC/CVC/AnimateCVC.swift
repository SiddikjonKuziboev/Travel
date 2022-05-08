//
//  AnimateCVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/25/22.
//

import UIKit

class AnimateCVC: UICollectionViewCell {
    
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var countStarConView: UIView!
    @IBOutlet weak var starCountLbl: UILabel!
    @IBOutlet weak var locationOfPlaceLbl: UILabel!
    @IBOutlet weak var titleOfPlaceLbl: UILabel!
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

    func configureCell(data: LocationDM) {
        imgView.setImage(url: data.image)
        priceLbl.text = String.df2so(data.price) + "Sum"
        locationOfPlaceLbl.text = "O'zbekiston"
        titleOfPlaceLbl.text =  (data.desc ?? "")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        countStarConView.layer.cornerRadius = countStarConView.frame.height/2
        
    }
}
