//
//  DayViewController.swift
//  Stormy
//
//  Created by Mythri Shenoy on 6/22/18.
//  Copyright © 2018 Mythri Shenoy. All rights reserved.
//

import UIKit

final class DayViewController: UIViewController {
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        //Configure View
        view.backgroundColor = .green
    }
}
