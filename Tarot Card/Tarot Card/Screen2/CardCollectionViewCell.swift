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
    
    @IBOutlet weak var border: UIView!
    
    var selectViewController : SelectionViewController?
    
    var cellNumber: Int = 0
    
    @IBAction func cardBtn(_ sender: UIButton) {
        if (Global.selectCounter < 4) {
            card.isEnabled = false
            card.setImage(UIImage(named: "selectedCard"), for: UIControl.State.disabled)
            border.layer.borderWidth = 0.0
            Global.cardDeck[cellNumber-1] = 1
        }
        
        DispatchQueue.main.async { [weak self] in
            self!.selectViewController?.selectCards()
        }
    }
    
    override func prepareForReuse() {
        self.card.isEnabled = true
        border.layer.borderWidth = 1.0

        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        border.layer.borderWidth = 1.0
        border.layer.borderColor = UIColor(named: Color.GREY_MEDIUM)?.cgColor
        border.layer.cornerRadius = 5.0
    }
}
