//
//  CityTableViewCell.swift
//  Search
//
//  Created by Express Nerds on 16/9/18.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    func configureCell(at: Int,forBase dataBase: [String],forSearch dataSearch: [String],searchStatus: Bool) {
        if searchStatus {
            self.textLabel?.text = dataSearch[at]
        } else {
            self.textLabel?.text = dataBase[at]
        }
    }
    
    func findCityId(for cellAt: UITableViewCell,forBase dataBase: [String] ) {
        let cityName = (cellAt.textLabel?.text)!
        let indexOfCity = dataBase.index(of: cityName)!
        print("\(indexOfCity)")
        
    }
}
