//
//  Category.swift
//  CoderSwag
//
//  Created by My3 Shenoy on 13/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import Foundation

struct Category{
    
    private (set) public var title: String
    private (set) public var imageName: String
    
    init(title: String, imageName: String){
        self.title = title
        self.imageName = imageName
    }
    
}
