//
//  WeatherInfoViewController.swift
//  Pursuit-Core-iOS-Parsing-JSON-Lab
//
//  Created by Maitree Bain on 11/26/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class WeatherInfoViewController: UIViewController {

    var weather: WeatherInfo?

    @IBOutlet weak var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        
        guard let validWeather = weather else {
            fatalError("check prepare for segue")
        }
        
        weatherLabel.text = " City: \(validWeather.name) \n Temp: \(validWeather.main["temp"]?.description ?? "")"

    }
  
}
