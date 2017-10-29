//
//  TLTableViewController.swift
//  AddressBook
//
//  Created by cqmlwlkj on 2017/10/26.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit
let cellID = "cellID"

class TLTableViewController: UITableViewController {

    let persons = Person.personsFromBundle()
    let titles = ["RECENT", "FRIENDS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 60.0
        tableView.sectionHeaderHeight = 40.0
//        tableView.register(UINib.init(nibName: "TLPersonListCell", bundle: nil), forCellReuseIdentifier: cellID)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return titles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons[String(section)]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TLPersonListCell

        let datas = persons[String(indexPath.section)]
        let person = datas?[indexPath.row]
        cell.imgView.image = UIImage(named: person?.titleImageName ?? "")
        cell.titleLabel.text = person?.name ?? ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = TLHeaderView(reuseIdentifier: "headerID")
        header.titleLabel?.text = titles[section]
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "pushToDetail", sender: indexPath)
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! TLDetailController
        
        guard let indexpath = sender as? IndexPath else {
            return
        }
        
        vc.person = persons[String(indexpath.section)]?[indexpath.row]
        
    }
 
}

