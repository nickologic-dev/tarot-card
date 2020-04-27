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
    
    @IBOutlet weak var fortuneView: FortuneCollectionView?
    
    var curIndex : Int = 0
    
    @IBOutlet weak var selfOutlet: UIButton!
    @IBOutlet weak var situationOutlet: UIButton!
    @IBOutlet weak var challengeOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fortuneView?.dataSource = self
        let cardNib = UINib(nibName: "FortuneCollectionViewCell", bundle: nil)
        self.fortuneView?.register(cardNib, forCellWithReuseIdentifier : "fortune")
        
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

 extension FortuneViewController : UICollectionViewDataSource {
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 3;
     }

     func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1;
     }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fortune", for: indexPath)
         Global.chosenCard = indexPath.section + indexPath.row + 1
         let cardCell = cell as! FortuneCollectionViewCell
         
         return cardCell
     }
     
 }
