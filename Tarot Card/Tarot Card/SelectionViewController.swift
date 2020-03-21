//
//  SelectionViewController.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/19/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var cardDeckView : CardCollectionView?
    
    @IBOutlet weak var selfImage: UIImageView!
    
    @IBOutlet weak var situationImage: UIImageView!
    
    @IBOutlet weak var challengeImage: UIImageView!
    
    @IBOutlet weak var viewReadingOutlet: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    // DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 72;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardcell", for: indexPath)
        let cardCell = cell as! CardCollectionViewCell
        cardCell.selectViewController = self
        return cell
    }
    
    // --------

    override func viewDidLoad() {
        super.viewDidLoad()
        self.borderStyle()
        
        self.view.backgroundColor = UIColor.white
        
        self.titleLabel.text = Global.APP_NAME
        self.questionLabel.text = Global.question
        
        self.viewReadingOutlet.layer.cornerRadius = 25.0
        self.viewReadingOutlet.isEnabled = false
        self.viewReadingOutlet.backgroundColor = UIColor.lightGray
        
        self.selfImage.image = UIImage(systemName: "questionmark")
        self.situationImage.image = UIImage(systemName: "questionmark")
        self.challengeImage.image = UIImage(systemName: "questionmark")
        
        let cardCellNib = UINib(nibName: "CardCollectionViewCell", bundle: nil)
        self.cardDeckView?.register(cardCellNib, forCellWithReuseIdentifier : "cardcell")
    }
    
    override func awakeFromNib() {
        let cardCellNib = UINib(nibName: "CardCollectionViewCell", bundle: nil)
        self.cardDeckView?.register(cardCellNib, forCellWithReuseIdentifier : "cardcell")
    }
    
    func borderStyle() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.black;
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    func selectCards() {
        if (Global.selectCounter == 1) {
            self.selfImage.image = UIImage(named: "square")
        } else if (Global.selectCounter == 2) {
            situationImage.image = UIImage(named: "circle")
        } else if (Global.selectCounter == 3) {
            challengeImage.image = UIImage(named: "triangle")
            viewReadingOutlet.isEnabled = true
            viewReadingOutlet.backgroundColor = UIColor.black
            Global.selectCounter = 0
        }
        Global.selectCounter += 1
    }
    
    @IBAction func viewReadingBtn(_ sender: UIButton) {
    }
    
}
