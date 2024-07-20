//
//  groceryModel.swift
//  MarketMate
//
//  Created by Cameryn Smith on 7/19/24.
//

import SwiftUI
import Foundation

struct groceryModel: View {
    struct GroceryItem: Identifiable {
        var id = UUID()
        var name: String
    }
    
    struct Grocerylist: Identifiable {
        var id = UUID()
        var name: String
        var items: [GroceryItem]
    }
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    groceryModel()
}
