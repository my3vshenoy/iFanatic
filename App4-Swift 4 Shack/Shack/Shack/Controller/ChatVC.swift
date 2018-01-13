//
//  ChatVC.swift
//  Shack
//
//  Created by My3 Shenoy on 08/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var menuBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn{
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGED, object: nil)
            })
        }
    }

}
