//
//  RentCarVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/21/22.
//

import UIKit

class RentCarVC: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "RenCarTVC", bundle: nil), forCellReuseIdentifier: RenCarTVC.identifier)
            tableView.delegate  = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
        }
    }
    
    var cars: [CarDM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    
    func fetchData() {
        cars = CarDM.getCars()
        tableView.reloadData()
    }
}

extension RentCarVC: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  RenCarTVC.identifier, for: indexPath)as! RenCarTVC
        cell.configureCell(data: cars[indexPath.row])
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CarDetailsVC(nibName: "CarDetailsVC", bundle: nil)
        vc.car = cars[indexPath.row]
        present(vc, animated: true)
    }
    
    
    
}
