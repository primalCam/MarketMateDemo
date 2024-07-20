import SwiftUI

struct addListView: View {
    @ObservedObject var viewModel: groceryViewModel
    @State private var listName: String = ""
    @State private var itemNames: [String] = [""]
    
    var body: some View {
        Form {
            Section(header: Text("List Name")) {
                TextField("Enter list name", text: $listName)
            }
            
            Section(header: Text("Items")) {
                ForEach(0..<itemNames.count, id: \.self) { index in
                    TextField("Enter item name", text: $itemNames[index])
                        .onChange(of: itemNames[index]) { newValue in
                            if index == itemNames.count - 1 && !newValue.isEmpty {
                                itemNames.append("")
                            }
                        }
                }
            }
            
            Button("Add List") {
                // Create grocery items from item names
                let items = itemNames.filter { !$0.isEmpty }.map { groceryModel.GroceryItem(name: $0) }
                viewModel.addList(name: listName, items: items)
                // Clear inputs
                listName = ""
                itemNames = [""]
            }
        }
        .navigationTitle("Add New List")
    }
}

struct addListView_Previews: PreviewProvider {
    static var previews: some View {
        addListView(viewModel: groceryViewModel())
    }
}
