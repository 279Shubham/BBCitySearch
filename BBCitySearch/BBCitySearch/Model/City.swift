//
//  City.swift
//  BBCitySearch
//
//  Created by Shubham Sharma on 02/03/2020.
//  Copyright © 2020 Shubham Sharma. All rights reserved.
//

import Foundation

struct City: Codable{
    struct Location : Codable{
        let lat: Float32
        let lon: Float32
    }
    let name: String
    let _id: Int
    let country: String
    let coord: Location
    
    init(name:String, id: Int, country: String, lat: Float32, lon: Float32) {
        self.name = name
        self._id = id
        self.country  = country
        self.coord = Location(lat: lat, lon: lon)
    }
}

