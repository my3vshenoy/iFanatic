//
//  RoundedImage.swift
//  Shack
//
//  Created by My3 Shenoy on 11/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class CircularImage: UIImageView {

    override func awakeFromNib() {
        self.setUpView()
    }
    
    func setUpView(){
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setUpView()
    }

}
