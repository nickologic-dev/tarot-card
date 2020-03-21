//
//  CardDetailViewController.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/20/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {

    @IBOutlet weak var cardQuestionLabel: UILabel!
    
    @IBOutlet weak var cardTitleLabel: UILabel!
    
    @IBAction func detailButton(_ sender: UIButton) {
        
    }
    
    @IBOutlet weak var detailBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cardTitleLabel.text = Global.APP_NAME
        self.cardQuestionLabel.text = Global.question
        
        //self.viewReadingOutlet.layer.cornerRadius = 25.0
    }
    
}
