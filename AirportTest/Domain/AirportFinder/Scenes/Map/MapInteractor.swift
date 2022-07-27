//
//  MapInteractor.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import Foundation
import MapKit

protocol MapBusinessLogic {
    func loadMapPins()
}

protocol MapDataStore {
    var airports: [Airport] { get set }
    var location: CLLocationCoordinate2D { get set }
}

class MapInteractor: MapBusinessLogic, MapDataStore {
    var presenter: MapPresentationLogic?
    
    var airports: [Airport] = []
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D()
        
    func loadMapPins() {
        let response = Map.LoadPinList.Response(airports: airports)
        presenter?.presentMapPins(response: response)
    }
}
