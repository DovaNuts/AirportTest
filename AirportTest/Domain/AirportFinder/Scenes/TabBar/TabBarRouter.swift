//
//  TabBarRouter.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import Foundation
import UIKit

protocol TabBarRoutingLogic {
    func passDataToMap(source: TabBarDataStore, destination: inout MapDataStore)
    func passDataToAirportList(source: TabBarDataStore, destination: inout AirportListDataStore)
}

protocol TabBarDataPassing {
    var dataStore: TabBarDataStore? { get }
}

class TabBarRouter: NSObject, TabBarRoutingLogic, TabBarDataPassing {
    weak var viewController: TabBarViewController?
    var dataStore: TabBarDataStore?
    
    // MARK: Passing data
    func passDataToMap(source: TabBarDataStore, destination: inout MapDataStore) {
        destination.airports = source.airports
        destination.location = source.location
    }

    func passDataToAirportList(source: TabBarDataStore, destination: inout AirportListDataStore) {
        destination.airports = source.airports
        destination.location = source.location
    }
}
