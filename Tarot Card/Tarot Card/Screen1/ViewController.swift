//
//  ViewController.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/18/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var startButtonOutlet: UIButton!
    
    @IBOutlet weak var refreshOutlet: UIButton!
    
    @IBOutlet weak var defaultDeckImage: UIImageView!
    
    @IBOutlet weak var enterQuestion: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.titleLabel.text = Global.APP_NAME
        self.startButtonOutlet.layer.cornerRadius = 25.0
        self.refreshOutlet.tintColor = UIColor.gray
        self.refreshOutlet.isEnabled = false
        
        // dismiss keyboard on tap
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // dismiss keyboard on return
        enterQuestion.delegate = self
        enterQuestion.layer.cornerRadius = 8.0
        enterQuestion.layer.masksToBounds = true
        enterQuestion.layer.borderWidth = 1.0
        enterQuestion.layer.borderColor = UIColor.lightGray.cgColor
        enterQuestion.font = UIFont(name: Font.REGULAR, size: 14)
    }
    
    @IBAction func selectTextField(_ sender: Any) {
        enterQuestion.layer.borderColor = UIColor(named: Color.GOLD_PRIME)?.cgColor
        enterQuestion.placeholder = ""
    }
    
    func textFieldShouldReturn(_ enterQuestion: UITextField) -> Bool {
        self.view.endEditing(true)
        if (enterQuestion.text == "") {
            enterQuestion.layer.borderColor = UIColor.lightGray.cgColor
            enterQuestion.placeholder = "Enter your question (optional)"
        }
        return true
    }
    
    @objc func dismissKeyboard() {
        if (enterQuestion.text == "") {
            enterQuestion.layer.borderColor = UIColor.lightGray.cgColor
            enterQuestion.placeholder = "Enter your question (optional)"
        }
        view.endEditing(true)
    }

    @IBAction func canRefresh(_ sender: UITextField) {
        enterQuestion.layer.borderColor = UIColor(named: Color.GOLD_PRIME)?.cgColor
        if (self.enterQuestion.text != "") {
            self.refreshOutlet.tintColor = UIColor.black
            self.refreshOutlet.isEnabled = true
        }
        else {
            self.refreshOutlet.tintColor = UIColor.gray
            self.refreshOutlet.isEnabled = false
        }
    }
    
    @IBAction func refresh(_ sender: UIButton) {
        self.enterQuestion.text = ""
        enterQuestion.layer.borderColor = UIColor.lightGray.cgColor
        enterQuestion.placeholder = "Enter your question (optional)"
        self.refreshOutlet.tintColor = UIColor.gray
        self.refreshOutlet.isEnabled = false
    }
    
    @IBAction func beginReading(_ sender: UIButton) {
        Global.selectCounter = 1
        Global.cardDeck = [Int](repeating: 0, count: 78)
        if (self.enterQuestion.text != nil) {
            self.enterQuestion.text = self.enterQuestion.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            if (self.enterQuestion.text?.last == "?") {
                self.enterQuestion.text = String(self.enterQuestion.text?.dropLast() ?? "")
            }
        }
        if (self.enterQuestion.text != "") {
            Global.question = "\"\(enterQuestion.text ?? "")?\""
        } else {
            Global.question = ""
        }
    }
    
}

