//
//  ViewController.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/18/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let APP_NAME = "My Free Tarot"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = APP_NAME
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var refreshOutlet: UIButton!
    
    @IBOutlet weak var defaultDeckImage: UIImageView!
    
    @IBOutlet weak var enterQuestion: UITextField!
    
    @IBAction func refresh(_ sender: UIButton) {
        self.refreshOutlet.tintColor = UIColor.black //this turned it black on click
    }
    @IBAction func beginReading(_ sender: UIButton) {
    }
    @IBOutlet weak var titleLabel: UILabel!
}

