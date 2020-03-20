//
//  CardCollectionViewCell.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/19/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var card: UIButton!
    
    @IBAction func cardBtn(_ sender: UIButton) {
        card.isEnabled = false
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
