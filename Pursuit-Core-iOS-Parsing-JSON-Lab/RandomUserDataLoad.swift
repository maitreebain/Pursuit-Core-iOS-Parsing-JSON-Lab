//
//  RandomUserDataLoad.swift
//  Pursuit-Core-iOS-Parsing-JSON-Lab
//
//  Created by Maitree Bain on 12/2/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct RandomUserDataLoad: Codable {
    let results: [UserInfo]
}

struct UserInfo: Codable {
    let name: UserName
    let location: UserLocation
    let email: String
    let phone: String
    let dob: DateOfBirth
}

struct UserName: Codable {
    let first: String
    let last: String
}

struct UserLocation: Codable {
    let street: UserStreetInfo
}

struct UserStreetInfo: Codable {
    let number: Int
    let name: String
}

struct DateOfBirth: Codable {
    let date: String
}

extension RandomUserDataLoad {
    
    static func getUserInfo() -> [UserInfo] {
        var userInfo = [UserInfo]()
    
        guard let fileURL = Bundle.main.url(forResource: "RandomUserData", withExtension: "json") else {
            fatalError("could not find color Data file")
        }
        
        do {
            let data = try Data.init(contentsOf: fileURL)
            
            let userData = try JSONDecoder().decode(RandomUserDataLoad.self, from: data)
            userInfo = userData.results
        } catch {
            fatalError("no data found")
        }
        
        return userInfo
    }
    
}
