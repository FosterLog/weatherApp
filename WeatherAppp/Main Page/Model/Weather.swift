//
//  Weather.swift
//  WeatherAppp
//
//  Created by Express Nerds on 16/9/18.
//

import Foundation

var cityIds = ["4163971","2147714","2174003"]

private var cityId: String = ""

struct Weather: Codable {
    let cnt: Int
    let list : [List]
    
    init(cnt: Int, list: [List]) {
        self.cnt = cnt
        self.list = list
    }
}

struct List: Codable {
    let name: String
    let main: [String: Double]
    
    init(name: String, main: [String: Double]) {
        self.name = name
        self.main = main
    }
}

func cityIdList() -> URL {
    for each in cityIds {
        cityId = "\(cityId),\(each)"
    }
    return URL(string: "https://api.openweathermap.org/data/2.5/group?id=\(cityId.dropFirst())&units=metric&appid=77479295e2ec74ed0b40a6d64b4bac2d")!
}
