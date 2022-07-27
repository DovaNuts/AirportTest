//
//  AirportListModels.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import Foundation

enum AirportList {
    enum LoadAirportList {
        struct Request {}
        struct Response {
            let airports: [Airport]
        }
        struct ViewModel {
            let airports: [Airport]
        }
    }
}
