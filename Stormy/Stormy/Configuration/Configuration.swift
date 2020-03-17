//
//  Configuration.swift
//  Stormy
//
//  Created by Mythri Shenoy on 6/22/18.
//  Copyright © 2018 Mythri Shenoy. All rights reserved.
//

import Foundation
import CoreLocation

enum WeatherService {
    private static let apiKey = "9fe2e09df9da6117cb287bdb8a0165a2"
    private static let baseUrl = URL(string: "https://api.darksky.net/forecast/")!
    static var authenticatedBaseUrl: URL {
        return baseUrl.appendingPathComponent(apiKey)
    }
}

enum Defaults {
    static var location = CLLocation(latitude: 37.335114, longitude: -122.008928)
}
