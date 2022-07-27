//
//  MapRouter.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import Foundation

protocol MapRoutingLogic {}

protocol MapDataPassing {
    var dataStore: MapDataStore? { get }
}

class MapRouter: NSObject, MapRoutingLogic, MapDataPassing {
    weak var viewController: MapViewController?
    var dataStore: MapDataStore?
}
