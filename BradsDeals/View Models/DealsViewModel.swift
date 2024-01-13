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

class DealsViewModel: ObservableObject {
    @Published var state: DataState = .loading

    init() {
        loadDeals()
    }

    func loadDeals() {
        state = .loading
        Task {
            do {
                let response = try await APIService.shared.fetchDeals()
                DispatchQueue.main.async {
                    self.state = .success(response.deals)
                }
            } catch {
                DispatchQueue.main.async {
                    self.state = .failure(error)
                }
            }
        }
    }
    
    
}
