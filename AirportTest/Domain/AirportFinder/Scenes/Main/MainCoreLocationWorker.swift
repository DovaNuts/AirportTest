//
//  CoreLocationWorker.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import Foundation
import CoreLocation

class MainCoreLocationWorker: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var interactor: MainBusinessLogic?
    
    override init() {
        super.init()
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
        
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            interactor?.updateCurrentLocation(location.coordinate)
        }
    }
}
