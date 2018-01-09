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
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var profileImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: IBActions
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        guard let email = emailTxtField.text, emailTxtField.text != nil else {
            return
        }
        
        guard let password = passwordTxtField.text, passwordTxtField.text != nil else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            print("User registered successfully")
        }
        
    }
    
    @IBAction func generateAvatarBtnPressed(_ sender: Any) {
    }
    
    @IBAction func chooseAvatarBtnPressed(_ sender: Any) {
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
}
