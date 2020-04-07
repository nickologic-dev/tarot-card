//
//  CardDetailViewController.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/20/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {

    @IBOutlet weak var cardView: CardCollectionDetailView?
    
    @IBOutlet weak var cardQuestionLabel: UILabel!
    
    @IBOutlet weak var cardTitleLabel: UILabel!
    
    @IBOutlet weak var detailBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cardTitleLabel.text = Global.APP_NAME
        self.cardQuestionLabel.text = Global.question
        
        self.detailBtnOutlet.layer.cornerRadius = 25.0
        
        self.cardView?.dataSource = self
        
        let cardNib = UINib(nibName: "CardDetailViewCell", bundle: nil)
        self.cardView?.register(cardNib, forCellWithReuseIdentifier : "detailCard")
        
        Global.selectCounter = 1
        
    }
    
    @IBAction func detailButton(_ sender: UIButton) {
        
    }
    
}

extension CardDetailViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3;
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCard", for: indexPath)
        let cardCell = cell as! CardDetailViewCell
        cardCell.cardDetailOutlet.setBackgroundImage(UIImage(named: Global.cards[indexPath.section + indexPath.row + 1] ?? ""), for: .normal)
        cardCell.cardLabel.text = Global.labels[indexPath.section + indexPath.row + 1]
        cardCell.cardNameLabel.text = Global.cards[indexPath.section + indexPath.row + 1]
        cardCell.cellNumber = indexPath.section + indexPath.row + 1
        return cardCell
    }
    
}
