//
//  FlightDetailsVC.swift
//  JetSetFlight
//
//  Created by My3 Shenoy on 15/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class FlightDetailsVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var navBarDepAirportLbl: UILabel!
    @IBOutlet weak var navBarArrAirportLbl: UILabel!
    @IBOutlet weak var navBarDepDateLbl: UILabel!
    @IBOutlet weak var navBarArrDateLbl: UILabel!
    @IBOutlet weak var airlineImgView: UIImageView!
    @IBOutlet weak var departureAirportLbl: UILabel!
    @IBOutlet weak var departureCityLbl: UILabel!
    @IBOutlet weak var departureDateLbl: UILabel!
    @IBOutlet weak var departureTimeLbl: UILabel!
    @IBOutlet weak var flightDurationLbl: UILabel!
    @IBOutlet weak var arrivalCityLbl: UILabel!
    @IBOutlet weak var arrivalDateLbl: UILabel!
    @IBOutlet weak var arrivalAirportLbl: UILabel!
    @IBOutlet weak var arrivalTimeLbl: UILabel!
    @IBOutlet weak var flightNumLbl: UILabel!
    
    public var id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeFlightDetails(id: id)
    }
    
    func initializeFlightDetails(id: Int){
        
        DataService.instance.getFlightByID(id: id) { (success) in
            DispatchQueue.main.async {
                let flight = DataService.instance.getFlightDetails()
                self.setUpView(flight: flight)
            }
        }
    }
    
    func setUpView(flight: Flight){
        
        self.departureAirportLbl.text = flight.departureAirport
        self.departureDateLbl.text = flight.departureDate
        self.departureTimeLbl.text = flight.departureTime
        self.arrivalTimeLbl.text = flight.arrivalTime
        self.arrivalDateLbl.text = flight.arrivalDate
        self.arrivalAirportLbl.text = flight.arrivalAirport
        self.flightDurationLbl.text = flight.scheduledDuration
        self.navBarArrDateLbl.text = flight.arrivalDate
        self.navBarDepDateLbl.text = flight.departureDate
        self.navBarArrAirportLbl.text = flight.arrivalAirport
        self.navBarDepAirportLbl.text = flight.departureAirport
        self.departureCityLbl.text = flight.departureCity
        self.arrivalCityLbl.text = flight.arrivalCity
        self.flightNumLbl.text = flight.airlineCode + flight.flightNumber
        
        //If Image is present in the XCAssets, then display it otherwise show placeholder image
        //If the image was coming from the Url, then I would use SDwebImage library for asynchronous image loading
        if (UIImage(named: flight.airlineCode) != nil){
            self.airlineImgView.image = UIImage(named: flight.airlineCode)
        }
        else{
            self.airlineImgView.image = UIImage(named:"take-off")
        }
    }
    
    func dismissView(){
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func proceedToBookBtnPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Cha Ching!", message: "Your flight is booked!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (success) in
            self.dismissView()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
