//
//  GoalCell.swift
//  Goal Post
//
//  Created by My3 Shenoy on 14/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    
    func configureCell(goal: Goal){
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        //String(describing: ) -> Gets the textual value of an Int
        self.goalProgressLbl.text = String(describing:goal.goalProgressAmount)
    }
    
}
