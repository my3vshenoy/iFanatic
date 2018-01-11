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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != ""{
            self.profileImgView.image = UIImage(named: UserDataService.instance.avatarName)
            self.avatarName = UserDataService.instance.avatarName
        }
        
        //If the light avatar image is picked, then add a background color so that the light image is visible
        if avatarName.contains("light") && self.bgColor == nil{
            self.profileImgView.backgroundColor = UIColor.gray
        }
    }
    
    
    //MARK: Functions
    func setUpView(){
        
        //Hide Activity Indicator initially
        activityIndicator.isHidden = true
        
        //Customize the textfield
        usernameTxtField.attributedPlaceholder = NSAttributedString(string: "username", attributes:[NSAttributedStringKey.foregroundColor : PLACEHOLDER_COLOR_PURPLE] )
        emailTxtField.attributedPlaceholder = NSAttributedString(string: "email", attributes:[NSAttributedStringKey.foregroundColor : PLACEHOLDER_COLOR_PURPLE] )
        passwordTxtField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : PLACEHOLDER_COLOR_PURPLE] )
        
        //Add a tap gesture to dismiss keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(){
        UIView.animate(withDuration: 0.7) {
        self.view.endEditing(true)
    }
}
    
    //MARK: IBActions
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        
        self.activityIndicator.isHidden = false
        
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
                                self.activityIndicator.isHidden = false
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGED, object: nil)
                        })
                    }
                })
            }
        }
        
    }
    
    @IBAction func generateAvatarColorBtnPressed(_ sender: Any) {
        
        let r = CGFloat(arc4random_uniform(255))/255
        let g = CGFloat(arc4random_uniform(255))/255
        let b = CGFloat(arc4random_uniform(255))/255
        
        self.bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.2) {
            self.profileImgView.backgroundColor = self.bgColor
        }
    }
    
    @IBAction func chooseAvatarBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CHOOSE_AVATAR, sender: nil)
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
}
