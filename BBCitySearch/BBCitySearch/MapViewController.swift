//
//  MapViewController.swift
//  BBCitySearch
//
//  Created by Shubham Sharma on 06/03/2020.
//  Copyright © 2020 Shubham Sharma. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {
    
    lazy var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: 33.0000, longitude: 33.000)
    
    var cityName: String?
    
    private var city: City?
    
    private var cityDict:[String:City] {
        get {
            return CityNamesDataStore.shared.getCities()
        }
    }
    
    @IBOutlet weak var mapview: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = cityName
        mapview.mapType = .hybridFlyover
        mapview.camera.centerCoordinate = coordinate
        let cityPin = MKPointAnnotation()
        cityPin.title = city?.name
        cityPin.coordinate = coordinate
        mapview.addAnnotation(cityPin)
    }
    
    func setupMapView(cityName:String) {
        self.cityName = cityName
        if let city = cityDict[cityName]{
            self.city = city
            coordinate = CLLocationCoordinate2D.init(latitude: CLLocationDegrees( city.coord.lat), longitude:  CLLocationDegrees(city.coord.lon))
        }
    }
}
