//
//  homeChildView.swift
//  MarketMate
//
//  Created by Cameryn Smith on 7/16/24.
// This is the modal view for add/edit/delete

import SwiftUI

struct homeChildView: View {
    @Environment (\.dismiss) private var dismissModal
    @StateObject private var viewModel = GroceryViewModel()
    @State private var searchQuery = ""

    
    
    struct GroceryItem: Identifiable {
        let id = UUID()
        var name: String
    }
    
    class GroceryViewModel: ObservableObject {

        @Published var items: [GroceryItem] = [
            GroceryItem(name: "Apples"),
            GroceryItem(name: "Oranges"),
            GroceryItem(name: "Peaches")
        ]
        
        func deleteItem(at Offsets: IndexSet) {
            items.remove(atOffsets: Offsets)
        }
        
        func addItem(name: String) {
                 let newItem = GroceryItem(name: name)
                 items.append(newItem)
             }
    }
    
    var body: some View {
            List {
                HStack {
                    TextField("Add items..", text: $searchQuery)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        if !searchQuery.isEmpty {
                            viewModel.addItem(name: searchQuery)
                            searchQuery = ""
                        }
                    }) {
                       Image(systemName: "plus")
                    }
                }
                ForEach($viewModel.items) { $item in
                    TextField("Enter Text", text: $item.name)
                        .swipeActions {
                            Button(role: .destructive) {
                                if let index = viewModel.items.firstIndex(where: { $0.id == item.id }) {
                                    viewModel.items.remove(at: index)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red)
                        }
                }
                .onDelete(perform: viewModel.deleteItem)
            }
        
    }
}

#Preview {
    homeChildView()
}
