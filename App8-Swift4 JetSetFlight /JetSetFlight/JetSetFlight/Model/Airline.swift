//
//  Airline.swift
//  JetSetFlight
//
//  Created by My3 Shenoy on 16/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import Foundation

struct Airline{
    public private(set) var airlineDict: ()
    public private(set) var airlineCode: String
    public private(set) var airlineImageName: String
    
    init(airlineCode: String, airlineImageName: String){
        self.airlineCode = airlineCode
        self.airlineImageName = airlineImageName
    }
    
}
