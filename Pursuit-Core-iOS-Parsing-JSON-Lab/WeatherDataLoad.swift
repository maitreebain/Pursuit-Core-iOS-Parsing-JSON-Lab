//
//  WeatherDataLoad.swift
//  Pursuit-Core-iOS-Parsing-JSON-Lab
//
//  Created by Maitree Bain on 11/25/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct WeatherDataLoad: Codable {
    let results: [WeatherInfo]
}

struct WeatherInfo: Codable {
    var name: String
    var weather: [WeatherArrayData]
}

struct WeatherArrayData: Codable {
    var main: String
    var description: String
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
            weatherInfo = weatherType.results
        }
        catch {
            fatalError("error found: \(error)")
        }
        
        
        return weatherInfo
}
}

extension WeatherInfo {

    static func getWeatherInfo() -> [WeatherArrayData] {
        var weatherArrayInfo = [WeatherArrayData]()

        guard let fileURL = Bundle.main.url(forResource: "WeatherData", withExtension: "json") else {
            fatalError("could not fild weather data file")
        }

        do {
            let data = try Data.init(contentsOf: fileURL)

            let weatherData = try JSONDecoder().decode(WeatherInfo.self, from: data)
            weatherArrayInfo = weatherData.weather
        } catch{
            fatalError("error found: \(error)")
        }


    return weatherArrayInfo
    }
}
