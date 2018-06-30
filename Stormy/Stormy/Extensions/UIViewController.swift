//
//  UIViewController.swift
//  Stormy
//
//  Created by Mythri Shenoy on 6/22/18.
//  Copyright © 2018 Mythri Shenoy. All rights reserved.
//

import UIKit

extension UIViewController {
    
    //MARK: - Static Properties
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
