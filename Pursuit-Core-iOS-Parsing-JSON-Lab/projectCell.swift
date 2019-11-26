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
    
    
    func configureCell(for weatherData: WeatherInfo) {
        nameLabel.text = weatherData.name
        mainLabel.text = weatherData.main["temp"]?.description
    }
}
