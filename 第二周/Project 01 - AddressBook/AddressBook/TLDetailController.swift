//
//  TLDetailController.swift
//  AddressBook
//
//  Created by cqmlwlkj on 2017/10/28.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class TLDetailController: UIViewController {

    @IBOutlet weak var headImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headImg.layer.cornerRadius = 40.0
        headImg.clipsToBounds = true
        
        if person != nil {
            headImg.image = UIImage(named: person?.titleImageName ?? "")
            nameLabel.text = person?.name
            mobileLabel.text = person?.mobile
            emailLabel.text = person?.email
            notesLabel.text = person?.notes
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
