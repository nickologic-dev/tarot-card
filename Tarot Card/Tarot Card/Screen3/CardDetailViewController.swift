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
        
        cardView?.decelerationRate = UIScrollView.DecelerationRate.fast
        
        self.detailBtnOutlet.layer.cornerRadius = 25.0
        
        self.cardView?.dataSource = self
        self.cardView?.delegate = self
        
        let cardNib = UINib(nibName: "CardDetailViewCell", bundle: nil)
        self.cardView?.register(cardNib, forCellWithReuseIdentifier : "detailCard")
        
        selfOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 16)
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.disabled)
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
        
        situationOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 16)
        situationOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        
        challengeOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 16)
        challengeOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        
        detailBtnOutlet.layer.cornerRadius = 6.0
        detailBtnOutlet.titleLabel?.font = UIFont(name: Font.SEMI_BOLD, size: 21)
        detailBtnOutlet.setTitleColor(UIColor.white, for: UIControl.State.normal)
    }
    
    @IBAction func selfBtn(_ sender: Any? = nil) {
        DispatchQueue.main.async {
            let indexPath = NSIndexPath(row: 0, section: 0)
            self.cardView?.scrollToItem(at: indexPath as IndexPath, at: .centeredHorizontally, animated: true)
        }
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
        situationOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        challengeOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
    }
    
    @IBAction func situationBtn(_ sender: Any? = nil) {
        DispatchQueue.main.async {
            let indexPath = NSIndexPath(row: 1, section: 0)
            self.cardView?.scrollToItem(at: indexPath as IndexPath, at: .centeredHorizontally, animated: true)
        }
        situationOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
        selfOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        challengeOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
    }
    
    @IBAction func challengeBtn(_ sender: Any? = nil) {
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

extension CardDetailViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
    
    func scrollToMostVisibleCell(){ //add if snapping while scrolling is not strong enough
        let visibleRect = CGRect(origin: cardView?.contentOffset ?? CGPoint(), size: cardView?.bounds.size ?? CGSize())
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath = cardView?.indexPathForItem(at: visiblePoint)!
        cardView?.scrollToItem(at: visibleIndexPath as! IndexPath, at: .centeredHorizontally, animated: true)
    }
    
    func scrollTabbing() {
        print(cardView?.contentOffset.x)
        print(cardView?.frame.width)
        let indexPath = Int(((cardView?.contentOffset.x ?? 0) * 2) / (cardView?.frame.width ?? 1))
        print(indexPath)
        if indexPath == 0 {
            selfOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
            situationOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
            challengeOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        }
        else if indexPath == 1 {
            situationOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
            selfOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
            challengeOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        }
        else if indexPath == 2 {
            challengeOutlet.setTitleColor(UIColor(named: Color.GREY_DEEP), for: UIControl.State.normal)
            situationOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
            selfOutlet.setTitleColor(UIColor(named: Color.GREY_PRIME), for: UIControl.State.normal)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scrollTabbing()
    }
        
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollTabbing()
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
            scrollTabbing()
    }
        
}

extension CardDetailViewController {
  @IBAction func flipCard(_ segue: UIStoryboardSegue) {
    
  }
}

class SnapCenterLayout: UICollectionViewFlowLayout {
  override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
    guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
    let parent = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)

    let itemSpace = itemSize.width + minimumInteritemSpacing
    var currentItemIdx = round(collectionView.contentOffset.x / itemSpace)

    // Skip to the next cell, if there is residual scrolling velocity left.
    // This helps to prevent glitches
    let vX = velocity.x
    if vX > 0 {
      currentItemIdx += 1
    } else if vX < 0 {
      currentItemIdx -= 1
    }

    let nearestPageOffset = currentItemIdx * itemSpace
    return CGPoint(x: nearestPageOffset,
                   y: parent.y)
  }
}
