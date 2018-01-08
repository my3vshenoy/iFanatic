//
//  BorderButton.swift
//  Swoosh
//
//  Created by My3 Shenoy on 06/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class BorderButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    
    

}
