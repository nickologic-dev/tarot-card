//
//  CardDetailViewController.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/20/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {

    @IBOutlet weak var cardView: CardDetailView?
    
    @IBOutlet weak var cardQuestionLabel: UILabel!
    
    @IBOutlet weak var cardTitleLabel: UILabel!
    
    @IBOutlet weak var detailBtnOutlet: UIButton!
    
    // DataSource
      
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 3;
      }
      
      func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 1;
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath)
          return cardCell
      }
      
    // --------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cardTitleLabel.text = Global.APP_NAME
        self.cardQuestionLabel.text = Global.question
        
        self.detailBtnOutlet.layer.cornerRadius = 25.0
        
        let cardNib = UINib(nibName: "CardDetailViewCell", bundle: nil)
        self.cardView?.register(cardNib, forCellWithReuseIdentifier : "card")
    }
    
    override func awakeFromNib() {
        let cardNib = UINib(nibName: "CardDetailViewCell", bundle: nil)
        self.cardView?.register(cardNib, forCellWithReuseIdentifier : "card")
    }
    
    @IBAction func detailButton(_ sender: UIButton) {
        
    }
    
}
