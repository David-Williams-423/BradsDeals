//
//  DealRowView.swift
//  BradsDeals
//
//  Created by David Williams on 1/12/24.
//

import SwiftUI

struct DealRowView: View {
    let deal: Deal

    var body: some View {
        HStack(alignment: .top) {
            if let imageUrl = URL(string: deal.image) {
                AsyncImage(url: imageUrl) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            }

            VStack(alignment: .leading) {
                Text(deal.headline)
                    .bold()
                Text(.init(Utils.shared.formatMarkdown(text: deal.descriptionPreview)))
                    .font(.caption)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    DealsView(deals: [Deal.sampleDeal, Deal.sampleDeal, Deal.sampleDeal, Deal.sampleDeal])
}
