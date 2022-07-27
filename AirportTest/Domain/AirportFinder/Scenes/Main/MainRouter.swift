//
//  MainRouter.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 24/07/22.
//

import Foundation
import UIKit

protocol MainRoutingLogic {
    func routeToTabBarController(segue: UIStoryboardSegue?)
}

protocol MainDataPassing {
    var dataStore: MainDataStore? { get }
}

class MainRouter: NSObject, MainRoutingLogic, MainDataPassing {
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
    
    // MARK: Routing Logic
    func routeToTabBarController(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! TabBarViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToTabBarController(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "AirportFinder", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToTabBarController(source: dataStore!, destination: &destinationDS)
            navigateToTabBarController(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    func navigateToTabBarController(source: MainViewController, destination: TabBarViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    func passDataToTabBarController(source: MainDataStore, destination: inout TabBarDataStore) {
        destination.airports = source.airports
        destination.location = source.location
    }
}
