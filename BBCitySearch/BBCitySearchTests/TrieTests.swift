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
        /*
         1. Setup of data store happens in AppDelagate for the purpose of this assignment.
         2. For better results data store should mocked instead of using actual json.
         3. Different app delegate can be written for test target to make tests better and faster.
         */
        sut = CityNamesDataStore.shared.getCityNamesTrie()
    }
    
    override func tearDown() {
    }
    
    func testTrie() {
        // datastore should be mocked instead of using actual singleton,
        
        let array = sut!.query(searchString: "ala")
        XCTAssertTrue(array?.count == 149)
    }
    func testTrieSet1(){
        
        let nameArray = sut.query(searchString: "ala")
        XCTAssertTrue(nameArray!.contains("alabama"))
        XCTAssertTrue(nameArray!.contains("alac"))
    }
    
    func testWhenStringsContainCapitalLetters() {
        
        
        let nameArray = sut.query(searchString:"Ala")
        XCTAssertTrue(nameArray!.contains("alabama"))
        XCTAssertTrue(nameArray!.contains("alacam"))
    }
    
    func testWhenSavedStringsAreDistinctThanSearchStringNoValueIsReturned() {
        let nameArray = sut.query(searchString:"123")
        XCTAssertTrue(nameArray!.count == 0)
    }
    
    func testWhenPrefixStringIsSubstringOfCompleteWordOnTraversalPathThenCompleteWordIsNotReturned() {
        let nameArray = sut.query(searchString:"alabama")
        XCTAssertEqual(nameArray![0], "alabama")
        XCTAssertTrue(nameArray!.count == 1)
    }
    
    func testValuesAreSortedIncreasingly() {
        let array = sut.query(searchString: "alaba")
        XCTAssertEqual(array?.count, 4)
        XCTAssertEqual(array?[0], "alabama")
        XCTAssertEqual(array?[3], "alabat")
    }
    
}
