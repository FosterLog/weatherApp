//
//  WeatherTableViewController.swift
//  WeatherAppp
//
//  Created by Express Nerds on 16/9/18.
//

import UIKit
import SVProgressHUD

class WeatherTableViewController: UITableViewController {
    
    var weatherData: [List]?
    
    @IBAction func addCityButton(_ sender: Any) {
        performSegue(withIdentifier: "addCity", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show(withStatus: "We are getting weather data")
        downloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let weatherDat = weatherData else { return 0 }
        return (weatherDat.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherTableViewCell
        guard let _weatherData = weatherData else { return cell }
        SVProgressHUD.dismiss()
        cell.configureCell(at: indexPath.row, for: _weatherData)
        return cell
    }
    
    func downloadData() {
        let downloadURL = cityIdList()
        print(downloadURL)
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else { return }
            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(Weather.self, from: data)
                self.weatherData = weather.list
            } catch {
                print("Json error")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            }.resume()
    }
}
