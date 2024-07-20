//
//  groupView.swift
//  MarketMate
//
//  Created by Cameryn Smith on 7/19/24.
//

import SwiftUI
import Foundation

struct groupView: View {
    
    struct GroceryItem: Identifiable {
        var id = UUID()
        var name: String
    }
    
    struct GroceryList: Identifiable {
        var id = UUID()
        var name: String
        var items: [GroceryItem]
    }
    
   
    
    var body: some View {
        Text("Hello, Pekalis!")
    }
}

#Preview {
    groupView()
}
