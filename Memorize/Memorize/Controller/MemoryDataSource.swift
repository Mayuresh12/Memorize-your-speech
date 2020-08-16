//
//  MemoryDataSource.swift
//  Memorize
//
//  Created by Mayuresh Rao on 8/16/20.
//  Copyright © 2020 Mayuresh Rao. All rights reserved.
//

import UIKit

class MemoryDataSource: NSObject,UITableViewDataSource {
    var items =  [MemoryItem]()

    override init() {
        guard let url = Bundle.main.url(forResource: "MemoryItems", withExtension: "json") else {
            fatalError("MemoryItem.json file not found")
        }
        guard let data = try? Data(contentsOf: url)
            else {
                fatalError("MemoryItem.json file not found")

        }
        let decoder = JSONDecoder()
        guard  let saveditems = try? decoder.decode([MemoryItem].self, from: data) else {
                            fatalError("MemoryItem.json file not found")

        }
        items = saveditems
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let item = items[indexPath.row]
        cell.detailTextLabel?.text = item.text
        cell.textLabel?.text = item.title
        return cell
    }
    
    func item(at index: Int) -> MemoryItem {
        return items[index]
    }
}
