//
//  Photo.swift
//  WaterfallFlow
//
//  Created by cqmlwlkj on 2017/11/5.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

struct Photo {
    
    var image: UIImage?
    
    init(image: UIImage) {
        self.image = image
    }
    
    init?(dictionary: [String: String]) {
        guard let photo = dictionary["Photo"],
            let image = UIImage(named: photo) else {
                return nil
        }
        self.init(image: image)
    }
    
    static func allPhotos() -> [Photo] {
        var photos = [Photo]()
        guard let URL = Bundle.main.url(forResource: "Photos", withExtension: "plist"),
            let photosFromPlist = NSArray(contentsOf: URL) as? [[String:String]] else {
                return photos
        }
        for dictionary in photosFromPlist {
            if let photo = Photo(dictionary: dictionary) {
                photos.append(photo)
            }
        }
        return photos
    }
}
