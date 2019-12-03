//
//  ColorDataLoad.swift
//  Pursuit-Core-iOS-Parsing-JSON-Lab
//
//  Created by Maitree Bain on 12/1/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct ColorDataLoad: Codable {
    let colors: [Colors]
}

struct Colors: Codable {
    let hex: HexValue
    let rgb: RGBValue
    let name: NameValue
}

struct HexValue: Codable {
    let value: String
}

struct RGBValue: Codable {
    let r: Double
    let g: Double
    let b: Double
    let value: String
}

struct NameValue: Codable {
    let value: String
}


extension ColorDataLoad {
    
    static func getColorInfo() -> [Colors] {
        var colorInfo = [Colors]()
        
        guard let fileURL = Bundle.main.url(forResource: "ColorData", withExtension: "json") else {
            fatalError("could not find color Data file")
        }
        
        do {
            let data = try Data.init(contentsOf: fileURL)
            
            let color = try JSONDecoder().decode( ColorDataLoad.self, from: data)
            colorInfo = color.colors
        } catch {
            fatalError("error found: \(error)")
        }
        
        return colorInfo
    }
    
}
