//
//  PlaceDetailVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/28/22.
//

import UIKit


class PlaceDetailVC: UIViewController {
    @IBOutlet weak var placeNameLbl: UILabel!
    @IBOutlet weak var visaLbl: UILabel!
    @IBOutlet weak var sumLbl: UILabel!
    @IBOutlet weak var seasonLbl: UILabel!
    @IBOutlet weak var directionLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var peopleCountTF: UITextField!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var dayNumberLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    var placeData: LocationDM?
    var isFavorite: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleCountTF.delegate = self
        setData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func setData() {
        guard let placeData = placeData else {return}
        placeImageView.setImage(url: placeData.image)
        directionLbl.text = placeData.itenary
        descLbl.text = placeData.desc
        isFavorite = placeData.isLike
        setUpNavigation(bookMarkName: isFavorite ? "bookMarkFill" : "bookmark")
        placeNameLbl.text = placeData.itenary
        sumLbl.text = String.df2so(placeData.price)
        dayNumberLbl.text = "\(placeData.days)"
    }
    
    func setStar() {
        isFavorite = !isFavorite
        MyRealmData.shared.setLike(id: placeData?.id ?? 0)
    }
    
    @IBAction func orderBtnPressed(_ sender: Any) {
        let days = Int(peopleCountTF.text!) ?? 1
        let peopleCount = Int(peopleCountTF.text!) ?? 1
        

            MyFirestoreData.shared.setOrderToFirestore(
                data:
                    OrdersDM(
                        placeId: placeData?.id ?? 0,
                        customer: Cache.getUserData()?.name ?? "",
                        days: days,
                        people: peopleCount,
                        place:  placeData?.itenary ?? "",
                        price: (placeData?.price ?? 0.0)  * Double(peopleCount))
            )

    }
    
    @IBAction func viewAllBtnPressed(_ sender: Any) {
        let vc = WebViewVC()
        vc.webUrl = placeData?.moreWithWeb ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension PlaceDetailVC {
    
    func setUpNavigation(bookMarkName: String) {
        //RightIteam
        let bookmarkIteam = UIBarButtonItem(image: UIImage(named: bookMarkName), style: .done, target: self, action: #selector(bookmarkBtn))
        title = "Go'zal O'zbekistan"
        navigationItem.rightBarButtonItem = bookmarkIteam
    }
    
   
    
    @objc func bookmarkBtn() {
        setStar()
        setUpNavigation(bookMarkName: isFavorite ? "bookMarkFill" : "bookmark")
    }
    
}

//MARK: - TextFiled Delegate
extension PlaceDetailVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
