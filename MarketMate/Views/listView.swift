//
//  listView.swift
//  MarketMate
//
//  Created by Cameryn Smith on 7/19/24.
//

import SwiftUI
import Combine

struct listView: View {
    
    class GroceryViewModel: ObservableObject {
        @Published var groceryLists: [GroceryList] = []
        
        func addList(name: String, items: [GroceryItem]) {
            let newList = GroceryList(name: name, items: items)
            groceryLists.append(newList)
        }
    }
    
    var body: some View {
        Text("Hello, Pekalis!")
    }
}

#Preview {
    listView()
}
