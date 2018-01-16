//
//  FlightCell.swift
//  JetSetFlight
//
//  Created by My3 Shenoy on 15/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class FlightCell: UITableViewCell {

    @IBOutlet weak var departureAirportLbl: UILabel!
    @IBOutlet weak var departureTimeLbl: UILabel!
    @IBOutlet weak var arrivalAirportLbl: UILabel!
    @IBOutlet weak var arrivalTimeLbl: UILabel!
    @IBOutlet weak var airlineImage: UIImageView!
    @IBOutlet weak var flightDurationLbl: UILabel!
    @IBOutlet weak var arrivalDateLbl: UILabel!
    @IBOutlet weak var departureDateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //Instead of setting the values in the cellForRowAtIndexPath, I am letting view do the rendering for the cell
    func setUpCell(flight: Flight){
        
        self.departureAirportLbl.text = flight.departureAirport
        self.departureDateLbl.text = flight.departureDate
        self.departureTimeLbl.text = flight.departureTime
        self.arrivalTimeLbl.text = flight.arrivalTime
        self.arrivalDateLbl.text = flight.arrivalDate
        self.arrivalAirportLbl.text = flight.arrivalAirport
        self.flightDurationLbl.text = flight.scheduledDuration
        if (UIImage(named: flight.airlineCode) != nil){
            self.airlineImage.image = UIImage(named: flight.airlineCode)
        }
        else{
            self.airlineImage.image = UIImage(named:"take-off")
        }
    }
    


}
