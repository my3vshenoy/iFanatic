//
//  FinishGoalVC.swift
//  Goal Post
//
//  Created by My3 Shenoy on 18/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var pointsTxtField: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    
    //Variables
    var goalDescription: String = "No Text Provided"
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pointsTxtField.delegate = self
        self.createGoalBtn.bindToKeyboard()
        
    }
    
    //Initializer for previous controller to store data
    func initData(withDescription: String, type: GoalType){
        self.goalDescription  = withDescription
        self.goalType = type
    }
    
    //MARK: IBAction
    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func createGoalPressed(_ sender: Any) {
        //Pass data into the core data model
        if self.pointsTxtField.text != ""{
            self.save { (complete) in
                if complete{
                    //Go back to GoalsVC on creation of goal
                    self.presentingViewController?.dismissSecondaryDetail()
                    //dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    //MARK: UITextField Delegate Method
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pointsTxtField.clearButtonMode = .never
    }
    
    //MARK: Core Data Methods
    func save(completion: (_ finished:Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionTarget = Int32(pointsTxtField.text!)!
        goal.goalProgressAmount = Int32(0)
        
        do{
            try managedContext.save()
            completion(true)
        }catch{
            debugPrint("Could not save:\(error.localizedDescription)")
            completion(false)
        }
        
    }
}
