//
//  LoginVC.swift
//  Shack
//
//  Created by My3 Shenoy on 08/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    
    //MARK: IBActions
    @IBAction func unwindSegueFromLogin(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SignUpBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_NEW_ACCOUNT, sender: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        guard  let email = usernameTxtField.text, usernameTxtField.text != "" else {
            return
        }
        
        guard  let password = passwordTxtField.text, passwordTxtField.text != "" else {
            return
        }
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGED, object: nil)
                        self.activityIndicator.isHidden = true
                        self.activityIndicator.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    func setUpView(){
        //Hide Activity Indicator initially
        activityIndicator.isHidden = true
        
        //Customize the textfield
        usernameTxtField.attributedPlaceholder = NSAttributedString(string: "username", attributes:[NSAttributedStringKey.foregroundColor : PLACEHOLDER_COLOR_PURPLE] )
        passwordTxtField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : PLACEHOLDER_COLOR_PURPLE] )
        
        //Add a tap gesture to dismiss keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(){
        UIView.animate(withDuration: 0.5) {
            self.view.endEditing(true)
        }
    }
    
}
