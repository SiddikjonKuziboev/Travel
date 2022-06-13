//
//  MyOrdersVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 6/12/22.
//

import UIKit
import FirebaseFirestore

class MyOrdersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "MyOrdersTVC", bundle: nil), forCellReuseIdentifier: "MyOrdersTVC")
        }
    }
    var  db: [OrdersDM] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
        Loader.start()
        MyFirestoreData.shared.getMyOrders(completion: { d in
            guard let d  = d else{return}
            self.db = d
            Loader.stop()
            self.tableView.reloadData()
        })
       
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
extension MyOrdersVC : UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        db.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyOrdersTVC", for: indexPath) as! MyOrdersTVC
        cell.configureCell(data: db[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
}
