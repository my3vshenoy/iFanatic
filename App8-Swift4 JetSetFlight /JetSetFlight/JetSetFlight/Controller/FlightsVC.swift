//
//  ViewController.swift
//  JetSetFlight
//
//  Created by My3 Shenoy on 15/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class FlightsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: Outlets
    @IBOutlet weak var flightsTableView: UITableView!
    
    //MARK: Variables
    var flight: [Flight] = []
    var id = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the tableView delegate and data source to current view controller
        flightsTableView.delegate = self
        flightsTableView.dataSource = self
        
        //Call the Data Service function
        fetchAllFlightInfo()
    }
    
    //Reload data when the view appears from any other controller or view
    override func viewDidAppear(_ animated: Bool) {
        self.flightsTableView.reloadData()
    }
    
    func fetchAllFlightInfo(){
        
        //Calling the Data Service for the table Data
        DataService.instance.getAllFlights(completion: { (success) in
            
            DispatchQueue.main.async {
                self.flight = DataService.instance.getFlightsArray()
                self.flightsTableView.reloadData()
            }
        })
    }
    
    //MARK: Table View Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flight.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = flightsTableView.dequeueReusableCell(withIdentifier: REUSE_ID_FLIGHT_DETAIL_CELL) as? FlightCell{
            cell.setUpCell(flight: self.flight[indexPath.row])
            return cell
        }
        else{
            return FlightCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Index can be taken either from ID or from indexpath.row
        id = indexPath.row + 1
        performSegue(withIdentifier: SEGUE_ID_FLIGHT_DETAILS, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let flightVC = segue.destination as? FlightDetailsVC{
            flightVC.id = id
        }
    }
}

