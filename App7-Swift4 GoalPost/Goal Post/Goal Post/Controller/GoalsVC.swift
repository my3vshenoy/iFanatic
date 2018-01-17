//
//  GoalsVC.swift
//  Goal Post
//
//  Created by My3 Shenoy on 14/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {

    @IBOutlet weak var goalTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goalTableView.dataSource = self
        self.goalTableView.delegate = self
        
    }
    
    @IBAction func addGoalBtnPressed(_ sender: Any) {
        
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC")  else{ return }
        presentDetail(createGoalVC)
    }
}


extension GoalsVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let goalCell = goalTableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {return UITableViewCell()}
        goalCell.configureCell(description: "Eat salad once a week", type: .shortTerm, progressAmt: 2)
        return goalCell
    }
    
    
}

