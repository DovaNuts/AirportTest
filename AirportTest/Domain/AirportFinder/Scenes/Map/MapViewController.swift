//
//  MapViewController.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import UIKit
import MapKit

protocol MapDisplayLogic: AnyObject {
    func displayAirportPins(viewModel: Map.LoadPinList.ViewModel)
}

class MapViewController: UIViewController {
    var interactor: MapBusinessLogic?
    var router: (NSObjectProtocol & MapRoutingLogic & MapDataPassing)?
    
    @IBOutlet weak var mapView: MKMapView!
    
    var pinList: [MKPointAnnotation] = []
    
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
        let interactor = MapInteractor()
        let presenter = MapPresenter()
        let router = MapRouter()
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
        
        setupMap()
    }
    
    func setupMap() {
        interactor?.loadMapPins()
    }
}

extension MapViewController: MapDisplayLogic {
    func displayAirportPins(viewModel: Map.LoadPinList.ViewModel) {
        pinList = viewModel.pins
        mapView.showAnnotations(pinList, animated: true)
    }
}
