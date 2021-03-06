//
//  ChannelVC.swift
//  Shack
//
//  Created by My3 Shenoy on 08/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var profileImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        //Add observer
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_CHANGED, object: nil)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        if AuthService.instance.isLoggedIn{
            //Show profile Page
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        }
        else{
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    //UNWIND
    @IBAction func prepareForUnwind(segue:UIStoryboardSegue){
        
    }
    
    
    //Notification selector: What should happen on receiving a broadcast
    @objc func userDataDidChange(_ notif:NSNotification){
        if AuthService.instance.isLoggedIn{
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            profileImgView.image = UIImage(named: UserDataService.instance.avatarName)
            profileImgView.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        }
        else{
            loginBtn.setTitle("Login", for: .normal)
            profileImgView.image = UIImage(named: "menuProfileIcon")
            profileImgView.backgroundColor = UIColor.clear
        }
    }
    
    func setUpUserInfo(){
        if AuthService.instance.isLoggedIn{
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            profileImgView.image = UIImage(named: UserDataService.instance.avatarName)
            profileImgView.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        }
        else{
            loginBtn.setTitle("Login", for: .normal)
            profileImgView.image = UIImage(named: "menuProfileIcon")
            profileImgView.backgroundColor = UIColor.clear
        }
    }
}
