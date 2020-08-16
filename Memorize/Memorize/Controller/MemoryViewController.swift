//
//  MemoryViewController.swift
//  Memorize
//
//  Created by Mayuresh Rao on 8/16/20.
//  Copyright © 2020 Mayuresh Rao. All rights reserved.
//

import UIKit

class MemoryViewController: UIViewController {

    var item: MemoryItem!
    var blankCounter = 0
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        assert( item != nil, "you must provide item before showing the item")
        showText()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(wordsTapped))
        textView.addGestureRecognizer(tapRecognizer)
    }
    @objc func wordsTapped(){
        blankCounter += 1
        showText()
    }
    func showText() {
        let words = item.text.components(separatedBy: " ")
        var output = ""
        for(index, word) in words.enumerated()
        {
            if index < blankCounter{
                output += "\(word)"
            } else {
                let blank = String(repeating: "_", count: word.count)
                output.append("\(blank)")
            }
        }
        textView.text = output
    }

}
