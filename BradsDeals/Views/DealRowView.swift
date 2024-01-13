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
            AsyncImage(url: URL(string: deal.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(deal.headline)
                    .bold()
                Text(.init(Utils.shared.formatMarkdown(text: deal.descriptionPreview)))
                    .font(.caption)
                    .lineLimit(2)
                Text("Posted by \(deal.editor)")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .padding(.vertical, 2)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    DealsView(deals: [Deal.sampleDeal, Deal.sampleDeal, Deal.sampleDeal, Deal.sampleDeal])
}
