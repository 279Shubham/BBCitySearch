//
//  SearchService.swift
//  BBCitySearch
//
//  Created by Shubham Sharma on 02/03/2020.
//  Copyright © 2020 Shubham Sharma. All rights reserved.
//

import Foundation

protocol CityNamesStorageProtocol {
    func setupCityLocalStorage()
    func getCities() -> [String: City]
    func getCityNamesTrie() -> Trie
}


final class CityNamesDataStore: CityNamesStorageProtocol{
    
    static let shared = CityNamesDataStore()
    
    private var cities: [String:City] = [:]
    private var cityNamesTrie: Trie = Trie()
    private var downloadService: DataFetchingServiceProtocol = DataDownloadLocalJSON()
    
    private init(){
    }
    
    func setupCityLocalStorage() {
        let data = downloadService.getAllCititesData()
        cityNamesTrie = data.cityNamesTrie
        cities = data.cityDict
    }
    
    func getCities() -> [String:City] {
        if (cities.keys.count != 0){
        }
        return cities
    }
    
    func getCityNamesTrie() -> Trie {
        return cityNamesTrie
    }
}


