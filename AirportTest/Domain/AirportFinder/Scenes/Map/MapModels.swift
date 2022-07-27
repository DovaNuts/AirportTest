//
//  MapModels.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import Foundation
import MapKit

enum Map {
    enum LoadPinList {
        struct Request {}
        struct Response {
            let airports: [Airport]
        }
        struct ViewModel {
            let pins: [MKPointAnnotation]
        }
    }
}
