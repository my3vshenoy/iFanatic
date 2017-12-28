//
//  ViewController.swift
//  SimpleTableViewApplication
//
//  Created by My3 Shenoy on 28/12/17.
//  Copyright © 2017 com.aarven. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var companyTableView: UITableView!
    
    //Dummy Data
    let companyName = ["Amazon", "American Express", "BDO", "Capital One", "General Electric (GE)", "Miniclip", "Netflix", "Next Big Sound", "Starbucks", "T-Mobile"]
    let rank = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign the data source for the table and rights to alter this data through the delegate
        companyTableView.delegate = self
        companyTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = companyTableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = companyName[indexPath.row]
        cell?.detailTextLabel?.text = "Rank: \(rank[indexPath.row])"
        return cell!
    }


}

