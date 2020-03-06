//
//  CityTableCell.swift
//  BBCitySearch
//
//  Created by Shubham Sharma on 06/03/2020.
//  Copyright © 2020 Shubham Sharma. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell{
    private var cityDict:[String:City] {
        get {
            return CityNamesDataStore.shared.getCities()
        }
    }
    func cellWithCityData(cityName:String) {
        if let city = cityDict[cityName]{
            textLabel?.text = (city.name) + ", " + (city.country)
            detailTextLabel?.text = "Latitude:" + String(city.coord.lat) + "  Longitude:" + String(city.coord.lon)
        }
    }
}
