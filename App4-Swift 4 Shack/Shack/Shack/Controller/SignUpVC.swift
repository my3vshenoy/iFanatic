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
    
    //MARK: Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: IBActions
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        
        guard let email = self.emailTxtField.text, emailTxtField.text != nil else {
            return
        }
        
        guard let password = passwordTxtField.text, passwordTxtField.text != nil else {
            return
        }
        
        guard let username = self.usernameTxtField.text, usernameTxtField.text != nil else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: password)
        { (success) in
            if success{
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success{
                        AuthService.instance.createUser(name: username, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion:
                            { (success) in
                                print("Successfully created User")
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                        })
                    }
                })
            }
        }
        
    }
    
    @IBAction func generateAvatarColorBtnPressed(_ sender: Any) {
    }
    
    @IBAction func chooseAvatarBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_CHOOSE_AVATAR, sender: nil)
        
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
}
