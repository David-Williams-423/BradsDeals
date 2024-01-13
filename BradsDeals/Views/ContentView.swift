//
//  ContentView.swift
//  BradsDeals
//
//  Created by David Williams on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = DealsViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .success(let deals):
                    DealsView(deals: deals)
                case .failure:
                    Text("Failed to load deals.")
                }
            }
            .navigationTitle("Deals")
        }
    }
}

#Preview {
    ContentView()
}
