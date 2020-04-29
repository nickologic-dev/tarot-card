//
//  FortuneCollectionViewCell.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 4/27/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class FortuneCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var fortuneNameLabel: UILabel!
    @IBOutlet weak var fortune: UITextView!
    
    var cellNumber: Int = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fortuneNameLabel.text = Global.cardNames[cellNumber]
        fortuneNameLabel.font = UIFont(name: Font.SEMI_BOLD, size: 24)
        fortuneNameLabel.textColor = UIColor(named: Color.GREY_DEEP)
        fortune.text = Global.cardFortunes[cellNumber]
        
        fortune.font = UIFont(name: Font.MEDIUM, size: 16)
        fortune.textColor = UIColor(named: Color.GREY_DEEP)
    }

}
