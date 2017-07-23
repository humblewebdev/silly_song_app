//
//  ViewController.swift
//  Silly Song
//
//  Created by Thomas Veilleux on 1/24/17.
//  Copyright © 2017 Thomas Veilleux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func reset(_ sender: UITextField) {
        lyricsView.text = ""
        nameField.text = ""
    }

    @IBAction func displayLyrics(_ sender: UITextField) {
        if (!(nameField.text?.isEmpty)!) {
            lyricsView.text = lyricsFromName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        }
    }
    
    func shortNameFromName(name: String) -> String {
        let lowercaseName = name.lowercased()
        let vowelSet = CharacterSet(charactersIn: "aeiou")
        if let range = lowercaseName.rangeOfCharacter(from: vowelSet, options: .caseInsensitive) {
            return lowercaseName.substring(from: range.lowerBound)
        }
        return lowercaseName

    }
    
    func lyricsFromName(lyricsTemplate: String, fullName: String) -> String {
        return lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(name: fullName))
    }
}

