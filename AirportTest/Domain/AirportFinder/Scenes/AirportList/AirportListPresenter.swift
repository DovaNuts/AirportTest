//
//  AirportListPresenter.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import Foundation

protocol AirportListPresentationLogic {
    func displayAirportList(response: AirportList.LoadAirportList.Response)
}

class AirportListPresenter: AirportListPresentationLogic {
    weak var viewController: AirportListDisplayLogic?
    
    func displayAirportList(response: AirportList.LoadAirportList.Response) {
        let viewModel = AirportList.LoadAirportList.ViewModel(airports: response.airports)
        viewController?.displayAirportList(viewModel: viewModel)
    }
}
