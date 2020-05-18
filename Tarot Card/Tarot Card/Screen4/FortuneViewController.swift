//
//  FortuneViewController.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/21/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class FortuneViewController: UIViewController {
    
    @IBOutlet weak var fortuneView: FortuneCollectionView?
    
    @IBOutlet weak var selfOutlet: UIButton!
    @IBOutlet weak var situationOutlet: UIButton!
    @IBOutlet weak var challengeOutlet: UIButton!
    
    @IBOutlet weak var viewFaceOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fortuneView?.decelerationRate = UIScrollView.DecelerationRate.fast
        
        self.fortuneView?.dataSource = self
        let cardNib = UINib(nibName: "FortuneCollectionViewCell", bundle: nil)
        self.fortuneView?.register(cardNib, forCellWithReuseIdentifier : "fortune")
        
        selfOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 16)
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.disabled)
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
        
        situationOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 16)
        situationOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        
        challengeOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 16)
        challengeOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        
        viewFaceOutlet.layer.cornerRadius = 6.0
        viewFaceOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 21)
        viewFaceOutlet.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
    }
    
    @IBAction func selfBtn(_ sender: Any) {
        DispatchQueue.main.async {
            let indexPath = NSIndexPath(row: 0, section: 0)
            self.fortuneView?.scrollToItem(at: indexPath as IndexPath, at: .centeredHorizontally, animated: true)
        }
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
        situationOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        challengeOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
    }
    
    @IBAction func situationBtn(_ sender: Any) {
        DispatchQueue.main.async {
            let indexPath = NSIndexPath(row: 1, section: 0)
            self.fortuneView?.scrollToItem(at: indexPath as IndexPath, at: .centeredHorizontally, animated: true)
        }
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
        situationOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        challengeOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
    }
    
    @IBAction func challengeBtn(_ sender: Any) {
        DispatchQueue.main.async {
            let indexPath = NSIndexPath(row: 2, section: 0)
            self.fortuneView?.scrollToItem(at: indexPath as IndexPath, at: .centeredHorizontally, animated: true)
        }
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
        situationOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        challengeOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
    }
    
}

 extension FortuneViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 3;
     }

     func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1;
     }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (fortuneView?.frame.width)!, height: (fortuneView?.frame.height)!)
//    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fortune", for: indexPath)
         let cardCell = cell as! FortuneCollectionViewCell
        cardCell.cellNumber = indexPath.section + indexPath.row + 1
        cardCell.fortuneNameLabel.text = Global.cardNames[cardCell.cellNumber]
        cardCell.fortune.text = Global.cardFortunes[cardCell.cellNumber]
        
         return cardCell
     }
     
 }
