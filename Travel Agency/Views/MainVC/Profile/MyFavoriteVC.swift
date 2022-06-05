//
//  MyFavoriteVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/29/22.
//

import UIKit

class MyFavoriteVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var myFavorites: [LocationDM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            title = "My favorites"
        collectionView.register(UINib(nibName: AnimateCVC.identifier, bundle: nil), forCellWithReuseIdentifier: AnimateCVC.identifier)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.contentInset = UIEdgeInsets.init(top: 0, left: 30, bottom: 0, right: 30)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    
  
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateCellsLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        myFavorites.removeAll()
        fetchData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func fetchData() {
        let places = MyRealmData.shared.fetchData()
        for i in places where i.isLike {
            myFavorites.append(i)
        }
        collectionView.reloadData()
    }
    
    func updateCellsLayout()  {
        
        let centerX = collectionView.contentOffset.x + (collectionView.frame.size.width)/2
        for cell in collectionView.visibleCells {
            
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

extension MyFavoriteVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return myFavorites.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnimateCVC.identifier, for: indexPath) as! AnimateCVC
         cell.configureCell(data: myFavorites[indexPath.row])
        return cell
    }
}


//MARK: - CollectionView LayOut Delegate
extension MyFavoriteVC: UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PlaceDetailVC(nibName: "PlaceDetailVC", bundle: nil)
        vc.placeData = myFavorites[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cellSize: CGSize = collectionView.bounds.size
        
        cellSize.width -= collectionView.contentInset.left * 2.2
        cellSize.width -= collectionView.contentInset.right * 2.2
        cellSize.height = collectionView.frame.height
        
        return cellSize
        
    }
}

//MARK: DidScroll
extension MyFavoriteVC {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateCellsLayout()
        
    }
}
