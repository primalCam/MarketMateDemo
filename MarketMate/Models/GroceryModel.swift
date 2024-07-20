//
//  GroceryModel.swift
//  MarketMate
//
//  Created by Cameryn Smith on 7/19/24.
//

import Foundation
// Defined my data model for Grocery items in a list

struct GroceryItem: Identifiable {
    var id = UUID()
        var name: String
        var quantity: Int
}


struct GroceryList: Identifiable {
    var id = UUID()
    var name: String
    var items: [GroceryItem] = []
}
