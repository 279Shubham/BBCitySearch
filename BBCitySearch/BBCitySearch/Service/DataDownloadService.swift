//
//  DataDownloadService.swift
//  BBCitySearch
//
//  Created by Shubham Sharma on 02/03/2020.
//  Copyright © 2020 Shubham Sharma. All rights reserved.
//

import Foundation

// This protocol can be implemented by classes which will provide the raw data by different means i.e- localJSON, calling a remote URL etc

protocol DataFetchingServiceProtocol {
    var dataSourceURL: String {get set}
    
    func getAllCititesData() -> (cityDict: [String: City], cityNamesTrie: Trie)
}

class DataDownloadLocalJSON: DataFetchingServiceProtocol {
    var dataSourceURL: String = "cities"
    
    func getAllCititesData() -> (cityDict: [String: City], cityNamesTrie: Trie) {
        return getCityMap()
    }
    
    private func getCityMap() -> (cityDict: [String: City], cityNamesTrie: Trie){
        var cityDict: [String:City] = [:]
        let nameTrie = Trie()
        if let citieJsonModelArray = loadJson(filename: dataSourceURL){
            for cityJson in citieJsonModelArray {
                nameTrie.insert(cityJson.name)
                cityDict[cityJson.name.lowercased()] = City.init(name: cityJson.name, id: cityJson._id, country: cityJson.country, lat: cityJson.coord.lat, lon: cityJson.coord.lon)
            }
        }
        return (cityDict,nameTrie)
    }
    
    private func loadJson(filename fileName: String) -> [City]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([City].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}



