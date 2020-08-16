//
//  ViewController.swift
//  Memorize
//
//  Created by Mayuresh Rao on 8/16/20.
//  Copyright © 2020 Mayuresh Rao. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let dataSource = MemoryDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "MemoryViewController") as? MemoryViewController else {
            fatalError("MemoryItem.json file not found")

        }
        let item = dataSource.item(at: indexPath.row)
        vc.item = item
        navigationController?.pushViewController(vc, animated: true)
    }
}

