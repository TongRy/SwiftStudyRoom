//
//  TLHomeController.swift
//  RotateCardEffect
//
//  Created by cqmlwlkj on 2017/10/29.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class TLHomeController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var cards = Card.createCards()
    
    fileprivate struct Storyboard {
        static let cellIdentifier = "CardCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // 状态栏颜色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - UICollectionViewDataSource
extension TLHomeController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.cellIdentifier, for: indexPath) as! TLCardCollectionViewCell
        
        cell.card = cards[indexPath.row]
        
        return cell
    }
}
<<<<<<< HEAD


=======
>>>>>>> f3596e30023a319a7fbf6920f31ee4e302125007
