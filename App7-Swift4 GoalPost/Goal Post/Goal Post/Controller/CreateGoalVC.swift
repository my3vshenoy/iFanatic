//
//  CreateGoalVC.swift
//  Goal Post
//
//  Created by My3 Shenoy on 17/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var goalTextView: UITextView!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    @IBAction func nextBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func shortTermBtnPressed(_ sender: Any) {
    }
 
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        dismissDetail()
    }
    
}
