//
//  RootViewController.swift
//  Stormy
//  Dark Sky API: https://api.darksky.net/forecast/
//  Key: 9fe2e09df9da6117cb287bdb8a0165a2
//  Created by Mythri Shenoy on 6/22/18.
//  Copyright © 2018 Mythri Shenoy. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {

    //MARK: - Properties
    var viewModel: RootViewModel?
    private let dayViewController: DayViewController = {
        guard let dayViewController = UIStoryboard.main.instantiateViewController(withIdentifier: DayViewController.storyboardIdentifier) as? DayViewController else {
            fatalError("Unable to Instantiate Day View Controller")
        }
        // Configure Day View Controller
        dayViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return dayViewController
    }()
    
    private let weekViewController: WeekViewController = {
        guard let weekViewController = UIStoryboard.main.instantiateViewController(withIdentifier: WeekViewController.storyboardIdentifier) as? WeekViewController else {
            fatalError("Unable to instantiate VC")
        }
        weekViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return weekViewController
    }()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //SetUp Child View Controllers
        setUpChildViewControllers()
        
        //Fetch Weather Data
        fetchWeatherData()
    }
    
    private func setUpChildViewControllers() {
        //MARK: - Configure Views
        addChildViewController(dayViewController)
        addChildViewController(weekViewController)
        
        view.addSubview(dayViewController.view)
        view.addSubview(weekViewController.view)
        
        dayViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dayViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dayViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dayViewController.view.heightAnchor.constraint(equalToConstant: Layout.DayView.height).isActive = true
        
        weekViewController.view.topAnchor.constraint(equalTo: dayViewController.view.bottomAnchor).isActive = true
        weekViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weekViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weekViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        dayViewController.didMove(toParentViewController: self)
        weekViewController.didMove(toParentViewController: self)
    }
    
    private func fetchWeatherData() {
        //Url
        let url = WeatherRequest(baseUrl: WeatherService.authenticatedBaseUrl, location: Defaults.location)
        //Create a data task
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error received: " + error.localizedDescription)
            } else if let response = response {
                print(response)
            }
        }.resume()
    }
}

extension RootViewController {
    private enum Layout {
        enum DayView {
            static let height: CGFloat = 200.0
        }
    }
}

