//
//  MainViewController.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 24/07/22.
//

import UIKit

protocol MainDisplayLogic: AnyObject {
    func displayRadius(_ radius: String)
    func displayLocationError()
    func fetchAirportList()
}

class MainViewController: UIViewController {
    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?
    
    @IBOutlet weak var radiusLabel: UILabel!
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var searchButton: UIButton!
    
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
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        let coreLocationWorker = MainCoreLocationWorker()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.coreLocationWorker = coreLocationWorker
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        coreLocationWorker.interactor = interactor
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        interactor?.tryToFetchAirportList()
    }
    
    @IBAction func radiusSliderChanged(_ sender: Any) {
        interactor?.getRadius(radiusSlider.value)
    }
}

extension MainViewController: MainDisplayLogic {
    func fetchAirportList() {
        interactor?.getRadius(radiusSlider.value)
        
        Task {
            await interactor?.fetchAirportList()
            router?.routeToTabBarController(segue: nil)
        }
    }
    
    func displayLocationError() {
        let title = "Error"
        let message = "This app has no access to your current location"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayRadius(_ radius: String) {
        radiusLabel.text = radius
    }
    
}
