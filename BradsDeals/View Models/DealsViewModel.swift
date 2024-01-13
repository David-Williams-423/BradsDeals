//
//  DealsViewModel.swift
//  BradsDeals
//
//  Created by David Williams on 1/12/24.
//

import Foundation

enum DataState {
    case loading
    case success([Deal])
    case failure(Error)
}

@MainActor
class DealsViewModel: ObservableObject {
    @Published var state: DataState = .loading
    @Published var filterOptions: Set<Gender> = []
    private var allDeals: [Deal] = []

    init() {
        loadDeals()
    }

    func loadDeals() {
        state = .loading
        Task {
            do {
                let response = try await APIService.shared.fetchDeals()
                self.allDeals = response.deals
                self.applyGenderFilter() 

            } catch {
                self.state = .failure(error)
            }
        }
    }

    func applyGenderFilter() {
        if filterOptions.isEmpty {
            state = .success(allDeals) // Show all deals if no filter is applied
        } else {
            let filteredDeals = allDeals.filter { deal in
                filterOptions.contains(deal.gender)
            }
            state = .success(filteredDeals)
        }
    }
}
