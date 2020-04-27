//
//  FortuneViewController.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/21/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class FortuneViewController: UIViewController {
    
    @IBOutlet weak var cardNameLabel: UILabel!
    
    @IBOutlet weak var fortuneText: UITextView!
    
    @IBOutlet weak var selfOutlet: UIButton!
    @IBOutlet weak var situationOutlet: UIButton!
    @IBOutlet weak var challengeOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardNameLabel.text = Global.cardNames[Global.chosenCard]
        cardNameLabel.font = UIFont(name: Font.SEMI_BOLD, size: 24)
        cardNameLabel.textColor = UIColor(named: Color.GREY_DEEP)
        
        selfOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 16)
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.disabled)
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
        
        situationOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 16)
        situationOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        
        challengeOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 16)
        challengeOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
    }
    
}
