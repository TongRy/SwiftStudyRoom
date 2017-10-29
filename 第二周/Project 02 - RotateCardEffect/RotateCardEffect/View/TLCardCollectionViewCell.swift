//
//  TLCardCollectionViewCell.swift
//  RotateCardEffect
//
//  Created by cqmlwlkj on 2017/10/29.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class TLCardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - public API
    var card: Card! {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        titleLabel.text = card.title
        featuredImageView.image = card.featuredImage
    }
    
    // MARK: - 布局子控件
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
    }
}
