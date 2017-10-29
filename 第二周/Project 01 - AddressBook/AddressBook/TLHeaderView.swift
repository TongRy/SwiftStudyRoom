//
//  TLHeaderView.swift
//  AddressBook
//
//  Created by cqmlwlkj on 2017/10/28.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class TLHeaderView: UITableViewHeaderFooterView {

    var titleLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(reuseIdentifier: String?) {
        
        super.init(reuseIdentifier: reuseIdentifier)
        titleLabel = UILabel()
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 13.0)
        titleLabel?.textColor = #colorLiteral(red: 0.4473443031, green: 0.2238349319, blue: 0.06814504415, alpha: 1)
        contentView.addSubview(titleLabel!)
        contentView.backgroundColor = #colorLiteral(red: 0.9648090005, green: 0.9568908811, blue: 0.9566555619, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.frame = CGRect(origin: CGPoint(x: 15, y: 0), size: CGSize(width: 300, height: frame.size.height))
    }
}
