//
//  MainInteractor.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 24/07/22.
//

import Foundation
import MapKit

protocol MainBusinessLogic {
    func updateCurrentLocation(_ newLocation: CLLocationCoordinate2D)
    func getRadius(_ selectedRadius: Float)
    func fetchAirportList() async
    func tryToFetchAirportList()
}

protocol MainDataStore {
    var airports: [Airport] { get set }
    var location: CLLocationCoordinate2D { get set }
}

class MainInteractor: MainBusinessLogic, MainDataStore {
    var presenter: MainPresentationLogic?
    var coreLocationWorker: MainCoreLocationWorker?
    var networkWorker = MainNetworkWorker()
    
    var airports: [Airport] = []
    var radius: Int = 0
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D()
    let url = "https://aviation-reference-data.p.rapidapi.com/airports/search?"
    
    func updateCurrentLocation(_ newLocation: CLLocationCoordinate2D) {
        location = newLocation
    }
    
    func getRadius(_ selectedRadius: Float) {
        radius = Int(selectedRadius)
        presenter?.presentRadius(radius)
    }
    
    func fetchAirportList() async {        
        guard let url = URL(string: url + "lat=\(location.latitude)&lon=\(location.longitude)&radius=\(radius)") else {
            return
        }
        
        do {
            airports = try await networkWorker.fetchAirportList(from: url)
        } catch {
            print(error)
        }
    }
    
    func tryToFetchAirportList() {
        if location.latitude.isZero && location.longitude.isZero {
            presenter?.presentLocationError()
        } else {
            presenter?.presentAirportList()
        }
    }
}
