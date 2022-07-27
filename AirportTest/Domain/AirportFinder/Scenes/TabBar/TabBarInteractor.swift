//
//  TabBarInteractor.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import Foundation
import MapKit

protocol TabBarBusinessLogic {}

protocol TabBarDataStore {
    var airports: [Airport] { get set }
    var location: CLLocationCoordinate2D { get set }
}

class TabBarInteractor: TabBarBusinessLogic, TabBarDataStore {
    var presenter: TabBarPresentationLogic?
    
    var airports: [Airport] = []
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D()
}
