//
//  Flight.swift
//  JetSetFlight
//
//  Created by My3 Shenoy on 15/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import Foundation

struct Flight{
    
    public private(set) var departureDate: String
    public private(set) var departureTime: String
    public private(set) var airlineCode: String
    public private(set) var flightNumber: String
    public private(set) var departureCity: String
    public private(set) var departureAirport: String
    public private(set) var arrivalCity: String
    public private(set) var arrivalAirport: String
    public private(set) var scheduledDuration: String
    public private(set) var arrivalDate: String
    public private(set) var arrivalTime: String
    public private(set) var id: Int
    //Not storing for now
    //public private(set) var createdAt: String
    //public private(set) var updatedAt = ""
    
    init(departureDate: String, departureTime: String, airlineCode: String, flightNumber: String, departureCity: String, departureAirport: String, arrivalCity: String, arrivalAirport: String, scheduledDuration: String, arrivalDate: String, id: Int, arrivalTime: String){
        self.departureDate = departureDate
        self.departureTime = departureTime
        self.airlineCode = airlineCode
        self.flightNumber = flightNumber
        self.departureCity = departureCity
        self.departureAirport = departureAirport
        self.arrivalCity = arrivalCity
        self.arrivalAirport = arrivalAirport
        self.scheduledDuration = scheduledDuration
        self.arrivalDate = arrivalDate
        self.arrivalTime = arrivalTime
        self.id = id
    }
}
