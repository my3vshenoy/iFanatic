//
//  RoundedButton.swift
//  Shack
//
//  Created by My3 Shenoy on 09/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 5.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setUpView()
    }
    
    override func prepareForInterfaceBuilder() {
        self.setUpView()
    }
    
    func setUpView(){
        self.layer.cornerRadius = cornerRadius
    }
}
