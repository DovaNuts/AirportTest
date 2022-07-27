//
//  MapPresenter.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import Foundation
import MapKit

protocol MapPresentationLogic {
    func presentMapPins(response: Map.LoadPinList.Response)
}

class MapPresenter: MapPresentationLogic {
    weak var viewController: MapDisplayLogic?
    
    func presentMapPins(response: Map.LoadPinList.Response) {
        let airports = response.airports
        var pins: [MKPointAnnotation] = []
        
        airports.forEach { airport in
            if airport.longitude != nil && airport.longitude != nil {
                let coordinate = CLLocationCoordinate2D(latitude: airport.latitude!, longitude: airport.longitude!)
                let pin = MKPointAnnotation()
                
                pin.title = airport.name
                pin.coordinate = coordinate
                
                pins.append(pin)
            }
        }
        
        let viewModel = Map.LoadPinList.ViewModel(pins: pins)
        viewController?.displayAirportPins(viewModel: viewModel)
    }
}
