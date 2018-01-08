//
//  LeagueVC.swift
//  Swoosh
//
//  Created by My3 Shenoy on 08/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class LeagueVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

   
    @IBAction func onNextButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "SkillVCSegue", sender: self)
    }
    

   

}
