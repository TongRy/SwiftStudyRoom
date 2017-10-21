//
//  TLTableViewController.swift
//  Project 04 - Cities
//
//  Created by cqmlwlkj on 2017/10/21.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

private let headerID = "headerID"
private let cellID = "cellId"

class TLTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.register(UINib(nibName: "TLHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: headerID)
        tableView.sectionHeaderHeight = 50.0
        tableView.sectionFooterHeight = 15.0
    }

    private func setupData() {
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as? TLHeaderView
        
        headerView?.titleLab.text = "亚洲"
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}
