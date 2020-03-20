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
    
    // DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 72;
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardcell", for: indexPath)
        return cell
    }
    
    // --------

    override func viewDidLoad() {
        super.viewDidLoad()
        self.borderStyle()
        
        self.view.backgroundColor = UIColor.white
        
        self.titleLabel.text = Constants.APP_NAME
        if (Constants.question != "") {
            self.questionLabel.text = "\"\(Constants.question)?\""
        }
        else {
            self.questionLabel.text = ""
        }
        
        self.viewReadingOutlet.layer.cornerRadius = 25.0
        self.viewReadingOutlet.isEnabled = false
        self.viewReadingOutlet.backgroundColor = UIColor.lightGray
        
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
    
    @IBAction func viewReadingBtn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var viewReadingOutlet: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
