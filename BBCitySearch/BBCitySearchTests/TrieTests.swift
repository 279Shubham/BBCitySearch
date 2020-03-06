//
//  TrieTests.swift
//  BBCitySearchTests
//
//  Created by Shubham Sharma on 02/03/2020.
//  Copyright © 2020 Shubham Sharma. All rights reserved.
//

import Foundation
@testable import BBCitySearch
import XCTest

class TrieTests: XCTestCase {
    
    var sut: Trie!
    
    override func setUp() {
       sut = Trie()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testTrie() {
        // datastore should be mocked instead of using actual singleton,
        CityNamesDataStore.shared.setupCityLocalStorage()
        let trie = CityNamesDataStore.shared.getCityNamesTrie()
        var characterArray:[Character] = []
        let array = trie.query(searchString: "ala")
        XCTAssertTrue(array?.count == 149)
    }
    func testTrieSet1(){
        let trie = CityNamesDataStore.shared.getCityNamesTrie()
        let nameArray = trie.query(searchString: "ala")
        XCTAssertTrue(nameArray!.contains("alabama"))
        XCTAssertTrue(nameArray!.contains("alac"))
    }

    func testWhenStringsContainCapitalLetters() {
//        sut.insert("Alabama")
//        sut.insert("alabamamana")
        let trie = CityNamesDataStore.shared.getCityNamesTrie()
        let nameArray = trie.query(searchString:"Ala")
        XCTAssertTrue(nameArray!.contains("alabama"))
        XCTAssertTrue(nameArray!.contains("alacam"))
    }

    func testWhenSavedStringsAreDistinctThanSearchStringNoValueIsReturned() {
        let trie = CityNamesDataStore.shared.getCityNamesTrie()
        let nameArray = trie.query(searchString:"123")
        XCTAssertTrue(nameArray!.count == 0)
    }

    func testWhenPrefixStringIsSubstringOfCompleteWordOnTraversalPathThenCompleteWordIsNotReturned() {
        let trie = CityNamesDataStore.shared.getCityNamesTrie()
        let nameArray = trie.query(searchString:"alabama")
        XCTAssertEqual(nameArray![0], "alabama")
        XCTAssertTrue(nameArray!.count == 1)
    }

}
