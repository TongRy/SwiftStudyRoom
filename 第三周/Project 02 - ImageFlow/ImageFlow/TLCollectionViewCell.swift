//
//  TLCollectionViewCell.swift
//  ImageFlow
//
//  Created by cqmlwlkj on 2017/11/3.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class TLCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: String? {
        didSet{
            guard let imageName = image else { return }
            imageView.image = UIImage(named: imageName)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10.0
//        self.layer.masksToBounds = true
//        self.clipsToBounds = true
    }
    
}
