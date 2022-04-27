//
//  MainVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/20/22.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var animateCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateCellsLayout()
        
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
            return 10
        }else {
            return 12
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if topCollectionView == collectionView {
            let cell = topCollectionView.dequeueReusableCell(withReuseIdentifier: TopCVC.identifier, for: indexPath)as! TopCVC
            
            return cell
            
        }else {
            let cell = animateCollectionView.dequeueReusableCell(withReuseIdentifier: AnimateCVC.identifier, for: indexPath)as! AnimateCVC
            
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if topCollectionView == collectionView {
            
        }else {
            
        }
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
