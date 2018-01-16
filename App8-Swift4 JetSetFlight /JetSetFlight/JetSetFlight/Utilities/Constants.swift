//
//  Constants.swift
//  JetSetFlight
//
//  Created by My3 Shenoy on 15/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import Foundation

//MARK: URL Constants

//Creating a base URL to accomodate other URLs for future use. Appending the API end point to them is all that is needed
let BASE_URL = "https://glacial-caverns-15124.herokuapp.com/flights/"
let URL_ALL_FLIGHTS = BASE_URL + "all"

//MARK: Aliases
typealias CompletionHandler = (_ Success:Bool) -> () //Created an alias for a Closure


//MARK: Reuse Identifiers
let REUSE_ID_FLIGHT_DETAIL_CELL = "FlightDetailCell"

//MARK: Segue Identifiers
let SEGUE_ID_FLIGHT_DETAILS = "FlightDetailsVC"
