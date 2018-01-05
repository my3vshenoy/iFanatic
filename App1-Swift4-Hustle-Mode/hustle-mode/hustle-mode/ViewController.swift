//
//  ViewController.swift
//  hustle-mode
//
//  Created by My3 Shenoy on 05/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var cloudHolderView: UIView!
    @IBOutlet weak var rocketAndStreamImgView: UIImageView!
    @IBOutlet weak var cloudsAndOrangeOvalImgView: UIImageView!
    @IBOutlet weak var onLbl: UILabel!
    @IBOutlet weak var hustleLbl: UILabel!
    //Initialize the player object for loading music
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }catch let error as NSError{
            print(error.description)
        }
        
    }

    
    @IBAction func powerBtnPressed(_ sender: Any) {
        powerBtn.isHidden = true
        darkBlueBG.isHidden = true
        cloudHolderView.isHidden = false
        self.rocketAndStreamImgView.isHidden = false
        self.cloudsAndOrangeOvalImgView.isHidden = false
        
        player.play()
        UIView.animate(withDuration: 2.3, animations: {
            self.rocketAndStreamImgView.frame = CGRect(x: 0, y:140, width: 375, height: 402)
        }){ (finished) in
            self.hustleLbl.isHidden = false
            self.onLbl.isHidden = false
        }
    }
}

