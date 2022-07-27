//
//  AirportListViewController.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import UIKit

protocol AirportListDisplayLogic: AnyObject {
    func displayAirportList(viewModel: AirportList.LoadAirportList.ViewModel)
}

class AirportListViewController: UIViewController   {
    var interactor: AirportListBusinessLogic?
    var router: (NSObjectProtocol & AirportListRoutingLogic & AirportListDataPassing)?
    
    var airports: [Airport] = []
    
    @IBOutlet weak var tableView: UITableView!
    
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
        let interactor = AirportListInteractor()
        let presenter = AirportListPresenter()
        let router = AirportListRouter()
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
        
        loadAirportList()
    }
    
    func loadAirportList() {
        interactor?.loadAirportList()
    }
}

extension AirportListViewController: AirportListDisplayLogic {
    func displayAirportList(viewModel: AirportList.LoadAirportList.ViewModel) {
        airports = viewModel.airports
        tableView.reloadData()
    }
}

// MARK: Table View Data Source
extension AirportListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "airportCell") as! AirportTableViewCell
        let airport = airports[indexPath.row]
        cell.configure(airport: airport)
        return cell
    }
}
