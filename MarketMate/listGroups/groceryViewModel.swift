//
//  groceryViewModel.swift
//  MarketMate
//
//  Created by Cameryn Smith on 7/19/24.
//

import SwiftUI
import Combine

struct groceryViewModel: View {
    
    class GroceryViewModel: ObservableObject {
        @Published var groceryLists: [groceryModel.Grocerylist] = []
        
        func addList(name: String, items: [groceryModel.GroceryItem]) {
            let newList = groceryModel.Grocerylist(name: name, items: items)
            groceryLists.append(newList)
        }
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    groceryViewModel()
}
