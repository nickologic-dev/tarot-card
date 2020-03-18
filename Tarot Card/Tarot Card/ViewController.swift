//
//  ViewController.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/18/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var defaultDeckImage: UIImageView!
    
    @IBOutlet weak var enterQuestion: UITextField!
    
    @IBAction func refresh(_ sender: UIButton) {
    }
    @IBAction func beginReading(_ sender: UIButton) {
    }
    @IBOutlet weak var titleLabel: UILabel!
}

