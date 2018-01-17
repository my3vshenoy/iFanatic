//
//  UIViewControllerExt.swift
//  Goal Post
//
//  Created by My3 Shenoy on 17/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func presentDetail(_ viewControllerToPresent: UIViewController){
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func dismissDetail(){
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
    
    
}
