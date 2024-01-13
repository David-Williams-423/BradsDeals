//
//  DetailView.swift
//  BradsDeals
//
//  Created by David Williams on 1/12/24.
//

import SwiftUI

struct DetailView: View {
    var deal: Deal
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                AsyncImage(url: URL(string: deal.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 400)
                            
                    } placeholder: {
                        ProgressView()
                            .frame(height: 400)
                    }
                
                
                VStack(alignment: .leading) {
                    Text(deal.headline)
                        .font(.largeTitle)
                        .bold()
                        
                    Text("Posted by \(deal.editor)")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                    
                    Text(deal.details)
                    
                    HStack {
                        ForEach(deal.categories, id: \.name) { category in
                        
                            Text(category.name)
                            Text("|")
                        }
                        .foregroundColor(.secondary)
                    }
                    
                    Text(.init(Utils.shared.formatMarkdown(text: deal.description)))
                        .font(.title2)
                }
                .padding()
            }
        }
    }
}

#Preview {
    DetailView(deal: Deal.sampleDeal)
}
