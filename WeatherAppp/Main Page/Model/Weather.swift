//
//  Weather.swift
//  WeatherAppp
//
//  Created by Express Nerds on 16/9/18.
//

import Foundation

var cityIds = ["4163971","2147714","2174003"]

var weatherData: [List]?

private var cityId: String = ""
typealias DownloadComplete = () -> ()

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
    let cityId = cityIds.joined(separator: ",")
    return URL(string: "https://api.openweathermap.org/data/2.5/group?id=\(cityId)&units=metric&appid=77479295e2ec74ed0b40a6d64b4bac2d")!
}

func downloadData(completed: @escaping DownloadComplete) {
    let downloadURL = cityIdList()
    let task = URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
        guard let data = data, error == nil, urlResponse != nil else { return }
        do {
            let decoder = JSONDecoder()
            let weather = try decoder.decode(Weather.self, from: data)
            weatherData = weather.list
            completed()
        } catch {
            print("Json error")
        }
    }
    task.resume()
}
