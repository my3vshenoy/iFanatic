//
//  DataService.swift
//  JetSetFlight
//
//  Created by My3 Shenoy on 15/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataService{
    
    //Creating a singleton instance
    static let instance = DataService()
    
    //Being set as private so that no other user can modify it
    private var flightsArray = [Flight]()
    private var flightDetail: Flight?
    
    func getFlightsArray() -> [Flight]{
        return flightsArray
    }
    
    func getFlightDetails() -> Flight{
        return flightDetail!
    }
    
    
    func getAllFlights(completion: @escaping CompletionHandler){
        
        //Send a get request to fetch all flights (Not using pagination as there are very less number of flight)
        //The given API does not have any headers and has only one API end point -> /all
        Alamofire.request(URL_ALL_FLIGHTS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.error == nil {
                
                guard let data = response.data else { return }
                if let json = try? JSON(data: data){
                    
                    for item in json.arrayValue{
                        self.flightsArray.append(
                            Flight(departureDate: self.getDateAndTimeStrings(string: item["departure_date"].stringValue).0,
                                   departureTime: self.getDateAndTimeStrings(string: item["departure_date"].stringValue).1,
                                   airlineCode: item["airline_code"].stringValue,
                                   flightNumber: item["flight_number"].stringValue,
                                   departureCity: item["departure_city"].stringValue,
                                   departureAirport:item["departure_airport"].stringValue,
                                   arrivalCity: item["arrival_city"].stringValue,
                                   arrivalAirport: item["arrival_airport"].stringValue,
                                   scheduledDuration: self.addSpaceToDurationString(item["scheduled_duration"].stringValue),
                                   arrivalDate: self.getDateAndTimeStrings(string: item["arrival_date"].stringValue).0,
                                   id: item["id"].intValue, arrivalTime: self.getDateAndTimeStrings(string: item["arrival_date"].stringValue).1))
                        //Note: There is no need to store all the values as we do not use it on the view. I am doing this only for instructional purpose. However, I would store the "id" in case I have to push it to the persistent data storage.
                        completion(true)
                    }
                }
                else{
                    completion(false)
                    debugPrint(response.result.error.debugDescription as Any)
                }
            }
        }
    }
    
    func getFlightByID(id: Int, completion: @escaping CompletionHandler){
        
        //Send a get request to fetch flight details by ID
        Alamofire.request(BASE_URL + "/\(id)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else { return }
                if let json = try? JSON(data: data){
                        self.flightDetail = Flight(departureDate: self.getDateAndTimeStrings(string: json["departure_date"].stringValue).0,
                               departureTime: self.getDateAndTimeStrings(string: json["departure_date"].stringValue).1,
                               airlineCode: json["airline_code"].stringValue,
                               flightNumber: json["flight_number"].stringValue,
                               departureCity: json["departure_city"].stringValue,
                               departureAirport:json["departure_airport"].stringValue,
                               arrivalCity: json["arrival_city"].stringValue,
                               arrivalAirport: json["arrival_airport"].stringValue,
                               scheduledDuration: self.addSpaceToDurationString(json["scheduled_duration"].stringValue),
                               arrivalDate: self.getDateAndTimeStrings(string: json["arrival_date"].stringValue).0,
                               id: json["id"].intValue, arrivalTime: self.getDateAndTimeStrings(string: json["arrival_date"].stringValue).1)
                    //Note: Would prefer extracting "created_at" and "updated_at" timestamps only if we need to maintain a persistent storage of historical data based on business requirement
                }
                completion(true)
            }
            else{
                completion(false)
                self.flightDetail = Flight(departureDate: "", departureTime: "", airlineCode: "take-off", flightNumber: "", departureCity: "", departureAirport: "", arrivalCity: "", arrivalAirport: "", scheduledDuration: "", arrivalDate: "", id: -1, arrivalTime:"" )
                debugPrint(response.result.error.debugDescription as Any)
            }
        }
    }
    
    func getDateAndTimeStrings(string: String) -> (String, String){
        
        //For reference: Response from API is in the format (2017-11-15T06:05:00.000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let date = dateFormatter.date(from: string)!
        dateFormatter.dateFormat = "MMM dd"
        let dateString = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "h:mm a"
        let timeString = dateFormatter.string(from: date)
        
        return (dateString, timeString)
    }
    
    func addSpaceToDurationString(_ string: String) -> String{
        //Reference Format: 2hr39min
        var formattedDurationString: String = string
        let indexOfR: String.Index? = string.index(of: "r") ?? string.startIndex
        formattedDurationString.insert(" ", at: formattedDurationString.index(after: indexOfR!))
        return formattedDurationString
        
    }
}


