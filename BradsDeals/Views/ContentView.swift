//
//  ContentView.swift
//  BradsDeals
//
//  Created by David Williams on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = DealsViewModel()
    @State var filterSheetPresented = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    filterButton
                    Spacer()
                }
                .padding()

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
            .sheet(isPresented: $filterSheetPresented) {
                filter
            }
        }
    }

    private var filterButton: some View {
        Button {
            filterSheetPresented = true
        } label: {
            HStack {
                Image(systemName: "slider.horizontal.3")
                Text("Filter")
            }
        }
    }

    private var filter: some View {
        VStack {
            filterHeader
            HStack {
                CheckmarksView(selectedOptions: $viewModel.filterOptions)
                    .padding()
                Spacer()
            }
            Spacer()

            Button {
                viewModel.loadDeals()
                filterSheetPresented = false
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 60)
                        .foregroundColor(.teal)
                        .cornerRadius(40)
                    Text("Apply")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.white)
                }
            }
            .padding(.horizontal, 40)
            .buttonStyle(.plain)
        }
    }

    private var filterHeader: some View {
        HStack {
            Button {
                filterSheetPresented = false
            } label: {
                Text("Cancel")
                    .font(.title2)
            }
            Spacer()
            Text("Filter")
                .font(.title)

            Spacer()

            Button {
                viewModel.filterOptions.removeAll()
            } label: {
                Text("Clear")
                    .font(.title2)
            }
        }
        .padding()
    }
}

struct CheckmarksView: View {
    @Binding var selectedOptions: Set<Gender>

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Gender.allCases, id: \.self) { option in
                CheckmarkButton(option: option, isSelected: selectedOptions.contains(option)) {
                    if selectedOptions.contains(option) {
                        selectedOptions.remove(option)
                    } else {
                        selectedOptions.insert(option)
                    }
                }
            }
            .padding(2)
        }
    }
}

// Single Checkmark Button
struct CheckmarkButton: View {
    let option: Gender
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                Text(option.stringRepresentation())
                    .font(.title2)
            }
            .foregroundColor(isSelected ? .blue : .primary)
        }
    }
}

#Preview {
    ContentView(filterSheetPresented: true)
}
