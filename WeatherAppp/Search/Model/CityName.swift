//
//  AnotherModel.swift
//  WeatherAppp
//
//  Created by Express Nerds on 16/9/18.
//

import Foundation

struct CityJson: Codable {
    let id: Double
    let name : String
    let country : String
    let coord : [String:Double]
}


