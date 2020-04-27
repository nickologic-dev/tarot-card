//
//  CardDetailViewCell.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/20/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class CardDetailViewCell: UICollectionViewCell {
    
    @IBOutlet weak var borderView: UIView!
    
    @IBOutlet weak var cardDetailOutlet: UIButton!
    
    @IBOutlet weak var cardNameLabel: UILabel!
    
    var cellNumber: Int = 0
    
    @IBAction func cardDetailBtn(_ sender: UIButton) {
        Global.chosenCard = cellNumber
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        cardNameLabel.font = UIFont(name: Font.SEMI_BOLD, size: 25)
        // Initialization code
        borderView.layer.borderWidth = 1.0
        borderView.layer.borderColor = UIColor(named: Color.GREY_MEDIUM)?.cgColor
        borderView.layer.cornerRadius = 10.0
    }

}
