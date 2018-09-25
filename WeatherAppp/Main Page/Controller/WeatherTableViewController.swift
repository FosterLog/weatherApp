//
//  WeatherTableViewController.swift
//  WeatherAppp
//
//  Created by Express Nerds on 16/9/18.
//

import UIKit
import SVProgressHUD

class WeatherTableViewController: UITableViewController {
    
    @IBAction func unwindToWeatherScreen(segue: UIStoryboardSegue) {
        print("Main Page")
    }
    
    @IBOutlet weak var outletAddCity: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        outletAddCity.isHidden = true
        outletAddCity.backgroundColor = UIColor.lightGray
        SVProgressHUD.show(withStatus: "We are getting weather data")
        downloadData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.outletAddCity.isHidden = false
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let weatherData = weatherData else { return 0 }
        return (weatherData.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherTableViewCell
        guard let _weatherData = weatherData else { return cell }
        SVProgressHUD.dismiss()
        cell.configureCell(at: indexPath.row, for: _weatherData)
        return cell
    }
}
