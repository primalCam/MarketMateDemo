import SwiftUI

struct GroceryListView: View {
    var list: GroceryList
    
    var body: some View {
        VStack {
            List {
                ForEach(list.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("Qty: \(item.quantity)")
                    }
                }
            }
        }
        .navigationTitle(list.name)
    }
}

struct GroceryListView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleList = GroceryList(name: "Sample List", items: [
            GroceryItem(name: "Apples", quantity: 2),
            GroceryItem(name: "Bananas", quantity: 5)
        ])
        GroceryListView(list: sampleList)
    }
}
