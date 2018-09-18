//
//  ViewController.swift
//  Search
//
//  Created by Express Nerds on 16/9/18.
//

import UIKit

class SearchViewController: UIViewController {

    var cityNames: [String] = []
    var cityId: [Double] = []
    var searchCity = [String]()
    var searching = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "cityList", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([CityJson].self, from: data)
                for i in 0..<jsonData.count {
                    self.cityNames.append(jsonData[i].name)
                    self.cityId.append(jsonData[i].id)
                }
            } catch {
                print("Json Error")
            }
        }
    }
}

extension SearchViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchCity.count
        } else {
            return cityNames.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as! CityTableViewCell
        cell.configureCell(at: indexPath.row,forBase: cityNames ,forSearch: searchCity,searchStatus: searching)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CityTableViewCell
        cell.findCityId(for: cell, forBase: cityNames)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCity = cityNames.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
}
