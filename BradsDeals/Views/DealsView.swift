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
        ForEach(deals, id: \.id) { deal in
            DealRowView(deal: deal)
        }
    }
}

#Preview {
    ContentView()
}
