//
//  MainPresenter.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 24/07/22.
//

import Foundation

protocol MainPresentationLogic {
    func presentRadius(_ radius: Int)
    func presentLocationError()
    func presentAirportList()
}

class MainPresenter: MainPresentationLogic {
    weak var viewController: MainDisplayLogic?
    
    func presentRadius(_ radius: Int) {
        viewController?.displayRadius(String(radius))
    }
    
    func presentLocationError() {
        viewController?.displayLocationError()
    }
    
    func presentAirportList() {
        viewController?.fetchAirportList()
    }
}
