//
//  DealsView.swift
//  BradsDeals
//
//  Created by David Williams on 1/12/24.
//

import SwiftUI

struct DealsView: View {
    @State var deals: [Deal]
    var body: some View {
        LazyVStack {
            ForEach(deals, id: \.id) { deal in
                NavigationLink(destination: DetailView(deal: deal), label: {
                    DealRowView(deal: deal)

                })
                .buttonStyle(.plain)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
