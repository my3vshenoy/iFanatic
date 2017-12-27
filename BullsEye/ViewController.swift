//
//  ViewController.swift
//  BullsEye
//
//  Created by My3 Shenoy on 27/12/17.
//  Copyright © 2017 com.aarven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //My first code base
    @IBAction func showAlert(){
        let alert = UIAlertController(title: "Hello World", message: "Welcome to the Bulls Eye Game", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style:.default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

}
}
