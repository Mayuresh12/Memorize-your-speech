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
    let visibleText : [NSAttributedString.Key:Any]  = [ .font: UIFont(name: "Georgia", size: 28)!, .foregroundColor: UIColor.black]
    let invisibleText : [NSAttributedString.Key:Any]  = [ .font: UIFont(name: "Georgia", size: 28)!,
                                                          .foregroundColor: UIColor.clear,
                                                          .strikethroughStyle: 1,
                                                          .strikethroughColor: UIColor.black]
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert( item != nil, "you must provide item before showing the item")
        showText(for: item)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(wordsTapped))
        textView.addGestureRecognizer(tapRecognizer)
    }
    @objc func wordsTapped(){
        blankCounter += 1
        showText(for: item)
    }
   @discardableResult func showText(for memoryText: MemoryItem) -> NSAttributedString {
        let words = item.text.components(separatedBy: " ")
        let output = NSMutableAttributedString()
        let space = NSAttributedString(string: " ", attributes: visibleText)

      
        for(index, word) in words.enumerated(){
            if index < blankCounter{
                let attributedWord = NSAttributedString(string: "\(word)", attributes: visibleText)
                output.append(attributedWord)
            } else {
                var strippedWord = words
                var punctuation: String?
                
                if ".,".contains(word.last!) {
                    punctuation = String(strippedWord.removeLast())
                }
                let attributedWord = NSAttributedString(string: "\(strippedWord)", attributes: invisibleText)
                output.append(attributedWord)
                
                if let symbol = punctuation{
                    let attributtedPunctuation = NSAttributedString(string: symbol, attributes: visibleText)
                    output.append(attributtedPunctuation)
                }
            }
            output.append(space)
        }
        textView.attributedText = output
        return output

    }
    
}
