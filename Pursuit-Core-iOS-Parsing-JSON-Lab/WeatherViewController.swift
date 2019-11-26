//
//  ViewController.swift
//  Pursuit-Core-iOS-Parsing-JSON-Lab
//
//  Created by Maitree Bain on 11/25/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var weather = [WeatherInfo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        loadData()
        tableView.delegate = self
    }

    func loadData() {
        weather = WeatherDataLoad.getWeather()

    }
    

}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tabOneCell", for: indexPath) as? projectCell else {
            fatalError("no cell to be found")
        }
        
        let weatherTitle = weather[indexPath.row]
        cell.configureCell(for: weatherTitle)
        
        return cell
    }


}

extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
