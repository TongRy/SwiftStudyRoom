//
//  ViewController.swift
//  BannerView
//
//  Created by cqmlwlkj on 2017/10/31.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    static let CellID = "cellID"
    
    // 懒加载 collectionView
    lazy var collectionView: UICollectionView = {() -> UICollectionView in
        
        var layout = TLHorizontalPageFlowlayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 50.0) / 4.0, height: 85)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: CGRect(origin: CGPoint(x: 0, y: 150), size: CGSize(width: UIScreen.main.bounds.size.width, height: 200)), collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.isPagingEnabled = true
        collection.backgroundColor = #colorLiteral(red: 0.8913698792, green: 0.9979686141, blue: 0.9112738967, alpha: 1)
        collection.showsHorizontalScrollIndicator = false
        
        return collection
    }()
    
    // 懒加载 pagecontrol
    lazy var pageControl: UIPageControl = { () -> UIPageControl in
        
        var pageCtr = UIPageControl(frame: CGRect(origin: CGPoint(x: 0, y: collectionView.frame.maxY + 20.0), size: CGSize(width: view.frame.size.width, height: 20)))
        pageCtr.numberOfPages = 2
        pageCtr.currentPageIndicatorTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        pageCtr.pageIndicatorTintColor = #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)
        
        return pageCtr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        // 注册
        collectionView.register(UINib(nibName: "TLCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ViewController.CellID)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.CellID, for: indexPath) as! TLCollectionViewCell
        cell.title.text = String(indexPath.row)
        return cell;
    }
    
}

extension ViewController : UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        // 减 10 是应该是偏移了 10
        let offset = Int(scrollView.contentOffset.x / (view.frame.size.width - 10))
        print(scrollView.contentOffset.x)
        pageControl.currentPage = offset
        
    }
}
