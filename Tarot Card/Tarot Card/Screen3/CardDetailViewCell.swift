//
//  CardDetailViewCell.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/20/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class CardDetailViewCell: UICollectionViewCell {

    @IBOutlet weak var cardLabel: UILabel!
    
    @IBOutlet weak var cardDetailOutlet: UIButton!
    
    @IBOutlet weak var cardNameLabel: UILabel!
    
    @IBAction func cardDetailBtn(_ sender: UIButton) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
