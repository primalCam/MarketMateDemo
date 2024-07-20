import SwiftUI

struct AddListView: View {
    @ObservedObject var viewModel: GroceryViewModel
    @State private var listName: String = ""
    @State private var itemNames: [String] = [""]
    @State private var itemQuantities: [String] = ["1"]
    @State private var showAlert = false
    
    var body: some View {
        Form {
            Section(header: Text("List Name")) {
                TextField("Enter list name", text: $listName)
            }
            
            Section(header: Text("Items")) {
                ForEach(0..<itemNames.count, id: \.self) { index in
                    HStack {
                        TextField("Enter item name", text: $itemNames[index])
                            .onSubmit {
                                handleItemNameSubmit(at: index)
                            }
                        TextField("Qty", text: binding(for: $itemQuantities, index: index))
                            .keyboardType(.numberPad)
                            .frame(width: 50)
                            .onSubmit {
                                handleQuantitySubmit(at: index)
                            }
                    }
                }
            }
            
            Button("Add List") {
                let items = zip(itemNames, itemQuantities)
                    .filter { !$0.0.isEmpty && Int($0.1) != nil }
                    .map { GroceryItem(name: $0.0, quantity: Int($0.1) ?? 1) }
                if !items.isEmpty {
                    viewModel.addList(name: listName, items: items)
                    listName = ""
                    itemNames = [""]
                    itemQuantities = ["1"]
                    showAlert = true // Show the alert
                }
            }
        }
        .navigationTitle("Add New List")
        .alert(isPresented: $showAlert) {
            Alert(title: Text("List Saved"), message: Text("Your list is saved"), dismissButton: .default(Text("OK")))
        }
    }
    
    private func handleItemNameSubmit(at index: Int) {
        if index == itemNames.count - 1 && !itemNames[index].isEmpty {
            itemNames.append("")
            itemQuantities.append("1")
        }
    }
    
    private func handleQuantitySubmit(at index: Int) {
        if index < itemQuantities.count {
            itemQuantities[index] = itemQuantities[index].filter { "0123456789".contains($0) }
        }
    }
    
    private func binding(for array: Binding<[String]>, index: Int) -> Binding<String> {
        return Binding<String>(
            get: {
                if index < array.wrappedValue.count {
                    return array.wrappedValue[index]
                } else {
                    return ""
                }
            },
            set: { newValue in
                if index < array.wrappedValue.count {
                    array.wrappedValue[index] = newValue
                }
            }
        )
    }
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView(viewModel: GroceryViewModel())
    }
}

//import SwiftUI
//
//struct AddListView: View {
//    @ObservedObject var viewModel: GroceryViewModel
//    @State private var listName: String = ""
//    @State private var itemNames: [String] = ["", ""]
//    @State private var itemQuantities: [String] = ["1", "1"]
//    @State private var showAlert = false
//    
//    var body: some View {
//        Form {
//            Section(header: Text("List Name")) {
//                TextField("Enter list name", text: $listName)
//            }
//            
//            Section(header: Text("Items")) {
//                ForEach(0..<itemNames.count, id: \.self) { index in
//                    HStack {
//                        TextField(index == itemNames.count - 1 ? "New Item" : "Enter item name", text: binding(for: $itemNames, index: index))
//                            .onSubmit {
//                                handleItemNameSubmit(at: index)
//                            }
//                        TextField(index == itemQuantities.count - 1 ? "0" : "Qty", text: binding(for: $itemQuantities, index: index))
//                            .keyboardType(.numberPad)
//                            .frame(width: 50)
//                            .onSubmit {
//                                handleQuantitySubmit(at: index)
//                            }
//                    }
//                }
//            }
//            
//            Button("Add List") {
//                let items = zip(itemNames, itemQuantities)
//                    .filter { !$0.0.isEmpty && Int($0.1) != nil }
//                    .map { GroceryItem(name: $0.0, quantity: Int($0.1) ?? 1) }
//                if !items.isEmpty {
//                    viewModel.addList(name: listName, items: items)
//                    listName = ""
//                    itemNames = ["", ""]
//                    itemQuantities = ["1", "1"]
//                    showAlert = true // Show the alert
//                }
//            }
//        }
//        .navigationTitle("Add New List")
//        .alert(isPresented: $showAlert) {
//            Alert(title: Text("List Saved"), message: Text("Your list is saved"), dismissButton: .default(Text("OK")))
//        }
//    }
//    
//    private func handleItemNameSubmit(at index: Int) {
//        if index == itemNames.count - 1 && !itemNames[index].isEmpty {
//            itemNames.append("")
//            itemQuantities.append("1")
//        }
//    }
//    
//    private func handleQuantitySubmit(at index: Int) {
//        if index == itemQuantities.count - 1 && !itemQuantities[index].isEmpty {
//            itemNames.append("")
//            itemQuantities.append("1")
//        }
//    }
//    
//    private func binding(for array: Binding<[String]>, index: Int) -> Binding<String> {
//        return Binding<String>(
//            get: {
//                if index < array.wrappedValue.count {
//                    return array.wrappedValue[index]
//                } else {
//                    return ""
//                }
//            },
//            set: { newValue in
//                if index < array.wrappedValue.count {
//                    array.wrappedValue[index] = newValue
//                }
//            }
//        )
//    }
//}
//
//struct AddListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddListView(viewModel: GroceryViewModel())
//    }
//}
//
