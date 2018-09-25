//
//  AnotherModel.swift
//  WeatherAppp
//
//  Created by Express Nerds on 16/9/18.
//

import Foundation

var cityNames: [String] = []

var searchCityIds: [Int] = []

struct CityJson: Codable {
    let id: Int
    let name : String
    let country : String
    let coord : [String:Double]
}

func getCityNames() {
    if let url = Bundle.main.url(forResource: "cityList", withExtension: "json") {
        do {
            cityNames.removeAll()
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([CityJson].self, from: data)
            for i in 0..<jsonData.count {
                cityNames.append(jsonData[i].name)
                searchCityIds.append(jsonData[i].id)
            }
        } catch {
            print("Json Error")
        }
    }
}
