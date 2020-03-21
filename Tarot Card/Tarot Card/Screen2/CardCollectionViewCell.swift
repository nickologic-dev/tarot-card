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
    
    @IBAction func cardBtn(_ sender: UIButton) {
        card.isEnabled = false
        
        DispatchQueue.main.async { [weak self] in
            self!.selectViewController?.selectCards()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
