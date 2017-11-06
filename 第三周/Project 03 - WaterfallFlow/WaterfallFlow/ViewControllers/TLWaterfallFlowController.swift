//
//  TLWaterfallFlowController.swift
//  WaterfallFlow
//
//  Created by cqmlwlkj on 2017/11/5.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TLWaterfallFlowController: UICollectionViewController {

    var photos = Photo.allPhotos()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.backgroundColor = .clear
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)

        if let layout = collectionView?.collectionViewLayout as? WaterfallFlowLayout {
            layout.delegate = self
        }
    }
}

extension TLWaterfallFlowController: UICollectionViewDelegateFlowLayout, WaterfallFlowLayoutDelegate {
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return photos.count
        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! TLPhotoCell
            cell.photo = photos[indexPath.row]
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
            return CGSize(width: itemSize, height: itemSize)
        }
        
        func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
            
            return photos[indexPath.item].image!.size.height
        }
}
