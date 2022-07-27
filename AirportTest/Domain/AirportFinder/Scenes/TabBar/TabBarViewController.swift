//
//  TabBarViewController.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import UIKit

protocol TabBarDisplayLogic: AnyObject {}

class TabBarViewController: UITabBarController, TabBarDisplayLogic {
    var interactor: TabBarBusinessLogic?
    var router: (NSObjectProtocol & TabBarRoutingLogic & TabBarDataPassing)?
    
    var airports: [Airport] = []
        
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = TabBarInteractor()
        let presenter = TabBarPresenter()
        let router = TabBarRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildViews()
    }
    
    func setupChildViews() {
        let mapViewController = viewControllers![0] as! MapViewController
        let airportListViewController = viewControllers![1] as! AirportListViewController
        
        var mapDS = mapViewController.router!.dataStore!
        var airportListDS = airportListViewController.router!.dataStore!
        
        router?.passDataToMap(source: router!.dataStore!, destination: &mapDS)
        router?.passDataToAirportList(source: router!.dataStore!, destination: &airportListDS)
    }
}
