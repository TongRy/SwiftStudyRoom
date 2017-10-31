//
//  Card.swift
//  RotateCardEffect
//
//  Created by cqmlwlkj on 2017/10/29.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class Card {

    // MARK: - Public API
    var title = ""
    var description = ""
    var featuredImage: UIImage!
    
    init(title: String, description: String, featuredImage: UIImage!)
    {
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
    }
    
    // MARK: - Private
    static func createCards() -> [Card]
    {
        return [
            Card(title: "We Love Traveling Around the World", description: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea.", featuredImage: UIImage(named: "r1")!),
            Card(title: "Romance Stories", description: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. ", featuredImage: UIImage(named: "r2")!),
            Card(title: "iOS Dev", description: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea.", featuredImage: UIImage(named: "r3")!),
            Card(title: "Race", description: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea.", featuredImage: UIImage(named: "r4")!),
            Card(title: "Personal Development", description: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea.", featuredImage: UIImage(named: "r5")!),
            Card(title: "Reading News", description: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea.", featuredImage: UIImage(named: "r6")!)
        ]
    }
}
