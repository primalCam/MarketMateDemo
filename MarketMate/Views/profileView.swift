//
//  profileView.swift
//  MarketMate
//
//  Created by Cameryn Smith on 7/16/24.
//

import SwiftUI

struct profileView: View {
    @State private var showModal: Bool = false
    @State private var searchQuery = ""
    @State private var testItems = ["Apples", "Oranges", "Peaches"]
    
    var filteredItems: [String] {
        if searchQuery.isEmpty {
            return testItems
        } else {
            return testItems.filter() {
                $0.localizedCaseInsensitiveContains(searchQuery)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            HStack {
                TextField("Add new item..", text: $searchQuery)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Add") {
                    if !searchQuery.isEmpty {
                        testItems.append(searchQuery)
                        searchQuery = ""
                    }
                }
                .padding()
            }
            
            
            List() {
                ForEach(filteredItems, id: \.self) { item in
                    Text(item)
                }
            }
            .padding()
            .listStyle(.automatic)
        }
    }
}

#Preview {
    profileView()
}
