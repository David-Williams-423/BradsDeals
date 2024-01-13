//
//  APIService.swift
//  BradsDeals
//
//  Created by David Williams on 1/12/24.
//

import Foundation

class APIService {
    static let shared = APIService() // Singleton instance

    private let urlString = "http://content-static.bradsdeals.com/api/v1/deals.json"
    private let decoder = JSONDecoder()

    private init() {}

    func fetchDeals() async throws -> Deals {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let dealsResponse = try decoder.decode(Deals.self, from: data)
        return dealsResponse
    }
}
