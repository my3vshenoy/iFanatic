//
//  CreateGoalVC.swift
//  Goal Post
//
//  Created by My3 Shenoy on 17/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    
    //MARK: Outlets
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    
    //MARK: Variables
    var goalType:GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goalTextView.delegate = self
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }

    //MARK: IBActions
    @IBAction func nextBtnPressed(_ sender: Any) {
        
        if self.goalTextView.text != "" && self.goalTextView.text != "What is your goal?"{
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else{return}
            
            //Set the data
            finishGoalVC.initData(withDescription: self.goalTextView.text, type: goalType)
            
            presentDetail(finishGoalVC)
            //presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
        
    }
    
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
 
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
        goalType = .longTerm
        shortTermBtn.setDeselectedColor()
        longTermBtn.setSelectedColor()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        dismissDetail()
    }
    
    //MARK:TextView Delegate methods
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.goalTextView.text = ""
        self.goalTextView.textColor = #colorLiteral(red: 0.4274509804, green: 0.737254902, blue: 0.3882352941, alpha: 1)
        
    }
}
