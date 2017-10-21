//
//  TLLNamesListController.swift
//  Project 02 - NameList
//
//  Created by cqmlwlkj on 2017/10/13.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class TLLNamesListController: UITableViewController {

    let listData = ["A" : ["Abigail", "Adela", "Alice", "Amanda", "Arlene", "Audrey", "Aurora"], "B" : ["Belinda", "Bertha", "Bess", "Blanche"], "C" : ["Cara", "Cathy", "Cherry", "Clara", "Cynthia"], "F" : ["Fay", "Flora", "Freda"], "H" : ["Holland", "Hazel", "Honey", "Hulda"], "L" : ["Laura", "Laurel", "Lauren", "Lee", "Leila", "Leona", "Lilith", "Lillian", "Lisa", "Liz", "Louise", "Lynn"], "T" : ["Tabitha", "Tess", "Tiffany", "Tracy", "Truda"], "Z" : ["Zara", "Zenobia", "Zoe", "Zona", "Zora"]];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    private func getRowData(section: Int) -> Array<String> {
    
        // 强转为数组
        let keys = Array(listData.keys).sorted()
        // 获取 每个section的值（对应key的值）
        let values = listData[keys[section]]
        
        guard let rowData = values else {
            return []
        }
        return rowData
    }
    
    private func getSectionTitles() -> Array<String> {
        
        let keys = Array(listData.keys).sorted()
        return keys
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return Array(listData.keys).count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rowData = getRowData(section: section)
        
        return rowData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listID", for: indexPath)

        cell.textLabel?.text = getRowData(section: indexPath.section)[indexPath.row]

        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        return getSectionTitles()
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let keys = getSectionTitles()
        
        return keys[section]
    }
    
}
