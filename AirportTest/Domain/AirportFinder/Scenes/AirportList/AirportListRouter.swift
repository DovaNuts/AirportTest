//
//  AirportListRouter.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import Foundation

protocol AirportListRoutingLogic {}

protocol AirportListDataPassing {
    var dataStore: AirportListDataStore? { get }
}

class AirportListRouter: NSObject, AirportListRoutingLogic, AirportListDataPassing {
    weak var viewController: AirportListViewController?
    var dataStore: AirportListDataStore?
}
