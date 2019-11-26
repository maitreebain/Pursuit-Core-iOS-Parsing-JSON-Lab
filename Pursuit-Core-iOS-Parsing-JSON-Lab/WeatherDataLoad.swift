//
//  WeatherDataLoad.swift
//  Pursuit-Core-iOS-Parsing-JSON-Lab
//
//  Created by Maitree Bain on 11/25/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct WeatherDataLoad: Codable {
    let list: [WeatherInfo]
}

struct WeatherInfo: Codable {
    var name: String
//    var weather: [WeatherArrayData]
    var main: [String: Double]
}

struct WeatherArrayData: Codable {
    var main: String
    var description: String
}

extension WeatherInfo {

static func getMain() -> [String:Double] {
    
    var mainDictionary = [String:Double]()
    
    guard let fileURL = Bundle.main.url(forResource: "WeatherData", withExtension: "json") else {
        fatalError("could not find weather data file")
    }
    do {
        let data = try Data.init(contentsOf: fileURL)
        
        let mainData = try JSONDecoder().decode(WeatherInfo.self, from: data)
        mainDictionary = mainData.main
    }
    catch {
        fatalError("error found: \(error)")
    }
    
    
    return mainDictionary
    
}
}

extension WeatherDataLoad {
    
    static func getWeather() -> [WeatherInfo] {
        var weatherInfo = [WeatherInfo]()
    
        guard let fileURL = Bundle.main.url(forResource: "WeatherData", withExtension: "json") else {
            fatalError("could not find weather data file")
        }
        
        do {
            let data = try Data.init(contentsOf: fileURL)
            
            let weatherType = try JSONDecoder().decode(WeatherDataLoad.self, from: data)
            weatherInfo = weatherType.list
        }
        catch {
            fatalError("error found: \(error)")
        }
        
        
        return weatherInfo
}
}


