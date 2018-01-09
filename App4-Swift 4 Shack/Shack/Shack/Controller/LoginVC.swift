//
//  LoginVC.swift
//  Shack
//
//  Created by My3 Shenoy on 08/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func unwindSegueFromLogin(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
