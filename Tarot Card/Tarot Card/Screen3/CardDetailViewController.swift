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
    
    @IBOutlet weak var detailBtnOutlet: UIButton!
    
    @IBOutlet weak var selfOutlet: UIButton!
    @IBOutlet weak var situationOutlet: UIButton!
    @IBOutlet weak var challengeOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailBtnOutlet.layer.cornerRadius = 25.0
        
        self.cardView?.dataSource = self
        
        let cardNib = UINib(nibName: "CardDetailViewCell", bundle: nil)
        self.cardView?.register(cardNib, forCellWithReuseIdentifier : "detailCard")
        
        selfOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 16)
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.disabled)
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
        
        situationOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 16)
        situationOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        
        challengeOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 16)
        challengeOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
    }
    
    @IBAction func selfBtn(_ sender: Any) {
        DispatchQueue.main.async {
            let indexPath = NSIndexPath(row: 0, section: 0)
            self.cardView?.scrollToItem(at: indexPath as IndexPath, at: .centeredHorizontally, animated: true)
        }
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
        situationOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        challengeOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
    }
    
    @IBAction func situationBtn(_ sender: Any) {
        DispatchQueue.main.async {
            let indexPath = NSIndexPath(row: 1, section: 0)
            self.cardView?.scrollToItem(at: indexPath as IndexPath, at: .centeredHorizontally, animated: true)
        }
        situationOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        challengeOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
    }
    
    @IBAction func challengeBtn(_ sender: Any) {
        DispatchQueue.main.async {
            let indexPath = NSIndexPath(row: 2, section: 0)
            self.cardView?.scrollToItem(at: indexPath as IndexPath, at: .centeredHorizontally, animated: true)
        }
        challengeOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
        situationOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
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
        Global.chosenCard = indexPath.section + indexPath.row + 1
        let cardCell = cell as! CardDetailViewCell
        cardCell.cardDetailOutlet.setBackgroundImage(UIImage(named: Global.cards[indexPath.section + indexPath.row + 1] ?? ""), for: .normal)
        cardCell.cardNameLabel.text = Global.cardNames[indexPath.section + indexPath.row + 1]
        cardCell.cellNumber = indexPath.section + indexPath.row + 1
        
        return cardCell
    }
    
}
