//
//  MapPresenter.swift
//  BBCitySearch
//
//  Created by Shubham Sharma on 06/03/2020.
//  Copyright © 2020 Shubham Sharma. All rights reserved.
//

import Foundation
import MapKit

protocol MapPresenterProtocol {
    func getMapPoint(forCityName city:String ) -> MKPointAnnotation
}
