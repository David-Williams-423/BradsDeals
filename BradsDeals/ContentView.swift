//
//  ContentView.swift
//  BradsDeals
//
//  Created by David Williams on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = "loading"
    var body: some View {
        VStack {
            Button {
                Task {
                    do {
                        let response = try await APIService.shared.fetchDeals()
                        print(response.count)
                        text = response.deals.first!.description 
                    } catch {
                        print("error")
                    }
                }
            } label: {
                Text("Button")
            }
            
            Text(text)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
