//
//  ViewController.swift
//  CustomTableViewApplication
//
//  Created by My3 Shenoy on 28/12/17.
//  Copyright © 2017 com.aarven. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var animalInfoTableView: UITableView!

    //Data Source
    let animalNames = ["Cat", "Dog", "Horse", "Potato", "Cat", "Dog", "Horse", "Potato", "Cat", "Dog", "Horse", "Potato", "Cat", "Dog", "Horse", "Potato"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animalInfoTableView.dataSource = self
        animalInfoTableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        cell.animalImgView.layer.cornerRadius = cell.animalImgView.frame.height/2
        cell.animalNameLabel.text = animalNames[indexPath.row]
        cell.animalImgView.image = UIImage(named: animalNames[indexPath.row])
        return cell
    }


}

