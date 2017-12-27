//
//  ViewController.swift
//  BullsEye
//
//  Created by My3 Shenoy on 27/12/17.
//  Copyright © 2017 com.aarven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//Created an outlet for slider object
    @IBOutlet weak var sliderObj: UISlider!
    var currentValue = 50
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       currentValue = lroundf(sliderObj.value)
        print("Slider Value: \(currentValue)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //My first code base
    @IBAction func showAlert(){
        let alert = UIAlertController(title: "Hello World", message: "The value is \(currentValue)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style:.default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

}
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
        print("Slider Value: \(currentValue)")
        
    }
}
