//
//  AirportNetworkModel.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 24/07/22.
//

import Foundation
import MapKit

struct Airport: Decodable
{
    let iataCode, icaoCode, name, alpha2CountryCode: String?
    let latitude, longitude: Double?
    
    var distance: Double?
    
    enum CodingKeys: String, CodingKey {
        case iataCode, icaoCode, name
        case alpha2CountryCode = "alpha2countryCode"
        case latitude, longitude
    }
}
