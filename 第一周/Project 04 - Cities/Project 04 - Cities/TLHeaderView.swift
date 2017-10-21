//
//  TLHeaderView.swift
//  Project 04 - Cities
//
//  Created by cqmlwlkj on 2017/10/21.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class TLHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var showBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.borderWidth = 1.0
        bgView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        bgView.layer.cornerRadius = 8.0
        
    }

}
