//
//  SearchPresenter.swift
//  BBCitySearch
//
//  Created by Shubham Sharma on 02/03/2020.
//  Copyright © 2020 Shubham Sharma. All rights reserved.
//

import Foundation

protocol SearchCityPresentable {
    func getCitiesWithPrefix(searchString:String, completionBlock: @escaping (_ status:Bool, _ data:Any)->(Void))
}

class SearchCityPresenter: SearchCityPresentable {
    
    lazy var filterQueue: OperationQueue = {
        var queue = OperationQueue()
        
        queue.qualityOfService = .userInitiated
        queue.name = "Filter Queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    lazy var dataSource = CityNamesDataStore.shared
    
    init() {
        filterQueue.qualityOfService = .userInitiated
    }
    
    func getCitiesWithPrefix(searchString: String, completionBlock: @escaping (_ status:Bool, _ data:Any)->(Void)) {
        let cityNamesTrie = dataSource.getCityNamesTrie()
        let operation = BlockOperation.init()
        operation.name = searchString
        
        filterQueue.cancelAllOperations()
        operation.addExecutionBlock {
            let cities = cityNamesTrie.query(searchString: searchString)
            DispatchQueue.main.async {
                completionBlock(true,cities as Any)
            }
        }
        filterQueue.addOperation(operation)
    }
}
