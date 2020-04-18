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
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var selfBorder: UIView!
    
    @IBOutlet weak var challengeBorder: UIView!
    
    @IBOutlet weak var situationBorder: UIView!
    
    @IBOutlet weak var selfLabel: UILabel!
    
    @IBOutlet weak var situationLabel: UILabel!
    
    @IBOutlet weak var challengeLabel: UILabel!
    // DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 78;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardcell", for: indexPath)
        let cardCell = cell as! CardCollectionViewCell
        cardCell.selectViewController = self
        
        cardCell.cellNumber = indexPath.section + indexPath.row + 1
        if (Global.cardDeck[cardCell.cellNumber-1] == 1) {
            cardCell.card.isEnabled = false
            cardCell.card.setImage(UIImage(named: "selectedCard"), for: UIControl.State.disabled)
            cardCell.border.layer.borderWidth = 0.0
        }
    
        
        return cell
    }
    
    // --------

    override func viewDidLoad() {
        super.viewDidLoad()
        self.borderStyle()
        
        self.view.backgroundColor = UIColor.white
        
        self.questionLabel.text = Global.question
        self.questionLabel.font = UIFont(name: Font.ITALIC, size: 18)
        self.questionLabel.textColor =  UIColor(hex: Color.GREY)
        
        self.viewReadingOutlet.layer.cornerRadius = 6.0
        self.viewReadingOutlet.isEnabled = false
        viewReadingOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 21)
        viewReadingOutlet.setTitleColor(UIColor(named: Color.GREY), for: UIControl.State.disabled)
        viewReadingOutlet.setTitleColor(UIColor.white, for: UIControl.State.normal)
        viewReadingOutlet.setTitleColor(UIColor(named: Color.GOLD_LIGHT), for: UIControl.State.highlighted)
        
        self.selfImage.image = UIImage(named: "cardShelf")
        self.situationImage.image = UIImage(named: "cardShelf")
        self.challengeImage.image = UIImage(named: "cardShelf")
        
        selfBorder.layer.borderWidth = 2.0
        selfBorder.layer.borderColor = UIColor(named: Color.GOLD_PRIME)?.cgColor
        selfBorder.layer.cornerRadius = 6
        
        //Montserrat / Medium / 12 / #333333 / centred
        selfLabel.font = UIFont(name: Font.MEDIUM, size: 12)
        situationLabel.font = UIFont(name: Font.MEDIUM, size: 12)
        challengeLabel.font = UIFont(name: Font.MEDIUM, size: 12)
        
        
        let cardCellNib = UINib(nibName: "CardCollectionViewCell", bundle: nil)
        self.cardDeckView?.register(cardCellNib, forCellWithReuseIdentifier : "cardcell")
        
        Global.selectCounter = 1
    }
    
    override func awakeFromNib() {
        let cardCellNib = UINib(nibName: "CardCollectionViewCell", bundle: nil)
        self.cardDeckView?.register(cardCellNib, forCellWithReuseIdentifier : "cardcell")
    }
    
    func borderStyle() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor(named: Color.GREY)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    func selectCards() {
        if (Global.selectCounter == 1) {
            self.selfImage.image = UIImage(named: "square")
            selfBorder.layer.borderWidth = 1.0
            selfBorder.layer.borderColor = UIColor(named: Color.GREY_MEDIUM)?.cgColor
            selfBorder.layer.cornerRadius = 6
            situationBorder.layer.borderWidth = 2.0
            situationBorder.layer.borderColor = UIColor(named: Color.GOLD_PRIME)?.cgColor
            situationBorder.layer.cornerRadius = 6
        } else if (Global.selectCounter == 2) {
            situationImage.image = UIImage(named: "circle")
            situationBorder.layer.borderWidth = 1.0
            situationBorder.layer.borderColor = UIColor(named: Color.GREY_MEDIUM)?.cgColor
            situationBorder.layer.cornerRadius = 6
            challengeBorder.layer.borderWidth = 2.0
            challengeBorder.layer.borderColor = UIColor(named: Color.GOLD_PRIME)?.cgColor
            challengeBorder.layer.cornerRadius = 6
        } else if (Global.selectCounter == 3) {
            challengeImage.image = UIImage(named: "triangle")
            challengeBorder.layer.borderWidth = 1.0
            challengeBorder.layer.borderColor = UIColor(named: Color.GREY_MEDIUM)?.cgColor
            challengeBorder.layer.cornerRadius = 6
            viewReadingOutlet.isEnabled = true
            viewReadingOutlet.backgroundColor = UIColor(named: Color.GOLD_PRIME)
        }
        Global.selectCounter += 1
    }
    
    @IBAction func cardShelfBtn(_ sender: Any) {
        selectCards()
        var select = 0
        while select == 0 {
            let num = Int.random(in: 0 ..< 78)
            if (Global.cardDeck[num] == 0) {
                Global.cardDeck[num] = 1
                select = 1
            }
        }
    }
    
    @IBAction func onSelect(_ sender: Any) {
        viewReadingOutlet.layer.backgroundColor = UIColor(named: Color.GOLD_DEEP)?.cgColor
    }
    
    @IBAction func viewReadingBtn(_ sender: Any) {
    }
    
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
