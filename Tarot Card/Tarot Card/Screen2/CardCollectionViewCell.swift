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
    
    var selectViewController : SelectionViewController?
    
    var cellNumber: Int = 0
    
    @IBAction func cardBtn(_ sender: UIButton) {
        if (Global.selectCounter < 4) {
            card.isEnabled = false
            Global.cardDeck[cellNumber-1] = 1
        }
        
        DispatchQueue.main.async { [weak self] in
            self!.selectViewController?.selectCards()
        }
    }
    
    override func prepareForReuse() {
        self.card.isEnabled = true

        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
