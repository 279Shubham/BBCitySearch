//
//  SearchCityPresenterTests.swift
//  BBCitySearchTests
//
//  Created by Shubham Sharma on 02/03/2020.
//  Copyright © 2020 Shubham Sharma. All rights reserved.
//

@testable import BBCitySearch
import XCTest

//Below commented code is the sample for creating mock and injecting the data into singleton object in a particular class.

//class DataDownloadServiceMock: DataFetchingServiceProtocol {
//    func getAllCititesData() -> (cityDict: [String : City], cityNamesTrie: Trie) {
//        return mockData
//    }
//    var dataSourceURL: String = "cities"
//    var mockData:([String:City],Trie) = ([:],Trie())
//
//}

class SearchCityPresenterTests: XCTestCase {
    var sut: SearchCityPresenter!
    //var dataDownloadService: DataDownloadServiceMock!
   
    override func setUp() {
        //dataDownloadService = DataDownloadServiceMock()
        //CityNamesDataStore.shared.downloadService = dataDownloadService
        sut = SearchCityPresenter()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testWhenSearchStringIsNonNilReturnedArrayIsNonNil() {
        let expecttation = XCTestExpectation.init(description: "Asyn test")
        sut.getCitiesWithPrefix(searchString: "Ala") { status, data in
            XCTAssertTrue(status, "Failed search")
            expecttation.fulfill()
        }

        wait(for: [expecttation], timeout: 5.0)
    }
    
    
    func testWhenInvalidStringIsQueriedStatusIfTrueAndArrayIsEmptyButNotNill() {
        let expecttation = XCTestExpectation.init(description: "Asyn test")
        sut.getCitiesWithPrefix(searchString: "12345") { status, data in
            XCTAssertTrue(status, "Search failed")
            XCTAssertNotNil(data as? [String])
            let array = data as! [String]
            XCTAssertEqual(array.count, 0)
            expecttation.fulfill()
        }

        wait(for: [expecttation], timeout: 5.0)
    }
    
    func testDataReturnedByPresenterIsSoretdIncreasingly() {
        let expecttation = XCTestExpectation.init(description: "Asyn test")
        sut.getCitiesWithPrefix(searchString: "alaba") { status, data in
            XCTAssertTrue(status, "Search failed")
            XCTAssertNotNil(data as? [String])
            let array = data as! [String]
            XCTAssertEqual(array.count, 4)
            XCTAssertEqual(array[0],"alabama")
            XCTAssertEqual(array[3], "alabat")
            expecttation.fulfill()
        }

        wait(for: [expecttation], timeout: 5.0)
    }
    
    // below commented code explains the outline for test function when data mocking and injection is used
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
    
    
}
