//
//  AirportListInteractor.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import Foundation
import MapKit

protocol AirportListBusinessLogic {
    func loadAirportList()
}

protocol AirportListDataStore {
    var airports: [Airport] { get set }
    var location: CLLocationCoordinate2D { get set }
}

class AirportListInteractor: AirportListBusinessLogic, AirportListDataStore {
    var presenter: AirportListPresentationLogic?
    
    var airports: [Airport] = []
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    func loadAirportList() {
        let currentLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        var sortedAirportList = [Airport]()
        
        for var airport in airports {
            let airportLocation = CLLocation(latitude: airport.latitude!, longitude: airport.longitude!)
            airport.distance = currentLocation.distance(from: airportLocation)/1000
            sortedAirportList.append(airport)
        }

        sortedAirportList = sortedAirportList.sorted(by: {$0.distance! < $1.distance!})
        
        let response = AirportList.LoadAirportList.Response(airports: sortedAirportList)
        
        presenter?.displayAirportList(response: response)
    }
}
