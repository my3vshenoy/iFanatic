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
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var roundValueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var currentValue:Int = 0
    var targetValue:Int = 0
    var roundValue = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       currentValue = lroundf(sliderObj.value)
        print("Slider Value: \(currentValue)")
        setSliderUI()
        startNewGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //My first code base
    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        updateScore(points: points)
        
        //Decorate the alertview
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        let message = "Slider Value:\(currentValue)\nTarget Value: \(targetValue)\nRound score:\(points)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style:.default, handler: { action in
                                                                            self.startNewRound()
                                                                            })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

}
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
        print("Slider Value: \(currentValue)")
        
    }
    
    @IBAction func startOver(_ sender: Any) {
        startNewGame()
    }
    
    func startNewGame() {
        score = 0
        roundValue = 0
        startNewRound()
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        //targetValueLabel.text = String(targetValue)
        currentValue = 50
        sliderObj.value = Float(currentValue)
        roundValue += 1
        updateLabels()
    }
    
    func updateLabels(){
        targetValueLabel.text = String(targetValue)
        roundValueLabel.text = String(roundValue)
        scoreLabel.text = String(score)
    }
    
    func updateScore(points: Int){
        score += points
    }
    
    func setSliderUI()
    {
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        sliderObj.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        sliderObj.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        sliderObj.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable =
            trackRightImage.resizableImage(withCapInsets: insets)
        sliderObj.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
}
