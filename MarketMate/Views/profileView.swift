import SwiftUI

struct profileView: View {
    @StateObject private var viewModel = GroceryViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.groceryLists) { list in
                        NavigationLink(destination: GroceryListView(list: list)) {
                            Text(list.name)
                        }
                    }
                }
            }
            .navigationTitle("Grocery Lists")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddListView(viewModel: viewModel)) {
                        Text("Add New List")
                    }
                }
            }
        }
    }
}

#Preview {
    profileView()
}
