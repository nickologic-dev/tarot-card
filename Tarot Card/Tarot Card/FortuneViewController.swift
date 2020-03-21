//
//  FortuneViewController.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/21/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class FortuneViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var cardImage: UIImageView!
    
    @IBOutlet weak var cardTypeLabel: UILabel!
    
    @IBOutlet weak var cardNameLabel: UILabel!
    
    @IBOutlet weak var fortuneText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
