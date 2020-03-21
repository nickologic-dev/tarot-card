//
//  ViewController.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/18/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

struct Global {
    static let APP_NAME = "My Free Tarot"
    static var question = ""
    static var selectCounter = 1
}

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.titleLabel.text = Global.APP_NAME
        self.startButtonOutlet.layer.cornerRadius = 25.0
        self.refreshOutlet.tintColor = UIColor.gray
        self.refreshOutlet.isEnabled = false
    }

    @IBAction func canRefresh(_ sender: UITextField) {
        if (self.enterQuestion.text != "") {
            self.refreshOutlet.tintColor = UIColor.black
            self.refreshOutlet.isEnabled = true
        }
        else {
            self.refreshOutlet.tintColor = UIColor.gray
            self.refreshOutlet.isEnabled = false
        }
    }
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    @IBOutlet weak var refreshOutlet: UIButton!
    
    @IBOutlet weak var defaultDeckImage: UIImageView!
    
    @IBOutlet weak var enterQuestion: UITextField!
    
    @IBAction func refresh(_ sender: UIButton) {
        self.enterQuestion.text = ""
        self.refreshOutlet.tintColor = UIColor.gray
        self.refreshOutlet.isEnabled = false
    }
    
    @IBAction func beginReading(_ sender: UIButton) {
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
    
    @IBOutlet weak var titleLabel: UILabel!
}

