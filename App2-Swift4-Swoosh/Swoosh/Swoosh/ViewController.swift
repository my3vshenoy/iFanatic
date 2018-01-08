//
//  ViewController.swift
//  Swoosh
//
//  Created by My3 Shenoy on 05/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var swooshLogoImg: UIImageView!
    @IBOutlet weak var bgImgView: UIImageView!
    
    @IBAction func unwindFromGenderVCWithUnwindSegue(_ sender: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Manual setting of view layout for learning purpose
//        swooshLogoImg.frame = CGRect(x: view.frame.size.width/2 - self.swooshLogoImg.frame.size.width/2, y: 50, width: self.swooshLogoImg.frame.size.width, height: self.swooshLogoImg.frame.size.height)
//        self.bgImgView.frame = view.frame
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

