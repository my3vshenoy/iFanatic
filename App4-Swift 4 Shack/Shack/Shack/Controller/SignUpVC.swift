//
//  SignUpVC.swift
//  Shack
//
//  Created by My3 Shenoy on 08/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    
    //MARK:Outlets
    @IBOutlet weak var createAccountBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: IBActions
    @IBAction func createAccountBtnPressed(_ sender: Any) {
    }
    
    @IBAction func generateAvatarBtnPressed(_ sender: Any) {
    }
    
    @IBAction func chooseAvatarButnPressed(_ sender: Any) {
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
}
