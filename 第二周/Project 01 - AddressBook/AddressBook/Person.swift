//
//  Person.swift
//  AddressBook
//
//  Created by cqmlwlkj on 2017/10/27.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name: String?
    var titleImageName: String?
    var email: String?
    var mobile: String?
    var notes: String?
    
    
    // 重载构造函数
    init(name: String, mobile: String, email: String, notes: String, titleImageName: String) {
    
        self.name = name
        self.mobile = mobile
        self.email = email
        self.notes = notes
        self.titleImageName = titleImageName
        
        super.init()
    }
    
    static func personsFromBundle() -> [String: [Person]] {
        
        var personDic = [String: [Person]]()
        
        
        guard let path = Bundle.main.path(forResource: "PhoneList", ofType: "plist"),
        let personPlist = NSArray(contentsOfFile: path) else {
            return personDic
        }
        
        for i in 0 ..< personPlist.count {
            let dict = personPlist[i] as! NSArray
            let key = String(i)
            var persons = [Person]()
            for personDic in dict {
                let person = Person(dictionary: personDic as! NSDictionary)
                persons.append(person)
            }
            personDic[key] = persons
        }
        
        return personDic
    }
    
    convenience init(dictionary: NSDictionary) {
        let name = dictionary["name"] as? String
        let mobile = dictionary["mobile"] as? String
        let email = dictionary["email"] as? String
        let notes = dictionary["notes"] as? String
        let titleImageName = dictionary["titleImageName"] as? String
        self.init(name: name ?? "", mobile: mobile ?? "", email: email ?? "", notes: notes ?? "", titleImageName: titleImageName ?? "")
    }
}
