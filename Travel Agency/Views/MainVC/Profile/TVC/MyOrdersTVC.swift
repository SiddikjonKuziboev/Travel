//
//  MyOrdersTVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 6/12/22.
//

import UIKit

class MyOrdersTVC: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    
    @IBOutlet weak var people: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(data: OrdersDM) {
        priceLbl.text = String.df2so(data.price) + " UZS"
        dayLbl.text = "\(data.days)"
        people.text = "\(data.people)"
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        if let date = formatter.date(from: data.date) {
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let stringdate = formatter.string(from: date)
            dateLbl.text = stringdate
        }
        
    }
}
