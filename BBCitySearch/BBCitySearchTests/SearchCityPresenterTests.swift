//
//  SearchCityPresenterTests.swift
//  BBCitySearchTests
//
//  Created by Shubham Sharma on 02/03/2020.
//  Copyright © 2020 Shubham Sharma. All rights reserved.
//

@testable import BBCitySearch
import XCTest

class DataDownloadServiceMock: DataFetchingServiceProtocol {
    func getAllCititesData() -> (cityDict: [String : City], cityNamesTrie: Trie) {
        return mockData
    }
    var dataSourceURL: String = "cities"
    var mockData:([String:City],Trie) = ([:],Trie())
    
}

//class SearchCityPresenterTests: XCTestCase {
//    var sut: SearchCityPresenter!
//    var dataDownloadService: DataDownloadServiceMock!
//   
//    override func setUp() {
//        dataDownloadService = DataDownloadServiceMock()
//        CityNamesDataStore.shared.downloadService = dataDownloadService
//        sut = SearchCityPresenter()
//        
//        
//    }
//    
//    override func tearDown() {
//        sut = nil
//    }
//    
//    func testWhenSearchStringIsNonNilReturnedArrayIsNonNil() {
//        let cities = sut.getCitiesWithPrefix(searchString: "Ala")
//        XCTAssertNotNil(cities)
//    }
//    
//    func testWhenCitiesWithMultiplePossiblePrefixesArrayPresentThenRightCountIsReturned() {
//        let  nameTrie = Trie()
//        nameTrie.insert("Hurzuf")
//        nameTrie.insert("Hurkuf")
//        nameTrie.insert("Hunza")
//        dataDownloadService.mockData = ([
//            "hurzuf":City.init(name: "Hurzuf", id: 20767, country: "UA", lat: 44.549999, lon: 34.283333),
//            "hurkuf":City.init(name: "Hurkuf", id: 20767, country: "UA", lat: 44.549999, lon: 34.283333),
//            "hunza":City.init(name: "Hunza", id: 20767, country: "UA", lat: 44.549999, lon: 34.283333),
//        ],nameTrie)
//        let citiesArray = sut.getCitiesWithPrefix(searchString: "Hur")
//        XCTAssertEqual(citiesArray.count, 2)
//    }
//}
