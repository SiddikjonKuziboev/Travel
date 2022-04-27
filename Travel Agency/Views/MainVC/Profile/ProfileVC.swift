//
//  ProfileVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/24/22.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.register(UINib(nibName: "CustomSectionHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "CustomSectionHeader")
            tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
            tableView.delegate = self
            tableView.dataSource = self
            tableView.sectionHeaderHeight = UITableView.automaticDimension
        }
    }
    
    var tableData: [String] = [
        "My orders",
        "Log out"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }


    
}

extension ProfileVC : UITableViewDataSource {
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = tableData[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomSectionHeader") as? CustomSectionHeader {
                if let data = Cache.getUserData() {
                    header.nameLbl.text = data.name + " " + (data.lastName ?? "")
                    header.phoneNumberLbl.text?.formatPhoneNumber(with: "+XXX XX XXX XX XX", phone: data.phoneNumber)
                 }
                
                return header
            }
        }
        
        return UIView()
    }
    
    
    
}

extension ProfileVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            print("o")
        default :
            logOutAlert()
            
        }
    }
 
    func logOutAlert() {
        let logOut: ((UIAlertAction) -> Void) = { action in
            var userData = Cache.getUserData()
            userData?.token = nil
            Cache.saveUserData(data: userData)
            UIWindow.goToLogin()
        }
        
        showSystemAlert(title: "Exit App", message: "", alertType: .alert, actionTitles: ["Yes","Cancel"], style: [.destructive, .cancel], actions: [logOut, nil])
    }
}
