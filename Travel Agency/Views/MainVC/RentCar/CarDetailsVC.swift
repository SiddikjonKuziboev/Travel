//
//  CarDetailsVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 6/5/22.
//

import UIKit

class CarDetailsVC: UIViewController {
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var dvigatelLbl: UILabel!
    @IBOutlet weak var carColorLbl: UILabel!
    
   
    @IBOutlet weak var carType: UILabel!
    @IBOutlet weak var anyThinglbl: UILabel!
    @IBOutlet weak var transimssionLbl: UILabel!
    @IBOutlet weak var conditsionerLbl: UILabel!
    @IBOutlet weak var petrolTypeLbl: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    var car: CarDM?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let car = car {
            carType.text = car.name
            dvigatelLbl.text = "\(car.engineSize) m3"
            carColorLbl.text = car.carColor
            anyThinglbl.text = "Faol"
            transimssionLbl.text = car.transmission
            conditsionerLbl.text = "Mavjud"
            petrolTypeLbl.text = car.fuelType
            carImageView.setImage(url: car.image)
            priceLbl.text = String.df2so(car.price) + " UZS/kun dan boshlab"

   
        }
    }


    @IBAction func callBtnPressed(_ sender: Any) {
        
        if let url = URL(string: "tel://\(+998977670745)"),
        UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
        }
    }
    
    @IBAction func conditionsBtnPresed(_ sender: Any) {
        let vc = ConditionVC(nibName: "ConditionVC", bundle: nil)
        present(vc, animated: true)
    }
}
