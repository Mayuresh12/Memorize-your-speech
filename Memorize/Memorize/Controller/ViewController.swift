//
//  ViewController.swift
//  Memorize
//
//  Created by Mayuresh Rao on 8/16/20.
//  Copyright © 2020 Mayuresh Rao. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var items =  [MemoryItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
    
    func loadItems() {
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let item = items[indexPath.row]
        cell.detailTextLabel?.text = item.text
        cell.textLabel?.text = item.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "MemoryViewController") as? MemoryViewController else {
            fatalError("MemoryItem.json file not found")

        }
        let item = items[indexPath.row]
        vc.item = item
        navigationController?.pushViewController(vc, animated: true)
    }
}

