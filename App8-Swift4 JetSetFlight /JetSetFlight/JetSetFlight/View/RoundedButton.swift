//
//  RoundedButton.swift
//  JetSetFlight
//
//  Created by My3 Shenoy on 16/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

//For dynamic update on story board, we use IBDesignable
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

