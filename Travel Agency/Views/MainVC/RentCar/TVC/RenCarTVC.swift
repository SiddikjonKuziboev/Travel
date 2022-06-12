//
//  RenCarTVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 6/5/22.
//

import UIKit

class RenCarTVC: UITableViewCell {
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var carNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(data: CarDM) {
        carImageView.setImage(url: data.image)
        carNameLbl.text = data.name
        priceLbl.text = String.df2so(data.price) + " UZS/kun dan boshlab"
    }
}
