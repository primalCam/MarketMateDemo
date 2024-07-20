//
//  GroceryViewModel.swift
//  MarketMate
//
//  Created by Cameryn Smith on 7/19/24.
//

import SwiftUI

class GroceryViewModel: ObservableObject {
    @Published var groceryLists: [GroceryList] = []
    
    //Function to add new grocery lists
    func addList(name: String, items: [GroceryItem] = []) {
        let newList = GroceryList(name: name, items: items)
        groceryLists.append(newList)
    }
}
