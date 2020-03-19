//
//  SelectionViewController.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 3/19/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.borderStyle()
        self.view.backgroundColor = UIColor.white
        self.viewReadingOutlet.layer.cornerRadius = 25.0
        self.viewReadingOutlet.isEnabled = false
        self.viewReadingOutlet.backgroundColor = UIColor.lightGray
        
        self.titleLabel.text = Constants.APP_NAME
        if (Constants.question != "") {
            self.questionLabel.text = "\"\(Constants.question)?\""
        }
        else {
            self.questionLabel.text = ""
        }
        // Do any additional setup after loading the view.
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
