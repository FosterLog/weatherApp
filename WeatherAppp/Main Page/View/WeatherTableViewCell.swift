//
//  WeatherTableViewCell.swift
//  WeatherAppp
//
//  Created by Express Nerds on 16/9/18.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    func configureCell(at: Int,for data: [List]) {
            let cityName = data[at].name
            let temperature = data[at].main["temp"]!
            self.textLabel?.text = cityName
            self.detailTextLabel?.text = "\(temperature) °C"
    }
}
