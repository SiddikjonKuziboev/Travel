//
//  MainVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/20/22.
//

import UIKit
import RealmSwift
import Firebase

class MainVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var animateCollectionView: UICollectionView!
    
    
    var locations: [LocationDM ] = []
    var topLocations: [LocationDM] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateCellsLayout()
    }
    
    func getData() {
//        MyRealmData.shared.removeLocations()
        for i in MyRealmData.shared.fetchData() {
            if i.slogan == "tourist" {
                topLocations.append(i)
            }else {
                locations.append(i)
            }
        }
        if locations == [] {
           
            let sampleRecordObj = LocationDM.getLocations()
                for i in sampleRecordObj {
                
                    let cordinate = CoordinateDM()
                    cordinate.lon = i.coordinate?.lon ?? 0.0
                    cordinate.lat = i.coordinate?.lat ?? 0.0
                    let location = LocationDM()
                    location.itenary = i.itenary
                    location.desc = i.desc
                    location.moreWithWeb = i.moreWithWeb
                    location.coordinate = cordinate
                    location.image = i.image
                    location.id = i.id
                    location.price = i.price
                    location.slogan = i.slogan
                    MyRealmData.shared.saveLocations(data: location)
                }
            
            for i in MyRealmData.shared.fetchData() {
                if i.slogan == "tourist" {
                    topLocations.append(i)
                }else {
                    locations.append(i)
                }
            }
            
            topCollectionView.reloadData()
            animateCollectionView.reloadData()
        }
     
    }
}

//MARK: CollectionView SetupUI
extension MainVC {
    
    func setUpCollectionView() {
        
        topCollectionView.register( UINib(nibName: "TopCVC", bundle: nil), forCellWithReuseIdentifier: TopCVC.identifier)
        topCollectionView.delegate  = self
        topCollectionView.dataSource = self
        topCollectionView.contentInset = UIEdgeInsets(top: 0, left: 9, bottom: 0, right: 9)
        
        
        //Big CollectionView
        animateCollectionView.register(UINib(nibName: "AnimateCVC", bundle: nil), forCellWithReuseIdentifier: AnimateCVC.identifier)
        animateCollectionView.delegate = self
        animateCollectionView.dataSource = self
        animateCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        animateCollectionView.contentInset = UIEdgeInsets.init(top: 0, left: 30, bottom: 0, right: 30)
    }
    
    
    func updateCellsLayout()  {
        
        let centerX = animateCollectionView.contentOffset.x + (animateCollectionView.frame.size.width)/2
        for cell in animateCollectionView.visibleCells {
            
            var offsetX = centerX - cell.center.x
            if offsetX < 0 {
                offsetX *= -1
            }
            cell.transform = CGAffineTransform.identity
            let offsetPercentage = offsetX / (view.bounds.width * 2.7)
            let scaleX = 1-offsetPercentage
            cell.transform = CGAffineTransform(scaleX: scaleX, y: scaleX)
        }
    }
}


//MARK: CollectionView DataSource
extension MainVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if topCollectionView == collectionView {
            return topLocations.count
        }else {
            return locations.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if topCollectionView == collectionView {
            let cell = topCollectionView.dequeueReusableCell(withReuseIdentifier: TopCVC.identifier, for: indexPath)as! TopCVC
            cell.imgView.setImage(url: topLocations[indexPath.row].image)
            return cell
            
        }else {
            let cell = animateCollectionView.dequeueReusableCell(withReuseIdentifier: AnimateCVC.identifier, for: indexPath)as! AnimateCVC
            cell.configureCell(data: locations[indexPath.row])
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = PlaceDetailVC(nibName: "PlaceDetailVC", bundle: nil)
        if topCollectionView == collectionView {
            vc.placeData = topLocations[indexPath.row]
        }else {
            vc.placeData = locations[indexPath.row]
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
   
}

//MARK: - CollectionView LayOut Delegate
extension MainVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topCollectionView {
            return CGSize(width: (topCollectionView.frame.height-5),height: (topCollectionView.frame.height-5))
        }else {
            
            var cellSize: CGSize = animateCollectionView.bounds.size
            
            cellSize.width -= animateCollectionView.contentInset.left * 2.2
            cellSize.width -= animateCollectionView.contentInset.right * 2.2
            cellSize.height = animateCollectionView.frame.height
            
            return cellSize
        }
    }
}

//MARK: DidScroll
extension MainVC {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateCellsLayout()
        
    }
}
