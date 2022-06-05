//
//  AppInfoVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 5/8/22.
//

import UIKit

class AppInfoVC: UIViewController {

    @IBOutlet weak var dateLbl: UILabel!{
        didSet {
            dateLbl.text = "©Travel Agency 2022"
        }
    }
    @IBOutlet weak var createdByLbl: UILabel!{
        didSet {
            createdByLbl.text = "CreatedBy: Siddikjon Kuziboev"
        }
    }
    
    @IBOutlet weak var conView: UIView!{
        didSet {
            conView.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            conView.layer.shadowOffset = CGSize(width: 1, height: 1)
            conView.layer.shadowRadius = 3
            conView.layer.shadowOpacity = 0.7
        }
    }
    
    @IBOutlet weak var versionLbl: UILabel!{
        didSet {
            let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
            versionLbl.text = "Version: \(version ?? "1.0.1") "
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Travel Agency"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
      
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    

}
