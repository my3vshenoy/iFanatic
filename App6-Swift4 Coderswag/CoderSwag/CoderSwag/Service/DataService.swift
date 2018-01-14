//
//  DataService.swift
//  CoderSwag
//
//  Created by My3 Shenoy on 13/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import Foundation
class DataService{
    
    static let instance = DataService()
    
    private let categories = [
        Category(title: "SHIRTS", imageName: "shirts.png"),
        Category(title: "HOODIES", imageName: "hoodies.png"),
        Category(title: "HATS", imageName: "hats.png"),
        Category(title: "DIGITAL", imageName: "digital.png")
    ]
    
    func getCategories() -> [Category]{
        return categories
    }
    
}
