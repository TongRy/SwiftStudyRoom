//
//  TLPersonListCell.swift
//  AddressBook
//
//  Created by cqmlwlkj on 2017/10/28.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class TLPersonListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgView.layer.cornerRadius = 20.0
        imgView?.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
