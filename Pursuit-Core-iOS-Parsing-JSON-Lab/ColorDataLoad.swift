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
    let hex: [String: String]
    let rgb: [String: String]
    let name: [String: String]
}

extension Colors {
    
    static func getHex() -> [String:String] {
        
        var hexDictionary = [String:String]()
        
        guard let fileURL = Bundle.main.url(forResource: "ColorData", withExtension: "json") else {
            fatalError("no color data file found")
        }
    
        do {
            let data = try Data.init(contentsOf: fileURL)
            
            let hexDict = try JSONDecoder().decode(ColorDataLoad.self, from: data)
            hexDictionary = hexDict.colors
        }
        catch {
            fatalError("error found: \(error)")
        }
    
    
}
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
