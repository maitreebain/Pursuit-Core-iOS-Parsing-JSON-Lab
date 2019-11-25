//
//  projectCell.swift
//  Pursuit-Core-iOS-Parsing-JSON-Lab
//
//  Created by Maitree Bain on 11/25/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class projectCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func configureCell(for weatherData: WeatherInfo, for weatherInfo: WeatherArrayData) {
        nameLabel.text = weatherData.name
        mainLabel.text = weatherInfo.main
        descriptionLabel.text = weatherInfo.description
    }
}
