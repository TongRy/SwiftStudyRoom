//
//  TLPhotoCell.swift
//  WaterfallFlow
//
//  Created by cqmlwlkj on 2017/11/5.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class TLPhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = true
    }
    
    var photo: Photo? {
        didSet {
            if let photo = photo {
                self.imageView.image = photo.image
            }
        }
    }
    
}
