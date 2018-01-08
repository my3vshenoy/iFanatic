//
//  LeagueVC.swift
//  Swoosh
//
//  Created by My3 Shenoy on 08/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class LeagueVC: UIViewController {

    @IBOutlet weak var nextBtn: BorderButton!
    var player: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player()
    }

    //MARK: IBActions
    @IBAction func onNextButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "SkillVCSegue", sender: self)
    }
    
    
    @IBAction func onMensTapped(_ sender: Any) {
        self.selectedLeague(leagueType: "mens")
    }
    
    
    @IBAction func onWomensTapped(_ sender: Any) {
        self.selectedLeague(leagueType: "womens")
    }
    
    @IBAction func onCoedTapped(_ sender: Any) {
        self.selectedLeague(leagueType: "coed")
    }
    
    
    //MARK: Functions
    func selectedLeague(leagueType: String){
        player.desiredLeague = leagueType
        nextBtn.isEnabled = true
    }
   

}
