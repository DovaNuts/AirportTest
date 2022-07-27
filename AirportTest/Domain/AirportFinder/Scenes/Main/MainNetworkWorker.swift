//
//  MainNetworkWorker.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 24/07/22.
//

import Foundation

class MainNetworkWorker {
    func fetchAirportList(from url: URL) async throws -> [Airport] {
        let headers = [
            "X-RapidAPI-Key": "2f0cc761f7msh9726059d7ee853cp105817jsn86360f8a73f5",
            "X-RapidAPI-Host": "aviation-reference-data.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let (data, _) = try await URLSession.shared.data(for: request as URLRequest)
        return try JSONDecoder().decode([Airport].self, from: data)
    }
}
